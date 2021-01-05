local ADDON_NAME, Addon = ...;

local LibDataBroker = LibStub("LibDataBroker-1.1");

local labelString = "|cffffffff%s:|r %s"
local bagTotal = "";
local bankTotal = "";
local grandTotal = "";

local settings = {
	type = "data source",
	label = ADDON_NAME,
	text = ADDON_NAME .. " Text Display",
  icon = "Interface\\Icons\\Inv_Ingot_03",
  OnTooltipShow = function(tooltip)
    if (tooltip and tooltip.AddLine) then
      tooltip:AddDoubleLine(ADDON_NAME, grandTotal, 1, 1, 1)
      tooltip:AddLine(" ");
      tooltip:AddDoubleLine("Bags:", bagTotal, 1, 1, 1)
      tooltip:AddDoubleLine("Bank:", bankTotal, 1, 1, 1)
    end
  end,
};

function Addon:InitializeDataBroker()
	Addon.BrokerModule = LibDataBroker:NewDataObject(ADDON_NAME, settings);
end

function Addon:UpdateDataBrokerText(text)
	if (Addon.BrokerModule ~= nil) then
		Addon.BrokerModule.text = text;
	end
end

function Addon:UpdateBagTotalText(text)
  bagTotal = text;
end

function Addon:UpdateBankTotalText(text)
  bankTotal = text;
end

function Addon:UpdateGrandTotalText(text)
  grandTotal = text;
end