local Addon = select(2, ...)
local ADDON_NAME = ...;
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME);

-- wow api
local GetAddOnMetadata, UIParent = GetAddOnMetadata, UIParent

local CONST = {}
Addon.CONST = CONST

CONST.METADATA = {
  NAME = GetAddOnMetadata(..., "Title"),
  VERSION = GetAddOnMetadata(..., "Version")
}

CONST.QUALITY_FILTER = {
  ["0"] = "|cff9d9d9d" .. L["poor"] .. "|r",
  ["1"] = "|cffffffff" .. L["common"] .. "|r",
  ["2"] = "|cff1eff00" .. L["uncommon"] .. "|r",
  ["3"] = "|cff0070dd" .. L["rare"] .. "|r",
  ["4"] = "|cffa335ee" .. L["epic"] .. "|r"
}

-- TSM predefined price sources + 'Custom' + TUJ price sources
CONST.PRICE_SOURCE = {
  -- TSM price sources
  ["DBHistorical"] = "TSM: " .. L["historical_price"],
  ["DBMarket"] = "TSM: " .. L["market_value"],
  ["DBMinBuyout"] = "TSM: " .. L["min_buyout"],
  ["DBRegionHistorical"] = "TSM: " .. L["region_historical_price"],
  ["DBRegionMarketAvg"] = "TSM: " .. L["region_market_value_avg"],
  ["DBRegionMinBuyoutAvg"] = "TSM: " .. L["region_min_buyout_avg"],
  ["DBRegionSaleAvg"] = "TSM: " .. L["region_global_sale_average"],
  ["VendorSell"] = "TSM: " .. L["vendorsell"],

  -- TUJ price sources
  ["globalMedian"] = "TUJ: " .. L["globalMedian"],
  ["globalMean"] = "TUJ: " .. L["globalMean"],
  ["globalStdDev"] = "TUJ: " .. L["globalStdDev"],
  ["stddev"] = "TUJ: " .. L["stddev"],
  ["market"] = "TUJ: " .. L["market"],
  ["recent"] = "TUJ: " .. L["recent"],
}

CONST.LABEL_SOURCE = {
  ["bagtotal"] = L["bagtotal"],
  ["banktotal"] = L["banktotal"],
  ["combinedtotal"] = L["combinedtotal"],
}

CONST.MONEY_PRECISION = {
  [0] = L["precision_full"] .. " (" .. GetMoneyString(12345678, true) .. ")",
  [2] = L["precision_silver"] .. " (" .. GetMoneyString(12345700, true) .. ")",
  [4] = L["precision_gold"] .. " (" .. GetMoneyString(12350000, true) .. ")",
}
