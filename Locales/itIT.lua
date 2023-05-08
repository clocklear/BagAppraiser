local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "itIT")
if not L then return end

L["welcome_message"] = "%s caricato. Digita '/ba' per aprire la configurazione.";
L["feature_filter"] =
"NUOVO -- BagAppraiser supporta ora le liste di consentiti e bloccati! Controlla la finestra di configurazione per maggiori dettagli.";
L["feature_allowlist"] =
"NUOVO -- BagAppraiser supporta ora le liste di consentiti! Controlla la finestra di configurazione per maggiori dettagli.";
L["feature_classic"] = "NUOVO -- BagAppraiser supporta ora Classic Era e Wrath!";
L["addon_disabled"] = "|cffff0000BagAppraiser disabilitato.|r (vedi finestra popup per ulteriori dettagli)";
L["missing_price_source"] =
"|cffff0000Attenzione!|r La fonte del prezzo selezionata in BagAppraiser non è più valida (forse a causa di un modulo/componente aggiuntivo mancante). Si prega di selezionare un'altra fonte del prezzo nelle impostazioni di BagAppraiser o installare il modulo/componente aggiuntivo necessario per la fonte del prezzo selezionata.";
L["poor"] = "Scarso";
L["common"] = "Comune";
L["uncommon"] = "Non comune";
L["rare"] = "Raro";
L["epic"] = "Epico";
L["historical_price"] = "Prezzo storico";
L["market_value"] = "Valore di mercato";
L["region_historical_price"] = "Prezzo storico regionale";
L["region_market_value_avg"] = "Media del valore di mercato regionale";
L["region_min_buyout_avg"] = "Media dell'acquisto minimo regionale";
L["region_global_sale_average"] = "Media vendita globale regionale";
L["vendorsell"] = "Venditore";
L["globalMedian"] = "Mediana regionale";
L["globalMean"] = "Media regionale";
L["globalStdDev"] = "Deviazione standard regionale";
L["stddev"] = "Deviazione standard 14 giorni";
L["market"] = "Prezzo 14 giorni";
L["recent"] = "Prezzo 3 giorni";
L["bagtotal"] = "Totale borsa";
L["banktotal"] = "Totale banca";
L["combinedtotal"] = "Totale combinato";
L["precision_full"] = "Precisione completa";
L["precision_silver"] = "Argento più vicino";
L["precision_gold"] = "Oro più vicino";
L["price_source"] = "Fonte del prezzo";
L["price_source_desc"] = "Fonti predefinite del prezzo per il calcolo del valore degli oggetti.";
L["price_source_changed"] = "Fonte del prezzo cambiata in: ";
L["price_source_poor"] = "Gli oggetti di qualità |cff9d9d9dscarsa|r vengono sempre valutati con la fonte VendorSell.";
L["ldb_label_source"] = "Fonte etichetta LDB";
L["ldb_label_source_desc"] = "Controlla cosa viene visualizzato per l'addon all'interno dei frame ospiti LDB.";
L["ldb_label_source_changed"] = "Fonte etichetta LDB cambiata in: ";
L["show_minimap_icon"] = "Mostra icona sulla minimappa";
L["show_top_contributors"] = "Mostra i migliori contributori";
L["show_top_contributors_desc"] = "Visualizza i primi 10 oggetti unici che contribuiscono al valore totale.";
L["enable_guild_bank"] = "Abilita banca di gilda";
L["enable_guild_bank_desc"] =
"Riassumi il contenuto della banca di gilda. Questa impostazione non ha effetto se non fai parte di una gilda.";
L["enable_guild_bank_footer"] =
"L'abilitazione della banca di gilda includerà il suo valore ovunque viene visualizzato il 'Totale combinato'. I calcoli della banca di gilda non sono condivisi tra i personaggi.";
L["ldb_money_format"] = "Formato denaro LDB";
L["ldb_money_format_desc"] = "Controlla la precisione dell'importo mostrato nel display LDB.";
L["tooltip_money_format"] = "Formato denaro tooltip";
L["tooltip_money_format_desc"] = "Controlla la precisione degli importi mostrati nel tooltip.";
L["enable_quality_filter"] = "Abilita filtro qualità";
L["enable_quality_filter_desc"] = "Se abilitato, ignora gli oggetti al di sotto della qualità selezionata";
L["enabled"] = "abilitato";
L["disabled"] = "disabilitato";
L["quality_filter_toggled"] = "Filtro qualità %s";
L["quality_filter"] = "Filtro qualità";
L["quality_filter_desc"] = "Gli oggetti al di sotto della qualità selezionata non saranno considerati nei calcoli";
L["quality_filter_changed"] = "Filtro qualità impostato su: %s e superiore";
L["item_blocklist_enable"] = "Abilita lista blocchi oggetti";
L["item_blocklist_desc"] =
"Se abilitato, ignora qualsiasiarticolo aggiunto alla lista dei blocchi. Incompatibile con la lista dei consentiti.";
L["item_blocklist_toggled"] = "Lista blocchi oggetti %s";
L["item_blocklist_instructions"] =
"Per aggiungere alla lista dei blocchi, trascina un oggetto sul pulsante in basso e cliccalo. Qualsiasi oggetto aggiunto alla lista dei blocchi verrà ignorato quando si valuta il valore della borsa. Gli oggetti vincolati all'anima vengono automaticamente ignorati. Puoi rimuovere gli oggetti deselezionandoli all'interno della lista dei blocchi."
L["drag_item_click"] = "Trascina un oggetto qui e clicca per aggiungerlo.";
L["item_on_blocklist"] = "%s è già nella lista dei blocchi.";
L["item_added_blocklist"] = "Aggiunto %s alla lista dei blocchi.";
L["item_blocklist_nothing_detected"] = "Nessun oggetto rilevato, quindi niente aggiunto alla lista dei blocchi.";
L["blocked_items"] = "Oggetti bloccati";
L["blocked_items_desc"] = "Oggetti che devono essere esclusi dalla valutazione";
L["blocklist_removed_item"] = "Rimosso %s dalla lista dei blocchi."
L["item_allowlist_enable"] = "Abilita lista dei consentiti";
L["item_allowlist_desc"] =
"Se abilitato, verranno conteggiati solo gli oggetti aggiunti alla lista dei consentiti. Incompatibile con la lista dei blocchi.";
L["item_allowlist_toggled"] = "Lista dei consentiti %s";
L["item_allowlist_instructions"] =
"Per aggiungere alla lista dei consentiti, trascina un oggetto sul pulsante in basso e cliccalo. Solo gli oggetti aggiunti alla lista dei consentiti verranno considerati quando si valuta il valore della borsa. Puoi rimuovere gli oggetti deselezionandoli all'interno della lista dei consentiti."
L["item_on_allowlist"] = "%s è già nella lista dei consentiti.";
L["item_added_allowlist"] = "Aggiunto %s alla lista dei consentiti.";
L["item_allowlist_nothing_detected"] = "Nessun oggetto rilevato, quindi niente aggiunto alla lista dei consentiti.";
L["allowed_items"] = "Oggetti consentiti";
L["allowed_items_desc"] = "Oggetti che devono essere considerati esclusivamente per la valutazione";
L["allowlist_removed_item"] = "Rimosso %s dalla lista dei consentiti.";
L["about"] = "Informazioni";
L["about_bagappraiser"] =
"BagAppraiser è un semplice addon che valuta il contenuto delle tue borse e banca utilizzando la fonte del prezzo selezionata.\n\nSi prega di comprendere, questo addon NON determina l'oro liquido che sei garantito di fare, ma piuttosto, i valori potenziali 'attivi' (valore oggetti saccheggiati) degli oggetti saccheggiati dove dovrai fare il lavoro e venderli all'Asta, nella chat commerciale, ecc.\n";
L["credits"] = "Crediti";
L["author"] = "Scritto da clocklear (github.com/clocklear)";
L["woweconomy_thanks"] = "Grazie a /r/woweconomy per il supporto e le fantastiche idee per le funzionalità.";
L["other_thanks"] =
"Un ringraziamento speciale a ProfitzTV e Testerle per il loro lavoro su LootAppraiser; questo addon si basa in gran parte sul loro lavoro. Mi sto appoggiando sulle spalle dei giganti.";
L["need_help"] =
"Hai bisogno di aiuto? Hai una richiesta di funzionalità? Apri un problema nel repository di codice di BagAppraiser o inviami un messaggio privato su Reddit.";
L["issue_tracker"] = "Tracciatore di problemi:";
L["feedback"] = "Feedback";
L["tsm"] = "TradeSkillMaster";
L["oe"] = "Oribos Exchange";
L["ahdb"] = "Auction House Database";
L["atr"] = "Auctionator";
L["realm_price"] = "Prezzo reame";
L["region_price"] = "Prezzo regionale";
L["disabled_instructions"] =
"BagAppraiser è in esecuzione in modalità disabilitata perché non è stata trovata una fonte di prezzo adeguata. Puoi risolvere questo problema installando uno dei seguenti addon:";
L["min_bid"] = "Offerta minima";
L["min_buyout"] = "Acquisto minimo";
L["no_price_sources"] =
"|cffff0000Attenzione!|r Mancano componenti aggiuntivi per le fonti dei prezzi. Consulta il pannello di configurazione dell'addon per ulteriori dettagli.\n\n|cffff0000BagAppraiser disabilitato.|r";
L["feature_localization"] =
"NUOVO -- BagAppraiser supporta ora la localizzazione! Una vasta gamma di lingue native è ora disponibile."
L["feature_pricing_sources"] =
"NUOVO -- Oltre a TSM, BagAppraiser supporta ora Auction House DataBase, Auctionator e Oribos Exchange come fonti alternative di prezzi."
