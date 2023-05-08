local Addon = select(2, ...)

local ATR = {}
Addon.ATR = ATR
local private = {}

function ATR.IsLoaded()
  if Auctionator and Auctionator.API and Auctionator.API.v1 and Auctionator.API.v1.GetAuctionPriceByItemLink then
    -- retail
    private.isRetail = true
    private.isClassic = false
    local ok = pcall(function()
      Auctionator.API.v1.RegisterForDBUpdate("BagAppraiser", function() Addon:UpdateData() end)
    end)
    if not ok then
      Addon:Print("failed to register updates with Auctionator")
    end
    return true
  elseif Atr_GetAuctionBuyout then
    -- classic
    private.isRetail = false
    private.isClassic = true
    return true
  end
  return false
end

function ATR.GetItemValue(itemLink, priceSource)
  if not ATR.IsLoaded() then
    return 0
  end

  if private.isRetail then
    return Auctionator.API.v1.GetAuctionPriceByItemLink("BagAppraiser", itemLink)
  elseif private.isClassic then
    return Atr_GetAuctionBuyout(itemLink)
  end

  -- failsafe
  return 0
end

function ATR.GetAvailablePriceSources()
  if not ATR.IsLoaded() then
    return
  end

  local ps = {}
  local keys = { "ATRMarket" }
  for _, v in ipairs(keys) do
    ps[v] = Addon.CONST.PRICE_SOURCE[v]
  end

  return ps
end
