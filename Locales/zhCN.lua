local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "zhCN")
if not L then return end

L["welcome_message"] = "%s 已加载。输入 '/ba' 以打开配置。";
L["feature_filter"] =
"新功能 -- BagAppraiser 现在支持允许列表和阻止列表！查看配置窗口以获取更多详细信息。";
L["feature_allowlist"] = "新功能 -- BagAppraiser 现在支持允许列表！查看配置窗口以获取更多详细信息。";
L["feature_classic"] = "新功能 -- BagAppraiser 现在支持 Classic Era 和 Wrath！";
L["addon_disabled"] = "|cffff0000BagAppraiser 已禁用。|r （查看弹出窗口以获取更多详细信息）";
L["missing_price_source"] =
"|cffff0000注意！|r 在 BagAppraiser 中选择的价格来源无效或不再有效（可能是由于缺少模块/插件）。请在 BagAppraiser 设置中选择另一个价格来源，或为所选价格来源安装所需的模块/插件。";
L["poor"] = "粗糙";
L["common"] = "普通";
L["uncommon"] = "优秀";
L["rare"] = "精良";
L["epic"] = "史诗";
L["historical_price"] = "历史价格";
L["market_value"] = "市场价值";
L["min_buyout"] = "最低一口价";
L["region_historical_price"] = "地区历史价格";
L["region_market_value_avg"] = "地区市场价值平均";
L["region_min_buyout_avg"] = "地区最低一口价平均";
L["region_global_sale_average"] = "地区全球销售平均";
L["vendorsell"] = "商人出售";
L["globalMedian"] = "区域中位数";
L["globalMean"] = "区域平均数";
L["globalStdDev"] = "区域标准差";
L["stddev"] = "14 天标准差";
L["market"] = "14 天价格";
L["recent"] = "3 天价格";
L["bagtotal"] = "背包总计";
L["banktotal"] = "银行总计";
L["combinedtotal"] = "合计";
L["precision_full"] = "完全精确";
L["precision_silver"] = "最接近银币";
L["precision_gold"] = "最接近金币";
L["price_source"] = "价格来源";
L["price_source_desc"] = "物品价值计算的预定义价格来源。";
L["price_source_changed"] = "价格来源已更改为：";
L["price_source_poor"] = "|cff9d9d9d劣质|r品质的物品始终使用VendorSell来源进行估价。";
L["ldb_label_source"] = "LDB标签来源";
L["ldb_label_source_desc"] = "控制在LDB主机框架内显示的插件内容。";
L["ldb_label_source_changed"] = "LDB标签来源已更改为：";
L["show_minimap_icon"] = "显示小地图图标";
L["show_top_contributors"] = "显示最大贡献者";
L["show_top_contributors_desc"] = "显示对总价值贡献最大的10个独特物品。";
L["enable_guild_bank"] = "启用公会银行";
L["enable_guild_bank_desc"] = "汇总公会银行的内容。如果你不在公会里，此设置无效。";
L["enable_guild_bank_footer"] = "启用公会银行将在“综合总计”中包含其价值。公会银行计算不在角色之间共享。";
L["ldb_money_format"] = "LDB货币格式";
L["ldb_money_format_desc"] = "控制LDB显示中显示的金额精度。";
L["tooltip_money_format"] = "工具提示货币格式";
L["tooltip_money_format_desc"] = "控制工具提示中显示的金额精度。";
L["enable_quality_filter"] = "启用品质过滤";
L["enable_quality_filter_desc"] = "如果启用，则忽略低于所选品质的物品";
L["enabled"] = "已启用";
L["disabled"] = "已禁用";
L["quality_filter_toggled"] = "品质过滤器%s";
L["quality_filter"] = "品质过滤器";
L["quality_filter_desc"] = "低于所选品质的物品将不计入计算";
L["quality_filter_changed"] = "品质过滤器设置为：%s及以上";
L["item_blocklist_enable"] = "启用物品黑名单";
L["item_blocklist_desc"] = "如果启用，将忽略添加到黑名单的任何物品。与白名单互斥。";
L["item_blocklist_toggled"] = "物品黑名单%s";
L["item_blocklist_instructions"] = "要添加到黑名单，请将物品拖到下面的按钮上并点击。添加到黑名单的物品在评估包价值时将被跳过。灵魂绑定的物品将自动跳过。您可以通过在黑名单中取消选中来删除物品。";
L["drag_item_click"] = "将物品拖到这里并单击以添加。";
L["item_on_blocklist"] = "%s已在黑名单上。";
L["item_added_blocklist"] = "将%s添加到黑名单。";
L["item_blocklist_nothing_detected"] = "未检测到物品，因此没有添加到黑名单。";
L["blocked_items"] = "被屏蔽的物品";
L["blocked_items_desc"] = "应从估价中排除的物品";
L["blocklist_removed_item"] = "从黑名单中删除了%s。";
L["item_allowlist_enable"] = "启用物品白名单";
L["item_allowlist_desc"] = "如果启用，只会计算添加到白名单的物品。与黑名单互斥。";
L["item_allowlist_toggled"] = "物品白名单%s";
L["item_allowlist_instructions"] = "要添加到白名单，请将物品拖到下面的按钮上并点击。只有添加到白名单的物品才会在评估包价值时被考虑。您可以通过在白名单中取消选中来删除物品。";
L["item_on_allowlist"] = "%s已在白名单上。";
L["item_added_allowlist"] = "将%s添加到白名单。";
L["item_allowlist_nothing_detected"] = "未检测到物品，因此没有添加到白名单。";
L["allowed_items"] = "允许的物品";
L["allowed_items_desc"] = "应专门考虑估价的物品";
L["allowlist_removed_item"] = "从白名单中删除了%s。";
L["about"] = "关于";
L["about_bagappraiser"] =
"BagAppraiser是一个简单的插件，使用所选定的价格来源对您的背包和银行的内容进行估价。\n\n请了解，此插件不是确定您可以保证赚取的现金黄金，而是潜在的“资产”价值（战利品价值）的物品，您将必须在拍卖行、交易聊天等地进行工作并出售。\n";
L["credits"] = "致谢";
L["author"] = "作者：clocklear（github.com/clocklear）";
L["woweconomy_thanks"] = "感谢/r/woweconomy的支持和伟大的功能想法。";
L["other_thanks"] = "特别感谢ProfitzTV和Testerle在LootAppraiser上的工作；这个插件大量借鉴了他们的工作。我站在巨人的肩膀上。";
L["need_help"] = "需要帮助？有功能请求？在BagAppraiser的代码库上打开一个问题或在Reddit上给我发送私信。";
L["issue_tracker"] = "问题跟踪器：";
L["feedback"] = "反馈";
L["realm_price"] = "服务器价格";
L["region_price"] = "区域价格";
L["disabled_instructions"] =
"BagAppraiser正以禁用模式运行，因为无法找到合适的价格来源。您可以通过安装以下插件之一来解决此问题："
L["min_bid"] = "最低竞价";
L["min_buyout"] = "最低一口价";
L["no_price_sources"] =
"|cffff0000注意！|r 缺少价格来源的附加插件。请查看插件配置面板以获取更多详细信息。\n\n|cffff0000BagAppraiser已禁用.|r";
