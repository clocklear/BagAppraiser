local ADDON_NAME = ...;
local Addon = LibStub("AceAddon-3.0"):NewAddon(select(2, ...), ADDON_NAME, "AceEvent-3.0");

-- todo: allow for changing this via a fancy UI
local priceSource = "DBMarket";
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
  }
}

function Addon:OnInitialize()
  Addon.db = LibStub("AceDB-3.0"):New(ADDON_NAME .. "DB", AddonDB_Defaults)
  Addon:InitializeDataBroker();
  -- LibStub("AceConfig-3.0"):RegisterOptionsTable(addonName, options)
end

function Addon:OnEnable()
  Addon:RegisterEvent("BAG_UPDATE_DELAYED", private.OnBagUpdateDelayed)
  Addon:RegisterEvent("BANKFRAME_OPENED", private.OnBankFrameOpened)
  Addon:RegisterEvent("BANKFRAME_CLOSED", private.OnBankFrameClosed)
end

function Addon:UpdateData()
  -- Iterate personal bags
  for k, v in pairs(private.GetPersonalBagIDs()) do
    local bagValue = private.ValuateBag(k)
    private.SaveBagValue(k, bagValue)
  end

  -- If at the bank, iterate those bags
  if private.atBank then
    for k, v in pairs(private.GetBankBagIDs()) do
      local bagValue = private.ValuateBag(k)
      private.SaveBagValue(k, bagValue)
    end
  end

  private.RecalculateTotals();
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
  local size = GetContainerNumSlots(bag);
	if size > 0 then
		local value = 0;
		for slot = 1, size do

      -- Grab the item count and id
      local id = GetContainerItemID(bag, slot);
      if id ~= nil then
        local _, count = GetContainerItemInfo(bag, slot);
        
        count = count or 0;
        
        -- Use info to lookup value
        -- todo: abstract this to not depend on TSM (maybe)
        local singleItemValue = Addon.TSM.GetItemValue(id, priceSource) or 0;
        local totalValue = singleItemValue * count;
        value = value + totalValue;
      end
		end

		return value;
	else
		return 0;
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