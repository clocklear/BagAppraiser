local ADDON_NAME, Addon = ...;

local LibDataBroker = LibStub("LibDataBroker-1.1");

local bagTotal = "";
local bankTotal = "";
local grandTotal = "";
local gbankTotal = "";
local bankLastUpdated = "never";
local gbankLastUpdated = "never";
local ldbLabelText = "";
local topContributors = {};

local private = {};

local settings = {
	type = "data source",
	label = ADDON_NAME,
	text = ADDON_NAME .. " Text Display",
  icon = "Interface\\Icons\\Inv_Ingot_03",
  OnTooltipShow = function(tooltip)
    if (tooltip and tooltip.AddLine) then
      tooltip:AddDoubleLine(ADDON_NAME, ldbLabelText, 1, 1, 1)
      tooltip:AddLine(" ");
      tooltip:AddDoubleLine("Bags:", bagTotal, 1, 1, 1)
      private.addTopContributorSection(tooltip, "Bag")
      tooltip:AddDoubleLine("Bank:", bankTotal, 1, 1, 1)
      private.addTopContributorSection(tooltip, "Bank")
      if Addon.GetFromDb("guildBank", "enabled") and IsInGuild() then
        tooltip:AddDoubleLine("Guild Bank:", gbankTotal, 1, 1, 1)
        private.addTopContributorSection(tooltip, "GuildBank")
      end
      tooltip:AddDoubleLine("Total:", grandTotal, 1, 1, 1)
      tooltip:AddLine(" ");
      tooltip:AddDoubleLine("Based on:", Addon.CONST.PRICE_SOURCE[Addon.GetFromDb("pricesource", "source")])
      tooltip:AddDoubleLine("Bank last updated:", bankLastUpdated)
      if Addon.GetFromDb("guildBank", "enabled") and IsInGuild() then
        tooltip:AddDoubleLine("Guild Bank last updated:", gbankLastUpdated)
      end
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

function private.addTopContributorSection(tooltip, source)
  if Addon.GetFromDb("topContributors", "enabled") and topContributors and topContributors[source] and Addon:tableSize(topContributors[source]) > 0 then
    local precision = Addon.GetFromDb("moneyPrecision", "tooltip")
    tooltip:AddLine(format("Top %d Contributors:", Addon.GetFromDb("topContributors", "limit")))
    for k, v in ipairs(topContributors[source]) do
      tooltip:AddDoubleLine(format("%s x%d", v.itemLink, v.count), GetMoneyString(Addon:round(v.totalValue, precision), true))
    end
    tooltip:AddLine(" ");
  end
end

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
  ldbLabelText = text;
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

function Addon:UpdateGBankLastUpdatedText(text)
  gbankLastUpdated = text;
end

function Addon:UpdateGBankTotalText(text)
  gbankTotal = text;
end 

function Addon:SetTopContributors(tbl)
  topContributors = tbl;
end 

function Addon:tableSize(tbl)
  local size = 0;
  for k, v in pairs(tbl) do
    size = size + 1;
  end
  return size;
end