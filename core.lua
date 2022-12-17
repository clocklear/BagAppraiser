local ADDON_NAME = ...;
local Addon = LibStub("AceAddon-3.0"):NewAddon(select(2, ...), ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0");

local private = {
  atBank = false,
  atGuildBank = false,
  ignoreSet = {},
}

local currentCharacter = UnitName("player")
local currentRealm = GetRealmName()
local currentAccount = THIS_ACCOUNT

local FIRST_PERSONAL_BAG_SLOT = BACKPACK_CONTAINER
local LAST_PERSONAL_BAG_SLOT = BACKPACK_CONTAINER+NUM_BAG_SLOTS+1 -- reagent container
local FIRST_BANK_SLOT = NUM_TOTAL_EQUIPPED_BAG_SLOTS + 1 -- should be 6 in DF
local LAST_BANK_SLOT = NUM_TOTAL_EQUIPPED_BAG_SLOTS + NUM_BANKBAGSLOTS	
local GUILD_BANK_TAB_SLOTS = 98 -- MAX_GUILDBANK_SLOTS_PER_TAB

local AddonDB_Defaults = {
	global = {
		Characters = {
			['*'] = {					-- ["Realm.Name"] 
			},
		},
  },
  profile = {
    newFeatures = {},
    minimapIcon = { hide = false, minimapPos = 220, radius = 80, },
    pricesource = {
      source = "DBMarket" 
    },
    ldbsource = "combinedtotal",
    topContributors = {
      enabled = true,
      limit = 5,
    },
    guildBank = {
      enabled = false,
    },
    qualityFilter = {
      value = "1",
      enabled = true,
    },
    itemFilter = {
      items = {},
      enabled = false,
    },
  },
}

function Addon:OnInitialize()
  Addon.db = LibStub("AceDB-3.0"):New(ADDON_NAME .. "DB", AddonDB_Defaults, true) -- set true to prefer 'Default' profile as default
  Addon.db.RegisterCallback(Addon, "OnProfileChanged", "UpdateData")
  Addon.db.RegisterCallback(Addon, "OnProfileCopied", "UpdateData")
  Addon.db.RegisterCallback(Addon, "OnProfileReset", "UpdateData")
  Addon:InitializeDataBroker();
end

function Addon:OnEnable()
  private.PreparePriceSources();

  Addon:RegisterChatCommand("ba", private.chatCmdShowConfig)

  Addon:RegisterEvent("BAG_UPDATE_DELAYED", private.OnBagUpdateDelayed)
  Addon:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW", function(event, arg)
    if arg == 8 then -- bank
      private.OnBankFrameOpened()
    end
    if arg == 10 then -- gbank
      private.OnGuildBankFrameOpened();
    end
  end)
  Addon:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_HIDE", function(event, arg)
    if arg == 8 then -- bank
      private.OnBankFrameClosed();
    end
    if arg == 10 then -- gbank
      private.OnGuildBankFrameClosed();
    end
  end)

  Addon:Print(format("%s loaded.  Type '/ba' to open the config.", Addon.CONST.METADATA.VERSION))
  Addon.HandleWhatsNew()
end

function Addon.HandleWhatsNew()
  -- Shown ignore list?
  if not Addon.GetFromDb("newFeatures", "ignoreList") then
    Addon:Print("NEW -- BagAppraiser now supports ignoring specific items!  Check the config window for more details.")
    Addon.db.profile.newFeatures.ignoreList = true;
  end
end

