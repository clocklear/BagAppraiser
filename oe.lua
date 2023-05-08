local Addon = select(2, ...)

local OE = {}
Addon.OE = OE

function OE.IsLoaded()
  if OEMarketInfo then
    return true
  end
  return false
end

function OE.GetItemValue(itemLink, priceSource)
  if not OE.IsLoaded() then
    return 0
  end

  local o = {}
  OEMarketInfo(itemLink, o)

  if priceSource == "OERealm" then
    return o['market']
  elseif priceSource == "OERegion" then
    return o['region']
  end

  -- failsafe
  return 0
end

function OE.GetAvailablePriceSources()
  if not OE.IsLoaded() then
    return
  end

  local ps = {}
  local keys = { "OERealm", "OERegion" }
  for _, v in ipairs(keys) do
    ps[v] = Addon.CONST.PRICE_SOURCE[v]
  end

  return ps
end
