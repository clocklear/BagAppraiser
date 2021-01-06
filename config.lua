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
            Addon:Print("Price source changed to: " .. value)
            Addon:UpdateData()
          end
      end,
    }
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
        type = "description", order = 60, fontSize = "medium", name = "Thanks to ProfitzTV and Testerle for their work on LootAppraiser; this addon borrows heavily from their work.  I learned a lot from them."
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