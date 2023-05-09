local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "zhTW")
if not L then return end

L["welcome_message"] = "%s 已載入。輸入 '/ba' 以打開設定。";
L["feature_filter"] =
"新功能 -- BagAppraiser 現在支援允許列表和阻止列表！查看設定視窗以獲得更多詳情。";
L["feature_allowlist"] = "新功能 -- BagAppraiser 現在支援允許列表！查看設定視窗以獲得更多詳情。";
L["feature_classic"] = "新功能 -- BagAppraiser 現在支援 Classic Era 和 Wrath！";
L["addon_disabled"] = "|cffff0000BagAppraiser 已停用。|r （查看彈出視窗以獲得更多詳情）";
L["missing_price_source"] =
"|cffff0000注意！|r 你在 BagAppraiser 中選擇的價格來源無效或不再有效（可能是因為缺少模組/插件）。請在 BagAppraiser 設定中選擇另一個價格來源，或為選定的價格來源安裝所需的模組/插件。";
L["poor"] = "粗糙";
L["common"] = "普通";
L["uncommon"] = "優秀";
L["rare"] = "精良";
L["epic"] = "史詩";
L["historical_price"] = "歷史價格";
L["market_value"] = "市場價值";
L["region_historical_price"] = "地區歷史價格";
L["region_market_value_avg"] = "地區市場價值平均";
L["region_min_buyout_avg"] = "地區最低直購價平均";
L["region_global_sale_average"] = "地區全球銷售平均";
L["vendorsell"] = "商人售價";
L["globalMedian"] = "地區中位數";
L["globalMean"] = "地區平均數";
L["globalStdDev"] = "地區標準差";
L["stddev"] = "14 天標準差";
L["market"] = "14 天價格";
L["recent"] = "3 天價格";
L["bagtotal"] = "背包總計";
L["banktotal"] = "銀行總計";
L["combinedtotal"] = "綜合總計";
L["precision_full"] = "完整精確度";
L["precision_silver"] = "最接近銀幣";
L["precision_gold"] = "最接近金幣";
L["price_source"] = "價格來源";
L["price_source_desc"] = "預定義的物品價值計算價格來源。";
L["price_source_changed"] = "價格來源已更改為：";
L["price_source_poor"] = "|cff9d9d9d劣質|r品質的物品始終使用VendorSell來源進行估價。";
L["ldb_label_source"] = "LDB標籤來源";
L["ldb_label_source_desc"] = "控制在LDB主機框架內顯示的插件內容。";
L["ldb_label_source_changed"] = "LDB標籤來源已更改為：";
L["show_minimap_icon"] = "顯示小地圖圖標";
L["show_top_contributors"] = "顯示最大貢獻者";
L["show_top_contributors_desc"] = "顯示對總價值貢獻最大的10個獨特物品。";
L["enable_guild_bank"] = "啟用公會銀行";
L["enable_guild_bank_desc"] = "匯總公會銀行的內容。如果你不在公會裡，此設置無效。";
L["enable_guild_bank_footer"] = "啟用公會銀行將在“綜合總計”中包含其價值。公會銀行計算不在角色之間共享。";
L["ldb_money_format"] = "LDB貨幣格式";
L["ldb_money_format_desc"] = "控制LDB顯示中顯示的金額精度。";
L["tooltip_money_format"] = "工具提示貨幣格式";
L["tooltip_money_format_desc"] = "控制工具提示中顯示的金額精度。";
L["enable_quality_filter"] = "啟用品質過濾";
L["enable_quality_filter_desc"] = "如果啟用，則忽略低於所選品質的物品";
L["enabled"] = "已啟用";
L["disabled"] = "已禁用";
L["quality_filter_toggled"] = "品質過濾器%s";
L["quality_filter"] = "品質過濾器";
L["quality_filter_desc"] = "低於所選品質的物品將不計入計算";
L["quality_filter_changed"] = "品質過濾器設置為：%s及以上";
L["item_blocklist_enable"] = "啟用物品黑名單";
L["item_blocklist_desc"] = "如果啟用，將忽略添加到黑名單的任何物品。與白名單互斥。";
L["item_blocklist_toggled"] = "物品黑名單%s";
L["item_blocklist_instructions"] = "要添加到黑名單，請將物品拖到下面的按鈕上並點擊。添加到黑名單的物品在評估包價值時將被跳過。靈魂綁定的物品將自動跳過。您可以通過在黑名單中取消選中來刪除物品。";
L["drag_item_click"] = "將物品拖到這裡並單擊以添加。";
L["item_on_blocklist"] = "%s已在黑名單上。";
L["item_added_blocklist"] = "將%s添加到黑名單。";
L["item_blocklist_nothing_detected"] = "未檢測到物品，因此沒有添加到黑名單。";
L["blocked_items"] = "被屏蔽的物品";
L["blocked_items_desc"] = "應從估價中排除的物品";
L["blocklist_removed_item"] = "從黑名單中刪除了%s。";
L["item_allowlist_enable"] = "啟用物品白名單";
L["item_allowlist_desc"] = "如果啟用，只會計算添加到白名單的物品。與黑名單互斥。";
L["item_allowlist_toggled"] = "物品白名單%s";
L["item_allowlist_instructions"] = "要添加到白名單，請將物品拖到下面的按鈕上並點擊。只有添加到白名單的物品才會在評估包價值時被考慮。您可以通過在白名單中取消選中來刪除物品。";
L["item_on_allowlist"] = "%s已在白名單上。";
L["item_added_allowlist"] = "將%s添加到白名單。";
L["item_allowlist_nothing_detected"] = "未檢測到物品，因此沒有添加到白名單。";
L["allowed_items"] = "允許的物品";
L["allowed_items_desc"] = "應專門考慮估價的物品";
L["allowlist_removed_item"] = "從白名單中刪除了%s。";
L["about"] = "關於";
L["about_bagappraiser"] =
"BagAppraiser是一個簡單的插件，使用所選定的價格來源對您的背包和銀行的內容進行估價。\n\n請了解，此插件不是確定您可以保證賺取的現金黃金，而是潛在的“資產”價值（戰利品價值）的物品，您將必須在拍賣行、交易聊天等地進行工作並出售。\n";
L["credits"] = "致謝";
L["author"] = "作者：clocklear（github.com/clocklear）";
L["woweconomy_thanks"] = "感謝/r/woweconomy的支持和偉大的功能想法。";
L["other_thanks"] = "特別感謝ProfitzTV和Testerle在LootAppraiser上的工作；這個插件大量借鑒了他們的工作。我站在巨人的肩膀上。";
L["need_help"] = "需要幫助？有功能請求？在BagAppraiser的代碼庫上打開一個問題或在Reddit上給我發送私信。";
L["issue_tracker"] = "問題跟踪器：";
L["feedback"] = "回饋";
L["realm_price"] = "伺服器價格";
L["region_price"] = "區域價格";
L["disabled_instructions"] =
"BagAppraiser正以停用模式運行，因為無法找到合適的價格來源。您可以通過安裝以下插件之一來解決此問題："
L["min_bid"] = "最低競價";
L["min_buyout"] = "最低一口價";
L["no_price_sources"] =
"|cffff0000注意！|r 缺少價格來源的附加插件。請查看插件配置面板以獲取更多詳細信息。\n\n|cffff0000BagAppraiser已停用.|r";
L["feature_localization"] =
"新功能 -- BagAppraiser 現在支援本地化功能！擁有更多原生語言支援。"
L["feature_pricing_sources"] =
"新功能 -- 除了 TSM，BagAppraiser 現在還支援拍賣行資料庫、Auctionator 和 Oribos Exchange 作為替代價格來源。"
L["bags"] = "背包";
L["bag"] = "背包";
L["bank"] = "銀行";
L["guild_bank"] = "公會銀行";
L["total"] = "總計";
L["based_on"] = "基於";
L["bank_last_updated"] = "銀行最後更新";
L["guild_bank_last_updated"] = "公會銀行最後更新";
L["open_options"] = "|cFFFFFFCC左鍵點擊|r打開選項窗口";
L["top_contributors"] = "前%d名貢獻者";
L["text_display"] = "文字顯示";
L["recent_value"] = "最近市場價值";