function Addon:UpdateData()
  local buildTopContributors = Addon.GetFromDb("topContributors", "enabled")
  local topContributorsLimit = Addon.GetFromDb("topContributors", "limit")
  Addon.Debug.Log("UpdateData() started")

  -- Do this one for performance reasons
  private.ignoreSet = private.getIgnoredItemSet();

  -- Iterate personal bags
  local bagTopContributors = {};
  for k, v in pairs(private.GetPersonalBagIDs()) do
    local bagValue = private.ValuateBag(k)
    private.SaveValue("Bag", k, bagValue.value)
    if buildTopContributors then
      private.insertContributors(bagTopContributors, bagValue.items)
    end
  end
  if buildTopContributors then
    private.persistTopContributors("Bag", bagTopContributors, topContributorsLimit)
  end

  -- If at the bank, iterate those bags
  if private.atBank then
    local bankTopContributors = {};
    for k, v in pairs(private.GetBankBagIDs()) do
      local bagValue = private.ValuateBag(k)
      private.SaveValue("Bag", k, bagValue.value)
      private.SaveBankLastUpdated(time())
      if buildTopContributors then
        private.insertContributors(bankTopContributors, bagValue.items)
      end
    end
    if buildTopContributors then
      private.persistTopContributors("Bank", bankTopContributors, topContributorsLimit)
    end
  end

  -- If at the gbank and option is enabled, iterate those bags
  if private.atGuildBank and Addon.GetFromDb("guildBank", "enabled") then
    local gbankTopContributors = {};
    for tab = 1, GetNumGuildBankTabs() do
      -- Addon.Debug.Log(format("GBANK: evaluate bag %d", tab));
      local tabValue = private.ValuateGBankTab(tab)
      private.SaveValue("GBankTab", tab, tabValue.value)
      private.SaveGBankLastUpdated(time())
      if buildTopContributors then
        private.insertContributors(gbankTopContributors, tabValue.items) 
      end
    end
    if buildTopContributors then
      private.persistTopContributors("GuildBank", gbankTopContributors, topContributorsLimit)
    end
  end

  local bankLastUpdated = private.GetBankLastUpdated();
  if bankLastUpdated then
    Addon:UpdateBankLastUpdatedText(date("%x %X", bankLastUpdated))
  end
  local gbankLastUpdated = private.GetGBankLastUpdated();
  if gbankLastUpdated then
    Addon:UpdateGBankLastUpdatedText(date("%x %X", gbankLastUpdated));
  end

  private.RecalculateTotals();

  Addon.Debug.Log("UpdateData() complete")
end

function Addon.GetFromDb(grp, key, ...)
  if not key then
    return Addon.db.profile[grp]
  end 
  return Addon.db.profile[grp][key]
end

function private.insertContributors(targetTbl, itemsTbl)
  -- walk the items tbl
  for itemLink, v in pairs(itemsTbl) do
    -- Addon.Debug.Log(format(" insertContributors(): checking %s", itemLink))
    -- is this item already in the table?
    if targetTbl[itemLink] then
      -- increment the existing count
      -- Addon.Debug.Log(format(" insertContributors(): appending %dx %s", v.count, itemLink))
      targetTbl[itemLink].count = targetTbl[itemLink].count + v.count
    else
      -- wasnt already in the table, append
      -- Addon.Debug.Log(format(" insertContributors(): inserting %dx %s", v.count, itemLink))
      targetTbl[itemLink] = v
    end
  end
end

function private.persistTopContributors(type, items, limit)
  -- Convert to a standard integer-indexed array
  local topContributors = private.convertContributorTableToArray(items);
  -- Sort by value desc
  table.sort(topContributors, function (a, b) return a.totalValue > b.totalValue end)
  -- Take the top N results
  topContributors = private.limitTopContributors(topContributors, limit);
  -- Persist
  private.SetTopContributors(type, topContributors);
end

function private.convertContributorTableToArray(contributorTbl)
  local result = {};
  local idx = 1;
  for k, v in pairs(contributorTbl) do
    result[idx] = v;
    idx = idx + 1;
  end
  return result;
end

function private.limitTopContributors(targetTbl, limit)
  -- empty array? return
  local tableLen = table.getn(targetTbl)
  if tableLen == 0 then
    return {};
  end 
  -- do we have less than 'limit' items? if so, just return what we have
  if table.getn(targetTbl) <= limit then
    return targetTbl;
  end
  -- limit to top 'limit' results and return
  local result = {};
  for i = 1, limit do
    result[i] = targetTbl[i]
  end
  return result
end

function private.OnBagUpdateDelayed()
  Addon:UpdateData();
end

function private.OnBankFrameOpened()
  private.atBank = true;
  Addon:UpdateData();
end

function private.OnBankFrameClosed()
  private.atBank = false;
