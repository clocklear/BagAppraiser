local Addon = select(2, ...)

-- wow api
local GetAddOnMetadata, UIParent = GetAddOnMetadata, UIParent

local CONST = {}
Addon.CONST = CONST

CONST.METADATA = {
    NAME = GetAddOnMetadata(..., "Title"),
    VERSION = GetAddOnMetadata(..., "Version")
}

-- TSM predefined price sources + 'Custom' + TUJ price sources
CONST.PRICE_SOURCE = {
    -- TSM price sources
    ["DBHistorical"] = "TSM: Historical Price",
    ["DBMarket"] = "TSM: Market Value",
    ["DBMinBuyout"] = "TSM: Min Buyout",
    ["DBRegionHistorical"] = "TSM: Region Historical Price",
    ["DBRegionMarketAvg"] = "TSM: Region Market Value Avg",
    ["DBRegionMinBuyoutAvg"] = "TSM: Region Min Buyout Avg",
    ["DBRegionSaleAvg"] = "TSM: Region Global Sale Average",
    ["VendorSell"] = "TSM: VendorSell",

    -- TUJ price sources
    ["globalMedian"] = "TUJ: Regional Median",
    ["globalMean"] = "TUJ: Regional Mean",
    ["globalStdDev"] = "TUJ: Regional Std Dev",
    ["stddev"] = "TUJ: 14-Day Std Dev",
    ["market"] = "TUJ: 14-Day Price",
    ["recent"] = "TUJ: 3-Day Price",
}

CONST.LABEL_SOURCE = {
  ["bagtotal"] = "Bag Total",
  ["banktotal"] = "Bank Total",
  ["combinedtotal"] = "Combined Total",
}

CONST.DB_DEFAULTS = {
  profile = {
    minimapIcon = { hide = false, minimapPos = 220, radius = 80, },
    pricesource = { ["source"] = "DBMarket" },
    ldbsource = "combinedtotal",
    topContributors = {
      enabled = true,
      limit = 5,
    },
    guildBank = {
      enabled = false,
    }
  },
}
