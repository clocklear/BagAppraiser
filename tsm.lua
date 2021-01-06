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

function TSM.GetItemValue(itemID, priceSource)
  if TSM_API and TSM_API.GetCustomPriceValue then
    local itemLink

    local newItemID = Addon.PetData.ItemID2Species(itemID) -- battle pet handling
    if newItemID == itemID then
      itemLink = "i:" .. tostring(itemID)
    else
      itemLink = newItemID
    end

    return TSM_API.GetCustomPriceValue(priceSource, itemLink) -- "i:" .. tostring(itemID)
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