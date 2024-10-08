local Addon = select(2, ...)
local ADDON_NAME = ...;
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME);

-- wow api
local GetAddOnMetadata = C_AddOns.GetAddOnMetadata

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

CONST.PRICE_SOURCE = {
  -- TSM price sources
  ["DBHistorical"] = "TSM: " .. L["historical_price"],
  ["DBMarket"] = "TSM: " .. L["market_value"],
  ["DBMinBuyout"] = "TSM: " .. L["min_buyout"],
  ["DBRegionHistorical"] = "TSM: " .. L["region_historical_price"],
  ["DBRegionMarketAvg"] = "TSM: " .. L["region_market_value_avg"],
  ["DBRegionMinBuyoutAvg"] = "TSM: " .. L["region_min_buyout_avg"],
  ["DBRegionSaleAvg"] = "TSM: " .. L["region_global_sale_average"],
  ["DBRecent"] = "TSM: " .. L["recent_value"],
  ["VendorSell"] = "TSM: " .. L["vendorsell"],

  -- OE price sources
  ["OERealm"] = "OE: " .. L["realm_price"],
  ["OERegion"] = "OE: " .. L["region_price"],

  -- AHDB price sources
  ["AHDBMinBid"] = "AHDB: " .. L["min_bid"],
  ["AHDBMinBuyout"] = "AHDB: " .. L["min_buyout"],

  -- ATR price sources
  ["ATRMarket"] = "ATR: " .. L["auction_value"],

  -- AUC price sources
  ["AUCMarket"] = "AUC: " .. L["market_value"],
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

CONST.SELECTED_BAGS = {
  ["all"] = L["bags_all"],
  ["reagent"] = L["bags_reagent"],
}