local ADDON_NAME = ...;
local Addon = select(2, ...)
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME);

local TUJ = {}
Addon.TUJ = TUJ

function TUJ.IsLoaded()
  if TUJMarketInfo then
    return true
  end
  return false
end

function TUJ.GetItemValue(itemLink, priceSource)
  -- TUJ price source
  if priceSource == "VendorSell" then
    -- if we use TUJ and need 'VendorSell' we have to query the ItemInfo to get the price
    local VendorSell = select(11, GetItemInfo(itemLink)) or 0
    -- Addon.Debug.Log("  GetItemValue: special handling for TUJ and pricesource 'VendorSell': " .. tostring(VendorSell))
    return VendorSell
  else
    local priceInfo = {}
    TUJMarketInfo(itemLink, priceInfo)

    return priceInfo[priceSource]
  end
end

function TUJ.GetAvailablePriceSources()
  if not TUJ.IsLoaded() then
    return
  end

  local ps = {
    ["globalMedian"] = "TUJ: " .. L["globalMedian"],
    ["globalMean"] = "TUJ: " .. L["globalMean"],
    ["globalStdDev"] = "TUJ: " .. L["globalStdDev"],
    ["stddev"] = "TUJ: " .. L["stddev"],
    ["market"] = "TUJ: " .. L["market"],
    ["recent"] = "TUJ: " .. L["recent"],
  }

  return ps
end
