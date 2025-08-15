local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "deDE")
if not L then return end

L["welcome_message"] = "%s geladen.  Geben Sie '/ba' ein, um die Konfiguration zu öffnen.";
L["feature_filter"] =
"NEU -- BagAppraiser unterstützt jetzt Allowlisten und Blocklisten!  Weitere Informationen finden Sie im Konfigurationsfenster.";
L["feature_allowlist"] =
"NEU -- BagAppraiser unterstützt jetzt Allowlisten!  Weitere Informationen finden Sie im Konfigurationsfenster.";
L["feature_classic"] = "NEU -- BagAppraiser unterstützt jetzt Classic Era und Wrath!";
L["addon_disabled"] = "|cffff0000BagAppraiser deaktiviert.|r (siehe Popup-Fenster für weitere Details)";
L["missing_price_source"] =
"|cffff0000Achtung!|r Ihre ausgewählte Preisquelle in BagAppraiser ist nicht oder nicht mehr gültig (vielleicht aufgrund eines fehlenden Moduls/Addons). Bitte wählen Sie eine andere Preisquelle in den BagAppraiser-Einstellungen oder installieren Sie das benötigte Modul/Addon für die ausgewählte Preisquelle.";
L["poor"] = "Schlecht";
L["common"] = "Gewöhnlich";
L["uncommon"] = "Ungewöhnlich";
L["rare"] = "Selten";
L["epic"] = "Episch";
L["historical_price"] = "Historischer Preis";
L["market_value"] = "Marktwert";
L["region_historical_price"] = "Region Historischer Preis";
L["region_market_value_avg"] = "Region Marktwert Durchschnitt";
L["region_min_buyout_avg"] = "Region Mindestgebot Durchschnitt";
L["region_global_sale_average"] = "Region Globaler Verkauf Durchschnitt";
L["vendorsell"] = "HändlerVerkauf";
L["globalMedian"] = "Regionales Median";
L["globalMean"] = "Regionales Mittel";
L["globalStdDev"] = "Regionale Std Dev";
L["stddev"] = "14-Tage-Std Dev";
L["market"] = "14-Tage-Preis";
L["recent"] = "3-Tage-Preis";
L["bagtotal"] = "Taschen Gesamt";
L["banktotal"] = "Bank Gesamt";
L["combinedtotal"] = "Kombiniertes Gesamt";
L["precision_full"] = "Volle Präzision";
L["precision_silver"] = "Nächster Silber";
L["precision_gold"] = "Nächstes Gold";
L["price_source"] = "Preisquelle";
L["price_source_desc"] = "Vordefinierte Preisquellen für die Berechnung des Gegenstandswerts.";
L["price_source_changed"] = "Preisquelle geändert auf: ";
L["price_source_poor"] = "|cff9d9d9dSchlechte|r Qualität Gegenstände werden immer mit der VendorSell-Quelle bewertet.";
L["ldb_label_source"] = "LDB Etikettenquelle";
L["ldb_label_source_desc"] = "Steuert, was für das Addon in LDB-Host-Frames angezeigt wird.";
L["ldb_label_source_changed"] = "LDB-Etikettenquelle geändert auf: ";
L["show_minimap_icon"] = "Minikartensymbol anzeigen";
L["show_top_contributors"] = "Top-Beiträger anzeigen";
L["show_top_contributors_desc"] = "Zeigt die 10 einzigartigen Gegenstände mit dem höchsten Beitrag zum Gesamtwert an.";
L["enable_guild_bank"] = "Gildenbank aktivieren";
L["enable_guild_bank_desc"] =
"Zusammenfassen des Inhalts der Gildenbank. Diese Einstellung hat keine Auswirkung, wenn Sie nicht in einer Gilde sind.";
L["enable_guild_bank_footer"] =
"Die Aktivierung der Gildenbank beinhaltet ihren Wert überall dort, wo der 'Gesamtwert' angezeigt wird. Gildenbankberechnungen werden nicht unter den Charakteren geteilt.";
L["ldb_money_format"] = "LDB Geldformat";
L["ldb_money_format_desc"] = "Steuert die Genauigkeit des Betrags, der in der LDB-Anzeige angezeigt wird.";
L["tooltip_money_format"] = "Tooltip Geldformat";
L["tooltip_money_format_desc"] = "Steuert die Genauigkeit der Beträge, die im Tooltip angezeigt werden.";
L["enable_quality_filter"] = "Qualitätsfilter aktivieren";
L["enable_quality_filter_desc"] = "Wenn aktiviert, ignoriert Gegenstände unterhalb der ausgewählten Qualität";
L["enabled"] = "aktiviert";
L["disabled"] = "deaktiviert";
L["quality_filter_toggled"] = "Qualitätsfilter %s";
L["quality_filter"] = "Qualitätsfilter";
L["quality_filter_desc"] = "Gegenstände unterhalb der ausgewählten Qualität werden nicht in die Berechnungen einbezogen";
L["quality_filter_changed"] = "Qualitätsfilter eingestellt auf: %s und höher";
L["item_blocklist_enable"] = "Gegenstandsblockliste aktivieren";
L["item_blocklist_desc"] =
"Wenn aktiviert, ignoriert alle Gegenstände, die zur Blockliste hinzugefügt wurden. Gegenseitig ausschließlich mit der Liste zulässiger Artikel.";
L["item_blocklist_toggled"] = "Gegenstandsblockliste %s";
L["item_blocklist_instructions"] =
"Um der Blockliste hinzuzufügen, ziehen Sie einen Gegenstand auf den Button unten und klicken Sie darauf. Jeder Gegenstand, der zur Blockliste hinzugefügt wird, wird bei der Bewertung des Taschenwerts übersprungen. Seelengebundene Gegenstände werden automatisch übersprungen. Sie können Gegenstände entfernen, indem Sie sie in der Blockliste deaktivieren."
L["drag_item_click"] = "Ziehen Sie einen Gegenstand hierher und klicken Sie darauf, um ihn hinzuzufügen.";
L["item_on_blocklist"] = "%s ist bereits auf der Blockliste.";
L["item_added_blocklist"] = "%s zur Blockliste hinzugefügt.";
L["item_blocklist_nothing_detected"] = "Kein Gegenstand erkannt, daher wurde nichts zur Blockliste hinzugefügt.";
L["blocked_items"] = "Blockierte Gegenstände";
L["blocked_items_desc"] = "Gegenstände, die von der Bewertung ausgeschlossen werden sollen";
L["blocklist_removed_item"] = "Entfernt %s von der Blockliste."
L["item_allowlist_enable"] = "Gegenstands-Whitelist aktivieren";
L["item_allowlist_desc"] =
"Wenn aktiviert, werden nur Gegenstände gezählt, die zur Liste der zulässigen Gegenstände hinzugefügt wurden. Gegenseitig ausschließlich mit der Blockliste.";
L["item_allowlist_toggled"] = "Gegenstands-Whitelist %s";
L["item_allowlist_instructions"] =
"Um der Liste der zulässigen Gegenstände hinzuzufügen, ziehen Sie einen Gegenstand auf den Button unten und klicken Sie darauf. Nur Gegenstände, die zur Liste der zulässigen Gegenstände hinzugefügt wurden, werden bei der Bewertung des Taschenwerts berücksichtigt. Sie können Gegenstände entfernen, indem Sie sie in der Liste der zulässigen Gegenstände deaktivieren."
L["item_on_allowlist"] = "%s ist bereits auf der Liste der zulässigen Gegenstände.";
L["item_added_allowlist"] = "%s zur Liste der zulässigen Gegenstände hinzugefügt.";
L["item_allowlist_nothing_detected"] =
"Kein Gegenstand erkannt, daher wurde nichts zur Liste der zulässigen Gegenstände hinzugefügt.";
L["allowed_items"] = "Zulässige Gegenstände";
L["allowed_items_desc"] = "Gegenstände, die ausschließlich für die Bewertung berücksichtigt werden sollen";
L["allowlist_removed_item"] = "%s von der Liste der zulässigen Gegenstände entfernt.";
L["about"] = "Über";
L["about_bagappraiser"] =
"BagAppraiser ist ein einfaches Addon, das den Inhalt Ihrer Taschen und Bank mit der ausgewählten Preisquelle bewertet.\n\nBitte beachten Sie, dass dieses Addon NICHT den garantierten flüssigen Goldbetrag bestimmt, sondern mögliche 'Vermögenswerte' (geplünderte Gegenstandswerte), bei denen Sie die Arbeit erledigen und sie im Auktionshaus, Handelschat, etc. verkaufen müssen.\n";
L["credits"] = "Credits";
L["author"] = "Geschrieben von clocklear (github.com/clocklear)";
L["woweconomy_thanks"] = "Danke an /r/woweconomy für die Unterstützung und die großartigen Feature-Ideen.";
L["other_thanks"] = "Ein besonderer Dank geht an ProfitzTV und Testerle für ihre Arbeit an LootAppraiser; dieses Addon nutzt stark ihre Arbeit. Ich stehe auf den Schultern von Riesen.\n\nDanke auch an lordtyrion2005 für ein Update für WoW 11.1.x während meiner Abwesenheit."
L["need_help"] =
"Brauchen Sie Hilfe? Haben Sie einen Feature-Wunsch? Eröffnen Sie ein Problem im Code-Repository für BagAppraiser oder senden Sie mir eine PM auf Reddit.";
L["issue_tracker"] = "Issue Tracker:";
L["feedback"] = "Rückmeldung";
L["realm_price"] = "Realm Preis";
L["region_price"] = "Region Preis";
L["disabled_instructions"] =
"BagAppraiser läuft im deaktivierten Modus, da keine geeignete Preisquelle gefunden werden kann. Sie können dies beheben, indem Sie eine der folgenden Addons installieren:"
L["min_bid"] = "Mindestgebot";
L["min_buyout"] = "Mindestkaufpreis";
L["no_price_sources"] =
"|cffff0000Achtung!|r Fehlende zusätzliche Addons für Preisquellen. Weitere Informationen finden Sie im Addon-Konfigurationsbereich.\n\n|cffff0000BagAppraiser deaktiviert.|r";
L["feature_localization"] =
"NEU -- BagAppraiser unterstützt jetzt Lokalisierung! Eine breite Palette von Muttersprachen wird nun berücksichtigt."
L["feature_pricing_sources"] =
"NEU -- Zusätzlich zu TSM unterstützt BagAppraiser jetzt Auction House DataBase, Auctionator und Oribos Exchange als alternative Preisquellen."
L["bags"] = "Taschen";
L["bag"] = "Tasche";
L["bank"] = "Bank";
L["guild_bank"] = "Gildenbank";
L["total"] = "Gesamt";
L["based_on"] = "Basiert auf";
L["bank_last_updated"] = "Bank zuletzt aktualisiert";
L["guild_bank_last_updated"] = "Gildenbank zuletzt aktualisiert";
L["open_options"] = "|cFFFFFFCCLinksklick|r, um das Optionsfenster zu öffnen";
L["top_contributors"] = "Top %d Mitwirkende";
L["text_display"] = "Textanzeige";
L["recent_value"] = "Aktueller Marktwert";
L["account_bank"] = "Kriegstrupp-Bank";
L["account_bank_last_updated"] = "Kriegstrupp-Bank zuletzt aktualisiert";
L["enable_account_bank"] = "Kriegstrupp-Bank aktivieren";
L["enable_account_bank_desc"] = "Inhalte der Kriegstrupp-Bank zusammenfassen.";
L["enable_account_bank_footer"] = "Das Aktivieren der Kriegstrupp-Bank wird deren Wert überall dort einbeziehen, wo der 'Gesamttotal' angezeigt wird. Obwohl der Wert der Kriegstrupp-Bank unter den Charakteren geteilt wird, erfolgt die Berechnung nicht.";
L["feature_tww_support"] = "NEU -- BagAppraiser unterstützt jetzt The War Within und hat erste Unterstützung für die Kriegstrupp-Bank! Bitte melden Sie alle Probleme, die Sie feststellen.";
L["feature_reagent_bag_only"] = "NEU - BagAppraiser unterstützt jetzt einen Modus nur für Reagenzienbeutel! Weitere Details findest du im Konfigurationsfenster."
L["bag_selection"] = "Taschenauswahl"
L["bags_all"] = "Alle Taschen"
L["bags_reagent"] = "Nur Reagenzienbeutel"
L["bag_selection_desc"] = "Wähle, welche Taschen in die Bewertung einbezogen werden sollen. Wenn eine andere Option als 'Alle Taschen' ausgewählt ist, wird die Gildenbank ausgeschlossen, da Blizzard diese Slots etwas anders behandelt."
L["bag_selection_changed"] = "Taschenauswahl geändert zu: %s"