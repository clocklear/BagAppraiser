local Addon = select(2, ...)

local AHDB = {}
Addon.AHDB = AHDB

function AHDB.IsLoaded()
  if AuctionDB and AuctionDB.AHGetAuctionInfoByLink then
    return true
  end
  return false
end

function AHDB.GetItemValue(itemLink, priceSource)
  if not AHDB.IsLoaded() then
    return 0
  end

  local res = AuctionDB:AHGetAuctionInfoByLink(itemLink)

  if priceSource == "AHDBMinBid" and res['minBid'] then
    return res['minBid']
  elseif priceSource == "AHDBMinBuyout" and res['minBuyout'] then
    return res['minBuyout']
  end

  -- failsafe
  return 0
end

function AHDB.GetAvailablePriceSources()
  if not AHDB.IsLoaded() then
    return
  end

  local ps = {}
  local keys = { "AHDBMinBid", "AHDBMinBuyout" }
  for _, v in ipairs(keys) do
    ps[v] = Addon.CONST.PRICE_SOURCE[v]
  end

  return ps
end