end

function private.OnGuildBankFrameOpened()
  private.atGuildBank = true;
  Addon:UpdateData();
end

function private.OnGuildBankFrameClosed()
  private.atGuildBank = false;
end

function private.ValuateBag(bag)
  local result = {
    value = 0,
    items = {},
  }
  local size = C_Container.GetContainerNumSlots(bag);
	if size > 0 then
		for slot = 1, size do

      -- Grab the itemlink
      local itemLink = C_Container.GetContainerItemLink(bag, slot);

      if itemLink then
        -- Lets skip bound items for now
        local isBoundItem = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bag, slot));
        if isBoundItem then
          -- Addon.Debug.Log(format("  skipping %s because it is soulbound", itemLink))
        else
          -- Seems like a real item and not soulbound, get info about item and valuate
          local containerInfo = C_Container.GetContainerItemInfo(bag, slot);
          local count = containerInfo.stackCount or 0;
          local itemQuality = containerInfo.quality or 0;
          
          private.handleItemValuation(itemLink, itemQuality, count, result)
        end 
      end
		end
  end
  -- Addon.Debug.Log(format(" ValuateBag(): %d", bag))
  -- Addon.Debug.TableToString(result)
  return result
end

function private.ValuateGBankTab(tab)
  local result = {
    value = 0,
    items = {},
  }
  for slot = 1, GUILD_BANK_TAB_SLOTS do
    local itemLink = GetGuildBankItemLink(tab, slot)
    local _, count, _, _, itemQuality = GetGuildBankItemInfo(tab, slot)
    if itemLink and count > 0 then
      -- Addon.Debug.Log(format("GBANK: %s has a quality of %d", itemLink, itemQuality));
      private.handleItemValuation(itemLink, itemQuality, count, result)
    end
  end
  return result
end

function private.handleItemValuation(itemLink, itemQuality, count, resultTbl)
  -- Use info to lookup value
  local priceSource = Addon.GetFromDb("pricesource", "source");
  local qualityFilterEnabled = Addon.GetFromDb("qualityFilter", "enabled");
  local qualityFilterValue = tonumber(Addon.GetFromDb("qualityFilter", "value"));

  -- Should we consider this item?
  if private.ignoreSet[itemLink] then
    -- Addon.Debug.Log(format("  skipping %s because it's on the item filter list", itemLink));
    return
  end

  -- Should we consider this items quality?
  if qualityFilterEnabled then
    if itemQuality < qualityFilterValue then
      -- Addon.Debug.Log(format("  skipping %s because its quality is lower then required", itemLink));
      return
    end
  end

  -- Addon.Debug.Log(format("  private.handleItemValuation(): %s %s %s", itemLink, itemQuality, priceSource))
  local singleItemValue = private.GetItemValue(itemLink, priceSource) or 0;
  local totalValue = singleItemValue * count;
  
  -- Addon.Debug.Log(format("  found %d %s", count, itemLink));
  -- If the item is already in the result, just increment the count
  if resultTbl.items[itemLink] then
    -- Addon.Debug.Log(format("  item already in list, adding %d", count))
    resultTbl.items[itemLink]["count"] = resultTbl.items[itemLink]["count"] + count;
    resultTbl.items[itemLink]["totalValue"] = resultTbl.items[itemLink]["totalValue"] + totalValue;
  else
    -- Addon.Debug.Log(format("  new item, adding %d", count))
    -- Otherwise add it
    resultTbl.items[itemLink] = {
      count = count,
      itemValue = singleItemValue,
      totalValue = totalValue,
      itemLink = itemLink,
    };
  end

  -- Addon.Debug.Log(format("   current total is: %d", result.items[itemLink]["count"]))
  resultTbl.value = resultTbl.value + totalValue;
end

