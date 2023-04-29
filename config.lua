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
    opt01 = {
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
    opt02 = { type = "description", order = 11, fontSize = "small", name = "|cff9d9d9dPoor|r quality items are always valued with the VendorSell source." },
    opt03 = { type = "description", order = 13, fontSize = "small", name = " " },
    opt04 = {
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
    opt05 = { type = "description", order = 17, fontSize = "small", name = " " },
    opt06 = { type = "toggle", order = 20, name = "Show minimap icon", width = "full",
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
    opt07 = { type = "description", order = 25, fontSize = "small", name = " " },
    opt08 = { type = "toggle", order = 30, name = "Show top contributors", desc = "Displays the top 10 unique items contributing to the total value.", width = "full",
      get = function(info) return Addon.GetFromDb("topContributors", "enabled") end,
      set = function(info, value)
          Addon.db.profile.topContributors.enabled = value
          Addon:UpdateData();
      end,
    },
    opt09 = { type = "description", order = 35, fontSize = "small", name = " " },
    opt10 = { type = "toggle", order = 40, name = "Enable guild bank", desc = "Summarize the contents of the guild bank.  This settings has no effect if you aren't in a guild.", width = "full", 
      get = function(info) return Addon.GetFromDb("guildBank", "enabled") end,
      set = function(info, value)
          Addon.db.profile.guildBank.enabled = value;
          Addon:UpdateData();
      end
    },
    opt11 = { type = "description", order = 50, fontSize = "small", name = "Enabling the guild bank will include its value anywhere the 'Combined Total' is displayed.  Guild bank calculations are not shared amongst characters." },
    opt12 = { type = "description", order = 51, fontSize = "small", name = " " },
    opt13 = {
      type = "select", order = 60, name = "LDB Money Format", desc = "Controls the precision of the amount shown in the LDB display.", width = "double",
      values = function() return Addon.CONST.MONEY_PRECISION end,
      get = function(info)
          return Addon.GetFromDb("moneyPrecision", "ldb")
      end,
      set = function(info, value)
          Addon.db.profile.moneyPrecision.ldb = value;
          Addon:UpdateData();
      end,
    },
    opt14 = {
      type = "select", order = 70, name = "Tooltip Money Format", desc = "Controls the precision of the amounts shown in the tooltip.", width = "double",
      values = function() return Addon.CONST.MONEY_PRECISION end,
      get = function(info)
        return Addon.GetFromDb("moneyPrecision", "tooltip")
      end,
      set = function(info, value)
        Addon.db.profile.moneyPrecision.tooltip = value;
        Addon:UpdateData();
      end,
    },
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
    enableIgnoredItems = { type = "toggle", order = 85, name = "Enable item blocklist", desc = "If enabled, ignores any item added to the blocklist.  Mutually exclusive with allowlist.", width = "full", 
      get = function(info) return Addon.GetFromDb("itemFilter", "enabled") end,
      set = function(info, value)
          local oldValue = Addon.GetFromDb("itemFilter", "enabled");
          Addon.db.profile.itemFilter.enabled = value;
          if value then
            Addon.db.profile.itemAllow.enabled = false;
          end
          if oldValue ~= value then
            Addon:Print(format("Item blocklist %s", value and "enabled." or "disabled."));
          end
          Addon:UpdateData();
      end
    },
    blank1 = { type = "description", order = 86, fontSize = "small", name = "To add to the blocklist, drag an item to the button below and click it.  Any item added to the blocklist will be skipped when assessing bag value.  Soulbound items are automatically skipped.  You can remove items by unchecking them inside the blocklist." },
    add_block_item = {
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
              Addon:Print(format("%s is already on the blocklist.", link))
              ClearCursor();
              return
            end
          end
          table.insert(items, link);
          Addon:Print(format("Added %s to the blocklist.", link));
          ClearCursor();
          Addon:UpdateData();
        else
          ClearCursor();
          Addon:Print("No item detected, so nothing added to the blocklist.");
        end
      end
    },
    ignoredItems = {
      order = 100,
      type = "multiselect",
      name = "Blocked Items",
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
        Addon:Print(format("Removed %s from blocklist.", item));
        Addon:UpdateData();
      end
    },
    enableAllowedItems = { type = "toggle", order = 110, name = "Enable item allowlist", desc = "If enabled, only items added to the allowlist will be counted.  Mutually exclusive with blocklist.", width = "full", 
      get = function(info) return Addon.GetFromDb("itemAllow", "enabled") end,
      set = function(info, value)
          local oldValue = Addon.GetFromDb("itemAllow", "itemAllow");
          Addon.db.profile.itemAllow.enabled = value;
          if value then
            Addon.db.profile.itemFilter.enabled = false;
          end
          if oldValue ~= value then
            Addon:Print(format("Item allowlist %s", value and "enabled." or "disabled."));
          end
          Addon:UpdateData();
      end
    },
    blank2 = { type = "description", order = 120, fontSize = "small", name = "To add to the allowlist, drag an item to the button below and click it.  Only items added to the allowlist will be considered when assessing bag value.  You can remove items by unchecking them inside the allowlist." },
    add_allow_item = {
    order = 130,
    type = "execute",
    name = "Drag an item here and click to add it.",
    width = "full",
    desc = "",
    descStyle = "inline",
    func = function()
      local type, _, link = GetCursorInfo()

      if type == "item" and link then
        local items = Addon.GetFromDb("itemAllow", "items");
        for k, v in ipairs(items) do
          if v == link then
            Addon:Print(format("%s is already on the allowlist.", link))
            ClearCursor();
            return
          end
        end
        table.insert(items, link);
        Addon:Print(format("Added %s to the allowlist.", link));
        ClearCursor();
        Addon:UpdateData();
      else
        ClearCursor();
        Addon:Print("No item detected, so nothing added to the allowlist.");
      end
    end
    },
    allowedItems = {
      order = 140,
      type = "multiselect",
      name = "Allowed Items",
      desc = "Items that should be exclusively considered for valuation",
      width = "double",
      values = function()
        -- Return the list of values
        return Addon.GetFromDb("itemAllow", "items");
      end,
      get = function(info, index)
        -- All values are always enabled (checked)
        return true
      end,
      set = function(info, index, value)
        -- Unchecking an item is the only way this gets called, so we remove it the item from the list
        local items = Addon.GetFromDb("itemAllow", "items");
        local item = items[index];
        table.remove(items, index);
        Addon:Print(format("Removed %s from allowlist.", item));
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
        type = "description", order = 40, fontSize = "medium", name = "Written by clocklear (github.com/clocklear)"
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
      generalText7 = { type = "description", order = 110, fontSize = "medium", name = "github.com/clocklear/BagAppraiser/issues", width = "double", },
      blank4 = { type = "description", order = 120, fontSize = "small", name = "", width = "full", },
      generalText8 = { type = "description", order = 130, fontSize = "medium", name = "Reddit:", width = "half", },
      generalText9 = { type = "description", order = 140, fontSize = "medium", name = "neoeraser (reddit.com/u/neoeraser)", width = "double", },
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

  AceConfigRegistry:NotifyChange("BagAppraiser")
end
