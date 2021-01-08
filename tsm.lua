local Addon = select(2, ...)

local TSM = {}
Addon.TSM = TSM

local private = {}

-- TSM4
local TSM_API = _G.TSM_API

function TSM.IsTSMLoaded()
	if TSM_API then
		return true
	end
	return false
end

function TSM.GetItemValue(itemLink, priceSource)
  if TSM_API and TSM_API.GetCustomPriceValue then
    local newItemID = Addon.PetData.ItemID2Species(itemID) -- battle pet handling
    if newItemID ~= itemID then
      return TSM_API.GetCustomPriceValue(priceSource, newItemID)
    end

    -- Addon.Debug.Log(format("  TSM_API.ToItemString %s", itemLink))
    local tsmItemLink = TSM_API.ToItemString(itemLink)
    if not tsmItemLink then
      Addon.Debug.Log(format("  Cannot create tsmItemLink for %s, skipping", itemLink))
      return 0
    end
    -- Addon.Debug.Log(format("  TSM_API.GetCustomPriceValue() %s %s", priceSource, tsmItemLink))
    return TSM_API.GetCustomPriceValue(priceSource, tsmItemLink)
  end

  return 0
end

function TSM.GetAvailablePriceSources()
	Addon.Debug.Log("tsm.GetAvailablePriceSources()")

	if not TSM.IsTSMLoaded() then
		Addon.Debug.Log("tsm.GetAvailablePriceSources: TSM not loaded")
		return
	end

	local priceSources = {}
	local keys = {}

	-- filter
	local tsmPriceSources = {}
  TSM_API.GetPriceSourceKeys(tsmPriceSources)

	for k, v in pairs(tsmPriceSources) do
		if Addon.CONST.PRICE_SOURCE[k] then
			table.insert(keys, k)
		elseif Addon.CONST.PRICE_SOURCE[v] then
			table.insert(keys, v)
		end
	end


	sort(keys)

	for _,v in ipairs(keys) do
		priceSources[v] = Addon.CONST.PRICE_SOURCE[v]
	end

	return priceSources
end
