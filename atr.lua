local Addon = select(2, ...)

local ATR = {}
Addon.ATR = ATR
local private = {
  loaded = nil,
  registered = false,
  isRetail = false,
  isClassic = false,
}

function ATR.IsLoaded()
  if private.loaded ~= nil then
    return private.loaded
  end

  if Auctionator and Auctionator.API and Auctionator.API.v1 and Auctionator.API.v1.GetAuctionPriceByItemLink then
    -- retail
    private.isRetail = true
    private.isClassic = false
    private.loaded = true

    if not private.registered then
      private.registered = true
      local ok = pcall(function()
        Auctionator.API.v1.RegisterForDBUpdate("BagAppraiser", function() Addon:UpdateData(true) end)
      end)
      if not ok then
        Addon:Print("failed to register updates with Auctionator")
      end
    end
    return true
  elseif Atr_GetAuctionBuyout then
    -- classic
    private.isRetail = false
    private.isClassic = true
    private.loaded = true
    return true
  end

  private.loaded = false
  return false
end

function ATR.GetItemValue(itemLink, priceSource)
  if not private.loaded then
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
  if not ATR.IsLoaded() then -- initializes private.loaded once
    return
  end

  local ps = {}
  local keys = { "ATRMarket" }
  for _, v in ipairs(keys) do
    ps[v] = Addon.CONST.PRICE_SOURCE[v]
  end

  return ps
end