function private.GetItemValue(itemLink, priceSource)
	-- from which addon is our selected price source?
	if private.startsWith(Addon.CONST.PRICE_SOURCE[Addon.GetFromDb("pricesource", "source")], "TUJ:") then
		-- TUJ price source
		if priceSource == "VendorSell" then
			-- if we use TUJ and need 'VendorSell' we have to query the ItemInfo to get the price
			local VendorSell =  select(11, GetItemInfo(itemLink)) or 0
			-- Addon.Debug.Log("  GetItemValue: special handling for TUJ and pricesource 'VendorSell': " .. tostring(VendorSell))
			return VendorSell
		else
			local priceInfo = {}
	    TUJMarketInfo(itemLink, priceInfo)

			return priceInfo[priceSource]
		end
	else
		-- TSM price source
		return Addon.TSM.GetItemValue(itemLink, priceSource)
	end
end

function private.GetCharacterTable()
  -- determine where we should be looking for this data
  local charKey = format("%s.%s", currentRealm, currentCharacter)
  if not Addon.db.global.Characters[charKey] then
    Addon.db.global.Characters[charKey] = {};
  end
  return Addon.db.global.Characters[charKey];
end

function private.SaveValue(type, bag, value)
  local charTable = private.GetCharacterTable();
  local bagKey = format("%s%s", type, bag);
  
  charTable[bagKey] = value;
end

function private.GetBankLastUpdated()
  local charTable = private.GetCharacterTable();
  return charTable["BankLastUpdated"];
end

function private.GetGBankLastUpdated()
  local charTable = private.GetCharacterTable();
  return charTable["GBankLastUpdated"];
end

function private.SaveBankLastUpdated(time)
  local charTable = private.GetCharacterTable();
  charTable["BankLastUpdated"] = time;
end

function private.SaveGBankLastUpdated(time)
  local charTable = private.GetCharacterTable();
  charTable["GBankLastUpdated"] = time;
end

function private.GetTopContributors(type)
  local charTable = private.GetCharacterTable();
  return charTable[format("%sTopContributors", type)] or {};
end

function private.SetTopContributors(type, tbl)
  local charTable = private.GetCharacterTable();
  charTable[format("%sTopContributors", type)] = tbl;
end

function private.GetPersonalBagIDs()
  local arr = {};
  for i = FIRST_PERSONAL_BAG_SLOT, LAST_PERSONAL_BAG_SLOT do
    arr[i] = 0;
  end
  return arr;
end

function private.GetBankBagIDs()
  local arr = {};
  -- Add the primary bag
  arr[BANK_CONTAINER] = 0;
  -- Add any existing bags
  for i = FIRST_BANK_SLOT, LAST_BANK_SLOT do
    arr[i] = 0;
  end
  -- Add the reagent bag
  if REAGENTBANK_CONTAINER and IsReagentBankUnlocked() then
    arr[REAGENTBANK_CONTAINER] = 0;
  end
  return arr;
end

function private.GetSavedTotalForBags(tbl)
  -- load table
  local charTable = private.GetCharacterTable();
  local bagTotal = 0;
  for k, v in pairs(tbl) do
    local bagKey = format("Bag%s", k);
    if charTable[bagKey] then
      bagTotal = bagTotal + charTable[bagKey];
    end
  end
  return bagTotal;
end

function private.GetSavedTotalForGBank()
  local charTable = private.GetCharacterTable();
  local bagTotal = 0;
  for k, v in pairs(charTable) do
    if k:match("GBankTab.*") then
      bagTotal = bagTotal + v;
    end
  end
  -- Addon.Debug.Log(format("GetSavedTotalForGBank(): %s", bagTotal))
  return bagTotal;
end

