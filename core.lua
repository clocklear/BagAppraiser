local ADDON_NAME = ...;
local Addon = LibStub("AceAddon-3.0"):NewAddon(select(2, ...), ADDON_NAME, "AceConsole-3.0", "AceEvent-3.0");

-- todo: allow for changing this via a fancy UI
local defaultPriceSource = "DBMarket";
local private = {
  atBank = false,
}

local currentCharacter = UnitName("player")
local currentRealm = GetRealmName()
local currentAccount = THIS_ACCOUNT

local FIRST_BANK_SLOT = 1 + NUM_BAG_SLOTS
local LAST_BANK_SLOT = NUM_BANKBAGSLOTS + NUM_BAG_SLOTS

local AddonDB_Defaults = {
	global = {
		Characters = {
			['*'] = {					-- ["Realm.Name"] 
			},
		},
  },
}

function Addon:OnInitialize()
  Addon.db = LibStub("AceDB-3.0"):New(ADDON_NAME .. "DB", AddonDB_Defaults)
  Addon:InitializeDataBroker();
  -- LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options)
end

function Addon:OnEnable()
  private.PreparePriceSources();

  Addon:RegisterChatCommand("ba", private.chatCmdShowConfig)

  Addon:RegisterEvent("BAG_UPDATE_DELAYED", private.OnBagUpdateDelayed)
  Addon:RegisterEvent("BANKFRAME_OPENED", private.OnBankFrameOpened)
  Addon:RegisterEvent("BANKFRAME_CLOSED", private.OnBankFrameClosed)

  Addon:Print(format("%s loaded", Addon.CONST.METADATA.VERSION))
end

function Addon:UpdateData()
  -- Iterate personal bags
  for k, v in pairs(private.GetPersonalBagIDs()) do
    local bagValue = private.ValuateBag(k)
    private.SaveBagValue(k, bagValue.value)
  end

  -- If at the bank, iterate those bags
  if private.atBank then
    for k, v in pairs(private.GetBankBagIDs()) do
      local bagValue = private.ValuateBag(k)
      private.SaveBagValue(k, bagValue.value)
      private.SaveBankLastUpdated(time())
    end
  end

  private.RecalculateTotals();
  local bankLastUpdated = private.GetBankLastUpdated();
  if bankLastUpdated then
    Addon:UpdateBankLastUpdatedText(date("%x %X", bankLastUpdated))
  end
end

function Addon.GetFromDb(grp, key, ...)
  if Addon.db.profile[grp] == nil then
    Addon.db.profile[grp] = Addon.CONST.DB_DEFAULTS.profile[grp]
  end
  if not key then
    return Addon.db.profile[grp]
  end 
  if Addon.db.profile[grp][key] == nil then
    Addon.db.profile[grp][key] = Addon.CONST.DB_DEFAULTS.profile[grp][key]
  end
  return Addon.db.profile[grp][key]
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

function private.ValuateBag(bag)
  local result = {
    value = 0,
    items = {},
  }
  local size = GetContainerNumSlots(bag);
  local priceSource = Addon.GetFromDb("pricesource", "source")
	if size > 0 then
		for slot = 1, size do

      -- Grab the item count and itemlink
      local itemLink = GetContainerItemLink(bag, slot);
      if itemLink ~= nil then
        local _, count = GetContainerItemInfo(bag, slot);
        count = count or 0;
        
        -- Use info to lookup value
        Addon.Debug.Log(format("  private.ValuateBag(): %s %s", itemLink, priceSource))
        local singleItemValue = private.GetItemValue(itemLink, priceSource) or 0;
        local totalValue = singleItemValue * count;
        result.items[itemLink] = {
          count = count,
          itemValue = singleItemValue,
          totalValue = totalValue,
        };
        result.value = result.value + totalValue;
      end
		end
  end
  return result
end

function private.GetItemValue(itemLink, priceSource)
	-- from which addon is our selected price source?
	if private.startsWith(Addon.CONST.PRICE_SOURCE[Addon.GetFromDb("pricesource", "source")], "TUJ:") then
		-- TUJ price source
		if priceSource == "VendorSell" then
			-- if we use TUJ and need 'VendorSell' we have to query the ItemInfo to get the price
			local VendorSell =  select(11, GetItemInfo(itemLink)) or 0
			Addon.Debug.Log("  GetItemValue: special handling for TUJ and pricesource 'VendorSell': " .. tostring(VendorSell))
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

function private.SaveBagValue(bag, value)
  local charTable = private.GetCharacterTable();
  local bagKey = format("Bag%s", bag);
  
  charTable[bagKey] = value;
end

function private.GetBankLastUpdated()
  local charTable = private.GetCharacterTable();
  return charTable["BankLastUpdated"];
end

function private.SaveBankLastUpdated(time)
  local charTable = private.GetCharacterTable();
  charTable["BankLastUpdated"] = time;
end

function private.GetPersonalBagIDs()
  local arr = {};
  for i = BACKPACK_CONTAINER, NUM_BAG_SLOTS do
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
      bagTotal = bagTotal + charTable[bagKey]
    end
  end
  return bagTotal;
end

function private.RecalculateTotals()  
  -- Iterate personal bags
  local bagTotal = private.GetSavedTotalForBags(private.GetPersonalBagIDs())
  Addon:UpdateBagTotalText(GetMoneyString(bagTotal, true));

  -- Iterate bank bags
  local bankTotal = private.GetSavedTotalForBags(private.GetBankBagIDs())
  Addon:UpdateBankTotalText(GetMoneyString(bankTotal, true));
  
  -- convert to text and update databroker
  --local grandTotalString = Addon.Money.ToString(bagTotal + bankTotal);
  local grandTotalString = GetMoneyString(bagTotal + bankTotal, true);
  Addon:UpdateGrandTotalText(grandTotalString);
  Addon:UpdateDataBrokerText(grandTotalString);
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
