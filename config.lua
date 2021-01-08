local Addon = select(2, ...)

local Config = Addon:NewModule("Config", "AceEvent-3.0")
Addon.Config = Config

local private = {}

local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")
local AceGUI = LibStub("AceGUI-3.0")

-- the config tabs
-----------------------------------------
--TAB:  GENERAL
-----------------------------------------
local generalOptionsGroup =  {
  type = "group",
  order = 10,
  name = "General",
  get = function(info)
      return Addon.db.profile.general[info[#info]]
  end,
  set = function(info, value)
      Addon.db.profile.general[info[#info]] = value;
  end,
  args = {
    source = {
      type = "select", order = 10, name = "Price Source", desc = "Predefined price sources for item value calculation.", width = "double",
      values = function() return Addon.availablePriceSources end,
      get = function(info)
          return Addon.db.profile.pricesource[info[#info]]
      end,
      set = function(info, value)
          local oldValue = Addon.db.profile.pricesource[info[#info]]
          Addon.db.profile.pricesource[info[#info]] = value;
          if oldValue ~= value then
            Addon:Print("Price source changed to: " .. Addon.CONST.PRICE_SOURCE[value])
            Addon:UpdateData();
          end
      end,
    },
    ldbLabelText = {
      type = "select", order = 15, name = "LDB Label Source", desc = "Controls what is displayed for the addon within LDB host frames.", width = "double",
      values = function() return Addon.CONST.LABEL_SOURCE end,
      get = function(info) return Addon.db.profile.ldbsource end,
      set = function(info, value)
          local oldValue = Addon.db.profile.ldbsource;
          Addon.db.profile.ldbsource = value;
          if oldValue ~= value then
            Addon:Print("LDB label source changed to: " .. Addon.CONST.LABEL_SOURCE[value]);
            Addon:UpdateData();
          end
      end,
    },
    enableMinimapIcon = { type = "toggle", order = 20, name = "Show minimap icon", width = "full",
      get = function(info) return not Addon.db.profile.minimapIcon.hide end,
      set = function(info, value)
          Addon.db.profile.minimapIcon.hide = not value
          if Addon.db.profile.minimapIcon.hide == true then
            Addon.icon:Hide(Addon.CONST.METADATA.NAME)
          else
            Addon.icon:Show(Addon.CONST.METADATA.NAME)
          end
      end,
    },
    showTopContributors = { type = "toggle", order = 30, name = "Show top contributors", desc = "Displays the top 10 unique items contributing to the total value.", width = "full",
      get = function(info) return Addon.GetFromDb("topContributors", "enabled") end,
      set = function(info, value)
          Addon.db.profile.topContributors.enabled = value
          Addon:UpdateData();
      end,
    },
    enableGuildBank = { type = "toggle", order = 40, name = "Enable guild bank", desc = "Summarize the contents of the guild bank.  This settings has no effect if you aren't in a guild.", width = "full", 
      get = function(info) return Addon.GetFromDb("guildBank", "enabled") end,
      set = function(info, value)
          Addon.db.profile.guildBank.enabled = value;
          Addon:UpdateData();
      end
    },
    guildBankDisclaimer = { type = "description", order = 50, fontSize = "medium", name = "Enabling the guild bank will include its value anywhere the 'Combined Total' is displayed." }
  }
}

local aboutGroup = {
  type = "group", order = 20, name = "About",
    args = {
      generalText1 = {
        type = "description", order = 10, fontSize = "medium", name = "BagAppraiser is a simple addon that values the contents of your bags and bank using the selected pricing source.\n\nPlease understand, this addon does NOT determine liquid gold you are guaranteed to make but rather, potential ‘asset’ values (looted item value) of items looted where you will have to do the work and sell it on the Auction House, trade chat, etc.\n", width = "full"
      },
      thanksHeader = {order = 20, type = "header", name = "Credits", },
      generalText2 = {
        type = "description", order = 40, fontSize = "medium", name = "Written by clocklear (https://github.com/clocklear)"
      },
      blank1 = { type = "description", order = 50, fontSize = "small",name = "",width = "full", },
      generalText3 = {
        type = "description", order = 53, fontSize = "medium", name = "Thanks to /r/woweconomy for the support and the great feature ideas."
      },
      blank2 = { type = "description", order = 56, fontSize = "small",name = "",width = "full", },
      generalText4 = {
        type = "description", order = 60, fontSize = "medium", name = "Special thanks to ProfitzTV and Testerle for their work on LootAppraiser; this addon borrows heavily from their work.  I'm standing on the shoulders of giants."
      }
    }
}

local options = {
  type = "group",
  args = {
    general = { type = "group", name = format("%s %s", Addon.CONST.METADATA.NAME, Addon.CONST.METADATA.VERSION), childGroups = "tab",
        get = function(info) 
            return Addon.db.profile[info[#info]]
          end,
        set = function(info, value)
            Addon.db.profile[info[#info]] = value;
          end,
        args = {
          generalOptionsGrp = generalOptionsGroup,
          aboutGroup = aboutGroup,
        },
    },
  },
}

function Config:OnEnable()
  Addon.Debug.Log("Config - Init")

  AceConfigRegistry:RegisterOptionsTable(Addon.CONST.METADATA.NAME, options.args.general)
  local baConfig = AceConfigDialog:AddToBlizOptions(Addon.CONST.METADATA.NAME)
  baConfig.default = private.resetDB
end

function private.resetDB()
  Addon.Debug.Log("Config.resetDB")

  Addon.db:ResetProfile(false, true)

  AceConfigRegistry:NotifyChange("LootAppraiser")
end