function private.RecalculateTotals()  
  local ldbLabelSetting = Addon.GetFromDb("ldbsource");

  -- Iterate personal bags
  local bagTotal = private.GetSavedTotalForBags(private.GetPersonalBagIDs());
  local bagTotalString = GetMoneyString(bagTotal, true);
  Addon:UpdateBagTotalText(bagTotalString);
  if ldbLabelSetting == "bagtotal" then
    Addon:UpdateDataBrokerText(bagTotalString);
  end

  -- Iterate bank bags
  local bankTotal = private.GetSavedTotalForBags(private.GetBankBagIDs());
  local bankTotalString = GetMoneyString(bankTotal, true);
  Addon:UpdateBankTotalText(bankTotalString);
  if ldbLabelSetting == "banktotal" then
    Addon:UpdateDataBrokerText(bankTotalString);
  end

  -- Iterate GBank bags
  local gbankTotal = 0;
  if Addon.GetFromDb("guildBank", "enabled") and IsInGuild() then
    gbankTotal = private.GetSavedTotalForGBank()
    local gbankTotalString = GetMoneyString(gbankTotal, true);
    Addon:UpdateGBankTotalText(gbankTotalString);
  end
  
  -- convert to text and update databroker
  local grandTotalString = GetMoneyString(bagTotal + bankTotal + gbankTotal, true);
  Addon:UpdateGrandTotalText(grandTotalString);
  if ldbLabelSetting == "combinedtotal" then
    Addon:UpdateDataBrokerText(grandTotalString);  
  end

  -- reload last calculated top contributors, if necessary
  if Addon.GetFromDb("topContributors", "enabled") then
    local topContributors = {
      Bag = private.GetTopContributors("Bag"),
      Bank = private.GetTopContributors("Bank"),
      GuildBank = private.GetTopContributors("GuildBank"),
    }
    Addon:SetTopContributors(topContributors);
  else
    Addon:SetTopContributors({});
  end
end

function private.PreparePriceSources()
  Addon.Debug.Log("PreparePriceSources()")

  -- price source check --
	local priceSources = private.GetAvailablePriceSources() or {}

	-- only 2 or less price sources -> chat msg: missing modules
	if private.tablelength(priceSources) <= 2 then
		StaticPopupDialogs["BA_NO_PRICESOURCES"] = {
			text = "|cffff0000Attention!|r Missing additional addons for price sources (e.g. like TradeSkillMaster or The Undermine Journal).\n\n|cffff0000BagAppraiser disabled.|r",
			button1 = OKAY,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true
		}
		StaticPopup_Show("BA_NO_PRICESOURCES")

		Addon:Print("|cffff0000BagAppraiser disabled.|r (see popup window for further details)")
		Addon:Disable()
		return
	else
		-- current preselected price source
		local priceSource = Addon.GetFromDb("pricesource", "source")

    -- normal price source check against prepared list
    if not priceSources[priceSource] then
      StaticPopupDialogs["BA_INVALID_CUSTOM_PRICESOURCE"] = {
        text = "|cffff0000Attention!|r Your selected price source in BagAppraiser is not or no longer valid (maybe due to a missing module/addon). Please select another price source in the BagAppraiser settings or install the needed module/addon for the selected price source.",
        button1 = OKAY,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true
      }
      StaticPopup_Show("BA_INVALID_CUSTOM_PRICESOURCE")
    end
	end

	Addon.availablePriceSources = priceSources
end

-- get available price sources from the different modules
function private.GetAvailablePriceSources()
	local priceSources = {}

	-- TSM
	if Addon.TSM.IsTSMLoaded() then
		priceSources = Addon.TSM.GetAvailablePriceSources() or {}
	end

	-- TUJ
	if TUJMarketInfo then
		priceSources["globalMedian"] = "TUJ: Global Median"
		priceSources["globalMean"] = "TUJ: Global Mean"
		priceSources["globalStdDev"] = "TUJ: Global Std Dev"
		priceSources["stddev"] = "TUJ: 14-Day Std Dev"
		priceSources["market"] = "TUJ: 14-Day Price"
		priceSources["recent"] = "TUJ: 3-Day Price"
	end

	return priceSources
end

function private.tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function private.startsWith(String,Start)
  return string.sub(String,1,string.len(Start))==Start
end

function private.chatCmdShowConfig()
  -- happens twice because there is a bug in the blizz implementation and the first call doesn't work. subsequent calls do.
	InterfaceOptionsFrame_OpenToCategory(Addon.CONST.METADATA.NAME)
  InterfaceOptionsFrame_OpenToCategory(Addon.CONST.METADATA.NAME)
end

function private.getIgnoredItemSet()
  local items = Addon.GetFromDb("itemFilter", "items");
  local set = {};
  if not Addon.GetFromDb("itemFilter", "enabled") then
    return set;
  end
  for k, v in ipairs(items) do
    set[v] = true;
  end
  return set;
end