local ADDON_NAME, Addon = ...;

local LibDataBroker = LibStub("LibDataBroker-1.1");

local labelString = "|cffffffff%s:|r %s"
local bagTotal = "";
local bankTotal = "";
local grandTotal = "";
local bankLastUpdated = "never"

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
      tooltip:AddLine(" ");
      tooltip:AddDoubleLine("Based on:", Addon.CONST.PRICE_SOURCE[Addon.GetFromDb("pricesource", "source")])
      tooltip:AddDoubleLine("Bank last updated:", bankLastUpdated)
      tooltip:AddLine(" ");
      tooltip:AddLine("|cFFFFFFCCLeft-Click|r to open the options window");
    end
  end,
  OnClick = function(self, button, down)
    if button == "LeftButton" then
      InterfaceOptionsFrame_OpenToCategory(Addon.CONST.METADATA.NAME)
      InterfaceOptionsFrame_OpenToCategory(Addon.CONST.METADATA.NAME)
    end
  end,
};

function Addon:InitializeDataBroker()
	Addon.BrokerModule = LibDataBroker:NewDataObject(ADDON_NAME, settings);
  Addon.icon = LibStub("LibDBIcon-1.0");
  minimapIconSettings = Addon.GetFromDb("minimapIcon");
  Addon.icon:Register(Addon.CONST.METADATA.NAME, Addon.BrokerModule, minimapIconSettings)
  if minimapIconSettings.hide == true then
    Addon.icon:Hide(Addon.CONST.METADATA.NAME)
  else
    Addon.icon:Show(Addon.CONST.METADATA.NAME)
  end
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

function Addon:UpdateBankLastUpdatedText(text)
  bankLastUpdated = text;
end
