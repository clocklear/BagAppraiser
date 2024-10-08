local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "koKR")
if not L then return end

L["welcome_message"] = "%s 로드 완료. '/ba'를 입력하여 설정을 엽니다.";
L["feature_filter"] =
"NEW -- BagAppraiser 이제 허용 목록 및 차단 목록을 지원합니다! 설정 창에서 자세한 정보를 확인하세요.";
L["feature_allowlist"] = "NEW -- BagAppraiser 이제 허용 목록을 지원합니다! 설정 창에서 자세한 정보를 확인하세요.";
L["feature_classic"] = "NEW -- BagAppraiser 이제 Classic Era와 Wrath를 지원합니다!";
L["addon_disabled"] = "|cffff0000BagAppraiser 비활성화.|r (팝업 창에서 자세한 정보를 확인하십시오)";
L["missing_price_source"] =
"|cffff0000주의!|r BagAppraiser에서 선택한 가격 출처가 유효하지 않거나 더 이상 유효하지 않습니다 (누락된 모듈/애드온 때문일 수 있음). BagAppraiser 설정에서 다른 가격 출처를 선택하거나 선택한 가격 출처에 필요한 모듈/애드온을 설치하십시오.";
L["poor"] = "하급";
L["common"] = "일반";
L["uncommon"] = "고급";
L["rare"] = "희귀";
L["epic"] = "영웅";
L["historical_price"] = "역사적 가격";
L["market_value"] = "시장 가치";
L["region_historical_price"] = "지역 역사 가격";
L["region_market_value_avg"] = "지역 시장 가치 평균";
L["region_min_buyout_avg"] = "지역 최소 구매 평균";
L["region_global_sale_average"] = "지역 전체 평균 판매 가격";
L["vendorsell"] = "상인 판매";
L["globalMedian"] = "지역 중앙값";
L["globalMean"] = "지역 평균";
L["globalStdDev"] = "지역 표준 편차";
L["stddev"] = "14일 표준 편차";
L["market"] = "14일 가격";
L["recent"] = "3일 가격";
L["bagtotal"] = "가방 합계";
L["banktotal"] = "은행 합계";
L["combinedtotal"] = "총 합계";
L["precision_full"] = "전체 정밀도";
L["precision_silver"] = "가장 가까운 은화";
L["precision_gold"] = "가장가까운 금화";
L["price_source"] = "가격 출처";
L["price_source_desc"] = "아이템 가치 계산을 위한 미리 정의된 가격 출처.";
L["price_source_changed"] = "가격 출처 변경됨: ";
L["price_source_poor"] = "|cff9d9d9d저급|r 품질의 아이템은 항상 VendorSell 출처로 평가됩니다.";
L["ldb_label_source"] = "LDB 라벨 출처";
L["ldb_label_source_desc"] = "LDB 호스트 프레임 내에서 애드온에 대해 표시되는 것을 제어합니다.";
L["ldb_label_source_changed"] = "LDB 라벨 출처 변경됨: ";
L["show_minimap_icon"] = "미니맵 아이콘 표시";
L["show_top_contributors"] = "상위 기여자 표시";
L["show_top_contributors_desc"] = "총 가치에 기여하는 상위 10개의 고유 아이템을 표시합니다.";
L["enable_guild_bank"] = "길드 은행 사용";
L["enable_guild_bank_desc"] = "길드 은행의 내용을 요약합니다. 길드에 없으면 이 설정은 영향이 없습니다.";
L["enable_guild_bank_footer"] = "길드 은행을 사용하면 '결합 총계'가 표시되는 곳에 해당 가치가 포함됩니다. 길드 은행 계산이 캐릭터 간에 공유되지 않습니다.";
L["ldb_money_format"] = "LDB 돈 형식";
L["ldb_money_format_desc"] = "LDB 디스플레이에서 표시되는 금액의 정밀도를 제어합니다.";
L["tooltip_money_format"] = "툴팁 돈 형식";
L["tooltip_money_format_desc"] = "툴팁에 표시되는 금액의 정밀도를 제어합니다.";
L["enable_quality_filter"] = "품질 필터 사용";
L["enable_quality_filter_desc"] = "활성화되면 선택한 품질 아래의 아이템을 무시합니다.";
L["enabled"] = "활성화됨";
L["disabled"] = "비활성화됨";
L["quality_filter_toggled"] = "품질 필터 %s";
L["quality_filter"] = "품질 필터";
L["quality_filter_desc"] = "선택한 품질 이하의 아이템은 계산에 포함되지 않습니다";
L["quality_filter_changed"] = "품질 필터 설정: %s 이상";
L["item_blocklist_enable"] = "아이템 차단 목록 사용";
L["item_blocklist_desc"] = "활성화되면 차단 목록에 추가된 모든 아이템을 무시합니다. 허용 목록과 상호 배타적입니다.";
L["item_blocklist_toggled"] = "아이템 차단 목록 %s";
L["item_blocklist_instructions"] =
"차단 목록에 추가하려면 아이템을 아래 버튼으로 드래그한 다음 클릭하세요. 차단 목록에 추가된 모든 아이템은 가방 가치 평가시 건너뜁니다. 영혼이 묶인 아이템은 자동으로 건너뜁니다. 차단 목록 내에서 아이템 체크를 해제하여 제거할 수 있습니다.";
L["drag_item_click"] = "아이템을 여기로 드래그하고 클릭하여 추가하세요.";
L["item_on_blocklist"] = "%s이(가) 이미 차단 목록에 있습니다.";
L["item_added_blocklist"] = "차단 목록에 %s 추가됨.";
L["item_blocklist_nothing_detected"] = "아무 것도 감지되지 않았으므로 차단 목록에 아무 것도 추가되지 않았습니다.";
L["blocked_items"] = "차단된 아이템";
L["blocked_items_desc"] = "평가에서 제외해야 할 아이템";
L["blocklist_removed_item"] = "차단 목록에서 %s 제거됨.";
L["item_allowlist_enable"] = "아이템 허용 목록 사용";
L["item_allowlist_desc"] = "활성화되면 허용 목록에 추가된 아이템만 계산됩니다. 차단 목록과 상호 배타적입니다.";
L["item_allowlist_toggled"] = "아이템 허용 목록 %s";
L["item_allowlist_instructions"] =
"허용 목록에 추가하려면 아이템을 아래 버튼으로 드래그한 다음 클릭하세요. 허용 목록에 추가된 아이템만 가방 가치 평가에 고려됩니다. 허용 목록에서 아이템 체크를 해제하면 제거할 수 있습니다.";
L["item_on_allowlist"] = "%s이(가) 이미 허용 목록에 있습니다.";
L["item_added_allowlist"] = "허용 목록에 %s 추가됨.";
L["item_allowlist_nothing_detected"] = "아무 것도 감지되지 않아 허용 목록에 아무 것도 추가되지 않았습니다.";
L["allowed_items"] = "허용된 아이템";
L["allowed_items_desc"] = "평가에 전용으로 고려해야 할 아이템";
L["allowlist_removed_item"] = "허용 목록에서 %s 제거됨.";
L["about"] = "소개";
L["about_bagappraiser"] =
"BagAppraiser은 선택한 가격 출처를 사용하여 가방과 은행의 내용을 평가하는 간단한 애드온입니다.\n\n이 애드온은 보장된 액체 금을 결정하지 않습니다. 대신, 옥션 하우스, 거래 채팅 등에서 판매해야 하는 전리품 아이템의 잠재적 '자산' 가치를 결정합니다.\n";
L["credits"] = "크레딧";
L["author"] = "clocklear (github.com/clocklear) 작성";
L["woweconomy_thanks"] = "/r/woweconomy에게 지원과 훌륭한 기능 아이디어에 대한 감사의 말씀을 드립니다.";
L["other_thanks"] =
"특별히 ProfitzTV와 Testerle에게 감사드립니다. 그들의 LootAppraiser 작업에서 크게 착안했습니다. 거인의 어깨 위에 서 있다고 느낍니다.";
L["need_help"] =
"도움이 필요하십니까? 기능 요청이 있으십니까? BagAppraiser 코드 저장소에 문제를 제기하거나 Reddit에서 PM을 보내주세요.";
L["issue_tracker"] = "문제 추적기:";
L["feedback"] = "피드백";
L["realm_price"] = "서버 가격";
L["region_price"] = "지역 가격";
L["disabled_instructions"] =
"BagAppraiser는 적합한 가격 출처를 찾을 수 없기 때문에 비활성 모드로 실행 중입니다. 다음 애드온 중 하나를 설치하여 이 문제를 해결할 수 있습니다:"
L["min_bid"] = "최소 입찰가";
L["min_buyout"] = "최소 즉시 구매가";
L["no_price_sources"] =
"|cffff0000주의!|r 가격 출처를 위한 추가 애드온이 없습니다. 애드온 구성 패널에서 자세한 내용을 확인하세요.\n\n|cffff0000BagAppraiser 비활성화.|r";
L["feature_localization"] =
"새로운 기능 -- BagAppraiser 이제 지역화 지원 기능! 다양한 모국어를 지원합니다."
L["feature_pricing_sources"] =
"새로운 기능 -- TSM 외에도 BagAppraiser는 이제 Auction House DataBase, Auctionator 및 Oribos Exchange를 대체 가격 소스로 지원합니다."
L["bags"] = "가방";
L["bag"] = "가방";
L["bank"] = "은행";
L["guild_bank"] = "길드 은행";
L["total"] = "합계";
L["based_on"] = "기준";
L["bank_last_updated"] = "은행 마지막 업데이트";
L["guild_bank_last_updated"] = "길드 은행 마지막 업데이트";
L["open_options"] = "|cFFFFFFCC왼쪽 클릭|r 옵션 창 열기";
L["top_contributors"] = "상위 %d 기여자";
L["text_display"] = "텍스트 디스플레이";
L["recent_value"] = "최근 시장 가치";
L["account_bank"] = "전투반 은행";
L["account_bank_last_updated"] = "전투반 은행 마지막 업데이트";
L["enable_account_bank"] = "전투반 은행 활성화";
L["enable_account_bank_desc"] = "전투반 은행의 내용을 요약합니다.";
L["enable_account_bank_footer"] = "전투반 은행을 활성화하면 '총 합계'가 표시되는 모든 곳에 해당 가치가 포함됩니다. 전투반 은행의 가치는 캐릭터 간에 공유되지만 계산은 그렇지 않습니다.";
L["feature_tww_support"] = "새로운 기능 -- BagAppraiser는 이제 The War Within을 지원하며 전투반 은행에 대한 초기 지원을 제공합니다! 문제가 있으면 신고해 주세요.";
L["feature_reagent_bag_only"] = "NEW - BagAppraiser가 이제 재료 가방 전용 모드를 지원합니다! 자세한 내용은 설정 창을 확인하세요."
L["bag_selection"] = "가방 선택"
L["bags_all"] = "모든 가방"
L["bags_reagent"] = "재료 가방만"
L["bag_selection_desc"] = "평가에 포함할 가방을 선택하세요. '모든 가방'이 아닌 다른 것으로 설정하면, 블리자드가 해당 슬롯을 약간 다르게 처리하므로 길드 은행이 제외됩니다."
L["bag_selection_changed"] = "가방 선택이 변경되었습니다: %s"