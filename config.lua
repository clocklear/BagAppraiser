local Addon = select(2, ...)
local ADDON_NAME = ...;
local L = LibStub("AceLocale-3.0"):GetLocale(ADDON_NAME);

local Config = Addon:NewModule("Config", "AceEvent-3.0")
Addon.Config = Config

local private = {}

local AceConfigRegistry = LibStub("AceConfigRegistry-3.0")
local AceConfigDialog = LibStub("AceConfigDialog-3.0")

-- the config tabs
local generalOptionsGroup = {
  type = "group",
  order = 10,
  name = "General",
  args = {
    opt01 = {
      type = "select",
      order = 10,
      name = L["price_source"],
      desc = L["price_source_desc"],
      width = "double",
      values = function() return Addon.availablePriceSources end,
      get = function(info)
        return Addon.GetFromDb("pricesource", "source")
      end,
      set = function(info, value)
        local oldValue = Addon.GetFromDb("pricesource", "source")
        Addon.db.profile.pricesource.source = value;
        if oldValue ~= value then
          Addon:Print(L["price_source_changed"] .. Addon.CONST.PRICE_SOURCE[value])
          Addon:UpdateData();
        end
      end,
    },
    opt02 = {
      type = "description",
      order = 11,
      fontSize = "small",
      name = L["price_source_poor"]
    },
    opt03 = { type = "description", order = 13, fontSize = "small", name = " " },
    opt04 = {
      type = "select",
      order = 15,
      name = L["ldb_label_source"],
      desc = L["ldb_label_source_desc"],
      width = "double",
      values = function() return Addon.CONST.LABEL_SOURCE end,
      get = function(info) return Addon.db.profile.ldbsource end,
      set = function(info, value)
        local oldValue = Addon.db.profile.ldbsource;
        Addon.db.profile.ldbsource = value;
        if oldValue ~= value then
          Addon:Print(L["ldb_label_source_changed"] .. Addon.CONST.LABEL_SOURCE[value]);
          Addon:UpdateData();
        end
      end,
    },
    opt05 = { type = "description", order = 17, fontSize = "small", name = " " },
    opt06 = {
      type = "toggle",
      order = 20,
      name = L["show_minimap_icon"],
      width = "full",
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
    opt08 = {
      type = "toggle",
      order = 30,
      name = L["show_top_contributors"],
      desc = L["show_top_contributors_desc"],
      width = "full",
      get = function(info) return Addon.GetFromDb("topContributors", "enabled") end,
      set = function(info, value)
        Addon.db.profile.topContributors.enabled = value
        Addon:UpdateData();
      end,
    },
    opt09 = { type = "description", order = 35, fontSize = "small", name = " " },
    opt10 = {
      type = "toggle",
      order = 40,
      name = L["enable_guild_bank"],
      desc = L["enable_guild_bank_desc"],
      width = "full",
      get = function(info) return Addon.GetFromDb("guildBank", "enabled") end,
      set = function(info, value)
        Addon.db.profile.guildBank.enabled = value;
        Addon:UpdateData();
      end
    },
    opt11 = {
      type = "description",
      order = 50,
      fontSize = "small",
      name = L["enable_guild_bank_footer"]
    },
    opt12 = { type = "description", order = 51, fontSize = "small", name = " " },
    opt13 = {
      type = "select",
      order = 60,
      name = L["ldb_money_format"],
      desc = L["ldb_money_format_desc"],
      width = "double",
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
      type = "select",
      order = 70,
      name = L["tooltip_money_format"],
      desc = L["tooltip_money_format_desc"],
      width = "double",
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

local disabledInstructionsGroup = {
  type = "group",
  order = 10,
  name = "Instructions",
  args = {
    generalText1 = {
      type = "description",
      order = 10,
      fontSize = "medium",
      name = L["disabled_instructions"],
      width = "full"
    },
    blank = { type = "description", order = 11, fontSize = "small", name = " " },
    generalText2 = {
      type = "description",
      order = 12,
      fontSize = "medium",
      name = "- " .. L["tsm"],
      width = "full"
    },
    generalText3 = {
      type = "description",
      order = 13,
      fontSize = "medium",
      name = "- " .. L["oe"],
      width = "full"
    },
    -- generalText4 = {
    --   type = "description",
    --   order = 14,
    --   fontSize = "medium",
    --   name = "- " .. L["ahdb"],
    --   width = "full"
    -- },
    generalText5 = {
      type = "description",
      order = 15,
      fontSize = "medium",
      name = "- " .. L["atr"],
      width = "full"
    },
  }
}

local filterOptionsGroup = {
  type = "group",
  order = 15,
  name = "Filters",
  args = {
    enableQualityFilter = {
      type = "toggle",
      order = 60,
      name = L["enable_quality_filter"],
      desc = L["enable_quality_filter_desc"],
      width = "full",
      get = function(info) return Addon.GetFromDb("qualityFilter", "enabled") end,
      set = function(info, value)
        local oldValue = Addon.GetFromDb("qualityFilter", "enabled");
        Addon.db.profile.qualityFilter.enabled = value;
        if oldValue ~= value then
          Addon:Print(format(L["quality_filter_toggled"], value and L["enabled"] or L["disabled"]));
        end
        Addon:UpdateData();
      end
    },
    qualityFilter = {
      type = "select",
      order = 70,
      name = L["quality_filter"],
      width = "double",
      desc = L["quality_filter_desc"],
      values = Addon.CONST.QUALITY_FILTER,
      get = function(info) return Addon.GetFromDb("qualityFilter", "value") end,
      set = function(info, value)
        local oldValue = Addon.GetFromDb("qualityFilter", "value");
        Addon.db.profile.qualityFilter.value = value;
        if oldValue ~= value then
          Addon:Print(format(L["quality_filter_changed"], Addon.CONST.QUALITY_FILTER[value]));
        end
        Addon:UpdateData();
      end
    },
    blank5 = { type = "description", order = 80, fontSize = "small", name = " " },
    enableIgnoredItems = {
      type = "toggle",
      order = 85,
      name = L["item_blocklist_enable"],
      desc = L["item_blocklist_desc"],
      width = "full",
      get = function(info) return Addon.GetFromDb("itemFilter", "enabled") end,
      set = function(info, value)
        local oldValue = Addon.GetFromDb("itemFilter", "enabled");
        Addon.db.profile.itemFilter.enabled = value;
        if value then
          Addon.db.profile.itemAllow.enabled = false;
        end
        if oldValue ~= value then
          Addon:Print(format(L["item_blocklist_toggled"], value and L["enabled"] or L["disabled"]));
        end
        Addon:UpdateData();
      end
    },
    blank1 = {
      type = "description",
      order = 86,
      fontSize = "small",
      name = L["item_blocklist_instructions"]
    },
    add_block_item = {
      order = 90,
      type = "execute",
      name = L["drag_item_click"],
      width = "full",
      desc = "",
      descStyle = "inline",
      func = function()
        local type, _, link = GetCursorInfo()

        if type == "item" and link then
          local items = Addon.GetFromDb("itemFilter", "items");
          for k, v in ipairs(items) do
            if v == link then
              Addon:Print(format(L["item_on_blocklist"], link))
              ClearCursor();
              return
            end
          end
          table.insert(items, link);
          Addon:Print(format(L["item_added_blocklist"], link));
          ClearCursor();
          Addon:UpdateData();
        else
          ClearCursor();
          Addon:Print(L["item_blocklist_nothing_detected"]);
        end
      end
    },
    ignoredItems = {
      order = 100,
      type = "multiselect",
      name = L["blocked_items"],
      desc = L["blocked_items_desc"],
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
        Addon:Print(format(L["blocklist_removed_item"], item));
        Addon:UpdateData();
      end
    },
    enableAllowedItems = {
      type = "toggle",
      order = 110,
      name = L["item_allowlist_enable"],
      desc = L["item_allowlist_desc"],
      width = "full",
      get = function(info) return Addon.GetFromDb("itemAllow", "enabled") end,
      set = function(info, value)
        local oldValue = Addon.GetFromDb("itemAllow", "itemAllow");
        Addon.db.profile.itemAllow.enabled = value;
        if value then
          Addon.db.profile.itemFilter.enabled = false;
        end
        if oldValue ~= value then
          Addon:Print(format(L["item_allowlist_toggled"], value and L["enabled"] or L["disabled"]));
        end
        Addon:UpdateData();
      end
    },
    blank2 = {
      type = "description",
      order = 120,
      fontSize = "small",
      name = L["item_allowlist_instructions"]
    },
    add_allow_item = {
      order = 130,
      type = "execute",
      name = L["drag_item_click"],
      width = "full",
      desc = "",
      descStyle = "inline",
      func = function()
        local type, _, link = GetCursorInfo()

        if type == "item" and link then
          local items = Addon.GetFromDb("itemAllow", "items");
          for k, v in ipairs(items) do
            if v == link then
              Addon:Print(format(L["item_on_allowlist"], link))
              ClearCursor();
              return
            end
          end
          table.insert(items, link);
          Addon:Print(format(L["item_added_allowlist"], link));
          ClearCursor();
          Addon:UpdateData();
        else
          ClearCursor();
          Addon:Print(L["item_allowlist_nothing_detected"]);
        end
      end
    },
    allowedItems = {
      order = 140,
      type = "multiselect",
      name = L["allowed_items"],
      desc = L["allowed_items_desc"],
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
        Addon:Print(format(L["allowlist_removed_item"], item));
        Addon:UpdateData();
      end
    },
  }
}

local aboutGroup = {
  type = "group",
  order = 20,
  name = L["about"],
  args = {
    generalText1 = {
      type = "description",
      order = 10,
      fontSize = "medium",
      name = L["about_bagappraiser"],
      width = "full"
    },
    thanksHeader = { order = 20, type = "header", name = L["credits"], },
    generalText2 = {
      type = "description", order = 40, fontSize = "medium", name = L["author"]
    },
    blank1 = { type = "description", order = 50, fontSize = "small", name = "", width = "full", },
    generalText3 = {
      type = "description",
      order = 53,
      fontSize = "medium",
      name = L["woweconomy_thanks"]
    },
    blank2 = { type = "description", order = 56, fontSize = "small", name = "", width = "full", },
    generalText4 = {
      type = "description",
      order = 60,
      fontSize = "medium",
      name = L["other_thanks"],

    },
    helpHeader = { order = 70, type = "header", name = "Feedback" },
    generalText5 = {
      type = "description",
      order = 80,
      fontSize = "medium",
      name = L["need_help"]
    },
    blank3 = { type = "description", order = 90, fontSize = "medium", name = "", width = "full", },
    generalText6 = { type = "description", order = 100, fontSize = "medium", name = L["issue_tracker"], width = "half", },
    generalText7 = {
      type = "description",
      order = 110,
      fontSize = "medium",
      name = "github.com/clocklear/BagAppraiser/issues",
      width = "double",
    },
    blank4 = { type = "description", order = 120, fontSize = "small", name = "", width = "full", },
    generalText8 = { type = "description", order = 130, fontSize = "medium", name = "Reddit:", width = "half", },
    generalText9 = {
      type = "description",
      order = 140,
      fontSize = "medium",
      name = "neoeraser (reddit.com/u/neoeraser)",
      width = "double",
    },
  }
}

function private.getOptionsTable()
  local profilesGroup = LibStub("AceDBOptions-3.0"):GetOptionsTable(Addon.db)

  local pages = {};
  if Addon:IsEnabled() then
    pages['generalOptionsGrp'] = generalOptionsGroup;
    pages['filterOptionsGroup'] = filterOptionsGroup;
    pages['profilesGrp'] = profilesGroup;
    pages['aboutGroup'] = aboutGroup;
  else
    pages['disabledInstructionsGrp'] = disabledInstructionsGroup;
    pages['aboutGroup'] = aboutGroup;
  end

  local opts = {
    type = "group",
    name = format("%s %s", Addon.CONST.METADATA.NAME, Addon.CONST.METADATA.VERSION),
    childGroups = "tab",
    get = function(info)
      return Addon.db.profile[info[#info]]
    end,
    set = function(info, value)
      Addon.db.profile[info[#info]] = value;
    end,
    args = pages,
  };
  return opts;
end

function Config:OnEnable()
  Addon.Debug.Log("Config - Init")
  AceConfigRegistry:RegisterOptionsTable(Addon.CONST.METADATA.NAME, private.getOptionsTable)
  local baConfig = AceConfigDialog:AddToBlizOptions(Addon.CONST.METADATA.NAME)
  baConfig.default = private.resetDB
  Addon.Debug.Log("Config - Complete")
end

function private.resetDB()
  Addon.Debug.Log("Config.resetDB")

  Addon.db:ResetProfile(false, true)

  AceConfigRegistry:NotifyChange("BagAppraiser")
end
