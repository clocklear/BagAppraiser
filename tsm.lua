local BA = select(2, ...)

local TSM = {}
BA.TSM = TSM

local private = {}

-- TSM4
local TSM_API = _G.TSM_API

function TSM.GetItemValue(itemID, priceSource)
  if TSM_API and TSM_API.GetCustomPriceValue then
    local itemLink

    local newItemID = BA.PetData.ItemID2Species(itemID) -- battle pet handling
    if newItemID == itemID then
      itemLink = "i:" .. tostring(itemID)
    else
      itemLink = newItemID
    end

    return TSM_API.GetCustomPriceValue(priceSource, itemLink) -- "i:" .. tostring(itemID)
  end 

  return 0
end