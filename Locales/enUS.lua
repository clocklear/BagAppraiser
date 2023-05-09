local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "enUS", true)

L["welcome_message"] = "%s loaded.  Type '/ba' to open the config.";
L["feature_filter"] =
"NEW -- BagAppraiser now supports allowlists and blocklists!  Check the config window for more details.";
L["feature_allowlist"] = "NEW -- BagAppraiser now supports allowlists!  Check the config window for more details.";
L["feature_classic"] = "NEW -- BagAppraiser now supports Classic Era and Wrath!";
L["addon_disabled"] = "|cffff0000BagAppraiser disabled.|r (see popup window for further details)";
L["missing_price_source"] =
"|cffff0000Attention!|r Your selected price source in BagAppraiser is not or no longer valid (maybe due to a missing module/addon). Please select another price source in the BagAppraiser settings or install the needed module/addon for the selected price source.";
L["poor"] = "Poor";
L["common"] = "Common";
L["uncommon"] = "Uncommon";
L["rare"] = "Rare";
L["epic"] = "Epic";
L["historical_price"] = "Historical Price";
L["market_value"] = "Market Value";
L["region_historical_price"] = "Region Historical Price";
L["region_market_value_avg"] = "Region Market Value Avg";
L["region_min_buyout_avg"] = "Region Min Buyout Avg";
L["region_global_sale_average"] = "Region Global Sale Average";
L["vendorsell"] = "VendorSell";
L["globalMedian"] = "Regional Median";
L["globalMean"] = "Regional Mean";
L["globalStdDev"] = "Regional Std Dev";
L["stddev"] = "14-Day Std Dev";
L["market"] = "14-Day Price";
L["recent"] = "3-Day Price";
L["bagtotal"] = "Bag Total";
L["banktotal"] = "Bank Total";
L["combinedtotal"] = "Combined Total";
L["precision_full"] = "Full Precision";
L["precision_silver"] = "Nearest Silver";
L["precision_gold"] = "Nearest Gold";
L["price_source"] = "Price Source";
L["price_source_desc"] = "Predefined price sources for item value calculation.";
L["price_source_changed"] = "Price source changed to: ";
L["price_source_poor"] = "|cff9d9d9dPoor|r quality items are always valued with the VendorSell source.";
L["ldb_label_source"] = "LDB Label Source";
L["ldb_label_source_desc"] = "Controls what is displayed for the addon within LDB host frames.";
L["ldb_label_source_changed"] = "LDB label source changed to: ";
L["show_minimap_icon"] = "Show minimap icon";
L["show_top_contributors"] = "Show top contributors";
L["show_top_contributors_desc"] = "Displays the top 10 unique items contributing to the total value.";
L["enable_guild_bank"] = "Enable guild bank";
L["enable_guild_bank_desc"] =
"Summarize the contents of the guild bank.  This settings has no effect if you aren't in a guild.";
L["enable_guild_bank_footer"] =
"Enabling the guild bank will include its value anywhere the 'Combined Total' is displayed.  Guild bank calculations are not shared amongst characters.";
L["ldb_money_format"] = "LDB Money Format";
L["ldb_money_format_desc"] = "Controls the precision of the amount shown in the LDB display.";
L["tooltip_money_format"] = "Tooltip Money Format";
L["tooltip_money_format_desc"] = "Controls the precision of the amounts shown in the tooltip.";
L["enable_quality_filter"] = "Enable quality filter";
L["enable_quality_filter_desc"] = "If enabled, ignores items below the selected quality";
L["enabled"] = "enabled";
L["disabled"] = "disabled";
L["quality_filter_toggled"] = "Quality filter %s";
L["quality_filter"] = "Quality Filter";
L["quality_filter_desc"] = "Items below the selected quality will not factor into calculations";
L["quality_filter_changed"] = "Quality Filter set to: %s and above";
L["item_blocklist_enable"] = "Enable item blocklist";
L["item_blocklist_desc"] = "If enabled, ignores any item added to the blocklist.  Mutually exclusive with allowlist.";
L["item_blocklist_toggled"] = "Item blocklist %s";
L["item_blocklist_instructions"] =
"To add to the blocklist, drag an item to the button below and click it.  Any item added to the blocklist will be skipped when assessing bag value.  Soulbound items are automatically skipped.  You can remove items by unchecking them inside the blocklist."
L["drag_item_click"] = "Drag an item here and click to add it.";
L["item_on_blocklist"] = "%s is already on the blocklist.";
L["item_added_blocklist"] = "Added %s to the blocklist.";
L["item_blocklist_nothing_detected"] = "No item detected, so nothing added to the blocklist.";
L["blocked_items"] = "Blocked Items";
L["blocked_items_desc"] = "Items that should be excluded from valuation";
L["blocklist_removed_item"] = "Removed %s from blocklist."
L["item_allowlist_enable"] = "Enable item allowlist";
L["item_allowlist_desc"] =
"If enabled, only items added to the allowlist will be counted.  Mutually exclusive with blocklist.";
L["item_allowlist_toggled"] = "Item allowlist %s";
L["item_allowlist_instructions"] =
"To add to the allowlist, drag an item to the button below and click it.  Only items added to the allowlist will be considered when assessing bag value.  You can remove items by unchecking them inside the allowlist."
L["item_on_allowlist"] = "%s is already on the allowlist.";
L["item_added_allowlist"] = "Added %s to the allowlist.";
L["item_allowlist_nothing_detected"] = "No item detected, so nothing added to the allowlist.";
L["allowed_items"] = "Allowed Items";
L["allowed_items_desc"] = "Items that should be exclusively considered for valuation";
L["allowlist_removed_item"] = "Removed %s from allowlist.";
L["about"] = "About";
L["about_bagappraiser"] =
"BagAppraiser is a simple addon that values the contents of your bags and bank using the selected pricing source.\n\nPlease understand, this addon does NOT determine liquid gold you are guaranteed to make but rather, potential ‘asset’ values (looted item value) of items looted where you will have to do the work and sell it on the Auction House, trade chat, etc.\n";
L["credits"] = "Credits";
L["author"] = "Written by clocklear (github.com/clocklear)";
L["woweconomy_thanks"] = "Thanks to /r/woweconomy for the support and the great feature ideas.";
L["other_thanks"] =
"Special thanks to ProfitzTV and Testerle for their work on LootAppraiser; this addon borrows heavily from their work.  I'm standing on the shoulders of giants.";
L["need_help"] =
"Need help?  Have a feature request?  Open an issue on the code repository for BagAppraiser or send me a PM on Reddit.";
L["issue_tracker"] = "Issue Tracker:";
L["feedback"] = "Feedback";
L["tsm"] = "TradeSkillMaster"
L["oe"] = "Oribos Exchange"
L["ahdb"] = "Auction House Database"
L["atr"] = "Auctionator"
L["realm_price"] = "Realm Price";
L["region_price"] = "Region Price";
L["disabled_instructions"] =
"BagAppraiser is running in disabled mode because a suitable pricing source cannot be found.  You can fix this by installing one of the following addons:"
L["min_bid"] = "Minimum Bid";
L["min_buyout"] = "Minimum Buyout";
L["no_price_sources"] =
"|cffff0000Attention!|r Missing additional addons for price sources.  See the addon configuration panel for more details.\n\n|cffff0000BagAppraiser disabled.|r";
L["auction_value"] = "Auction Value";
L["feature_localization"] =
"NEW -- BagAppraiser now features localization support! A broad range of native languages are now accommodated."
L["feature_pricing_sources"] =
"NEW -- In addition to TSM, BagAppraiser now supports Auction House DataBase, Auctionator, and Oribos Exchange as alternative price sources."
L["bags"] = "Bags";
L["bag"] = "Bag";
L["bank"] = "Bank";
L["guild_bank"] = "Guild Bank";
L["total"] = "Total";
L["based_on"] = "Based on";
L["bank_last_updated"] = "Bank last updated";
L["guild_bank_last_updated"] = "Guild bank last updated";
L["open_options"] = "|cFFFFFFCCLeft-Click|r to open the options window";
L["top_contributors"] = "Top %d Contributors";
L["text_display"] = "Text Display";
