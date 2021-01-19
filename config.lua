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
      return Addon.db.profile[info[#info]]
  end,
  set = function(info, value)
      Addon.db.profile[info[#info]] = value;
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
    poorDesc = { type = "description", order = 11, fontSize = "small", name = "|cff9d9d9dPoor|r quality items are always valued with the VendorSell source." },
    blank1 = { type = "description", order = 13, fontSize = "small", name = " " },
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
    blank2 = { type = "description", order = 17, fontSize = "small", name = " " },
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
    blank3 = { type = "description", order = 25, fontSize = "small", name = " " },
    showTopContributors = { type = "toggle", order = 30, name = "Show top contributors", desc = "Displays the top 10 unique items contributing to the total value.", width = "full",
      get = function(info) return Addon.GetFromDb("topContributors", "enabled") end,
      set = function(info, value)
          Addon.db.profile.topContributors.enabled = value
          Addon:UpdateData();
      end,
    },
    blank4 = { type = "description", order = 35, fontSize = "small", name = " " },
    enableGuildBank = { type = "toggle", order = 40, name = "Enable guild bank", desc = "Summarize the contents of the guild bank.  This settings has no effect if you aren't in a guild.", width = "full", 
      get = function(info) return Addon.GetFromDb("guildBank", "enabled") end,
      set = function(info, value)
          Addon.db.profile.guildBank.enabled = value;
          Addon:UpdateData();
      end
    },
    guildBankDisclaimer = { type = "description", order = 50, fontSize = "small", name = "Enabling the guild bank will include its value anywhere the 'Combined Total' is displayed." },
  }
}

local filterOptionsGroup = {
  type = "group", order = 15, name = "Filters",
  args = {
    enableQualityFilter = { type = "toggle", order = 60, name = "Enable quality filter", desc = "If enabled, ignores items below the selected quality", width = "full", 
      get = function(info) return Addon.GetFromDb("qualityFilter", "enabled") end,
      set = function(info, value)
          local oldValue = Addon.GetFromDb("qualityFilter", "enabled");
          Addon.db.profile.qualityFilter.enabled = value;
          if oldValue ~= value then
            Addon:Print(format("Quality Filter %s", value and "enabled." or "disabled."));
          end
          Addon:UpdateData();
      end
    },
    qualityFilter = {
      type = "select", order = 70, name = "Quality Filter", width = "double", desc = "Items below the selected quality will not factor into calculations", values = Addon.CONST.QUALITY_FILTER,
      get = function(info) return Addon.GetFromDb("qualityFilter", "value") end;
      set = function(info, value)
        local oldValue = Addon.GetFromDb("qualityFilter", "value");
        Addon.db.profile.qualityFilter.value = value;
        if oldValue ~= value then
          Addon:Print("Quality Filter set to: " .. Addon.CONST.QUALITY_FILTER[value] .. " and above.");
        end
        Addon:UpdateData();
      end
    },
    blank5 = { type = "description", order = 80, fontSize = "small", name = " " },
    enableIgnoredItems = { type = "toggle", order = 85, name = "Enable item filter", desc = "If enabled, ignores any item added to the ignore list", width = "full", 
      get = function(info) return Addon.GetFromDb("itemFilter", "enabled") end,
      set = function(info, value)
          local oldValue = Addon.GetFromDb("itemFilter", "enabled");
          Addon.db.profile.itemFilter.enabled = value;
          if oldValue ~= value then
            Addon:Print(format("Item Filter %s", value and "enabled." or "disabled."));
          end
          Addon:UpdateData();
      end
    },
    blank1 = { type = "description", order = 86, fontSize = "small", name = "To add to the ignore list, drag an item to the button below and click it.  Any item added to the ignore list will be skipped when assessing bag value.  Soulbound items are automatically skipped.  You can remove items by unchecking them inside the ignore list." },
    add_item = {
      order = 90,
      type = "execute",
      name = "Drag an item here and click to add it.",
      width = "full",
      desc = "",
      descStyle = "inline",
      func = function()
        local type, _, link = GetCursorInfo()

        if type == "item" and link then
          local items = Addon.GetFromDb("itemFilter", "items");
          for k, v in ipairs(items) do
            if v == link then
              Addon:Print(format("%s is already on the ignore list.", link))
              ClearCursor();
              return
            end
          end
          table.insert(items, link);
          Addon:Print(format("Added %s to the ignore list.", link));
          ClearCursor();
          Addon:UpdateData();
        else
          ClearCursor();
          Addon:Print("No item detected, so nothing added to the ignore list.");
        end
      end
    },
    ignoredItems = {
      order = 100,
      type = "multiselect",
      name = "Ignored Items",
      desc = "Items that should be excluded from valuation",
      width = "double",
      values = function()
        -- Return the list of values
        return Addon.GetFromDb("itemFilter", "items");
      end,
      get = function(info, index)
        -- All values are always enabled (checked)
        return true
      end,
      set = function(info, index, value)
        -- Unchecking an item is the only way this gets called, so we remove it the item from the list
        local items = Addon.GetFromDb("itemFilter", "items");
        local item = items[index];
        table.remove(items, index);
        Addon:Print(format("Removed %s from ignore list.", item));
        Addon:UpdateData();
      end
    },
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
      },
      helpHeader = {order = 70, type = "header", name = "Feedback"},
      generalText5 = {
        type = "description", order = 80, fontSize = "medium", name = "Need help?  Have a feature request?  Open an issue on the code repository for BagAppraiser or send me a PM on Reddit."
      },
      blank3 = { type = "description", order = 90, fontSize = "medium", name = "", width = "full", },
      generalText6 = { type = "description", order = 100, fontSize = "medium", name = "Issue Tracker:", width = "half", },
      generalText7 = { type = "description", order = 110, fontSize = "medium", name = "https://github.com/clocklear/BagAppraiser/issues", width = "double", },
      blank4 = { type = "description", order = 120, fontSize = "small", name = "", width = "full", },
      generalText8 = { type = "description", order = 130, fontSize = "medium", name = "Reddit:", width = "half", },
      generalText9 = { type = "description", order = 140, fontSize = "medium", name = "neoeraser (http://reddit.com/u/neoeraser)", width = "double", },
    }
}

function private.getOptionsTable()
  local profilesGroup = LibStub("AceDBOptions-3.0"):GetOptionsTable(Addon.db)

  local opts = { type = "group", name = format("%s %s", Addon.CONST.METADATA.NAME, Addon.CONST.METADATA.VERSION), childGroups = "tab",
      get = function(info) 
          return Addon.db.profile[info[#info]]
        end,
      set = function(info, value)
          Addon.db.profile[info[#info]] = value;
        end,
      args = {
        generalOptionsGrp = generalOptionsGroup,
        filterOptionsGroup = filterOptionsGroup,
        profilesGrp = profilesGroup,
        aboutGrp = aboutGroup,
      },
  };
  return opts;
end

function Config:OnEnable()
  Addon.Debug.Log("Config - Init")
  AceConfigRegistry:RegisterOptionsTable(Addon.CONST.METADATA.NAME, private.getOptionsTable)
  local baConfig = AceConfigDialog:AddToBlizOptions(Addon.CONST.METADATA.NAME)
  baConfig.default = private.resetDB
end

function private.resetDB()
  Addon.Debug.Log("Config.resetDB")

  Addon.db:ResetProfile(false, true)

  AceConfigRegistry:NotifyChange("LootAppraiser")
end
