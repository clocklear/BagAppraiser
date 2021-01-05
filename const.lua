local BA = select(2, ...)

-- wow api
local GetAddOnMetadata, UIParent = GetAddOnMetadata, UIParent

local CONST = {}
BA.CONST = CONST

CONST.METADATA = {
    NAME = GetAddOnMetadata(..., "Title"),
    VERSION = GetAddOnMetadata(..., "Version")
}

CONST.QUALITY_FILTER = { -- little hack to sort them in the menu
    ["0"] = "|cff9d9d9dPoor|r",
    ["1"] = "|cffffffffCommon|r",
    ["2"] = "|cff1eff00Uncommon|r",
    ["3"] = "|cff0070ddRare|r",
    ["4"] = "|cffa335eeEpic|r"
}

-- TSM predefined price sources + 'Custom' + TUJ price sources
CONST.PRICE_SOURCE = {
    -- TSM price sources
    ["Custom"] = "Custom Price Source",
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