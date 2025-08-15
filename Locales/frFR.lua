local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "frFR")
if not L then return end

L["welcome_message"] = "%s chargé. Tapez '/ba' pour ouvrir la configuration.";
L["feature_filter"] =
"NOUVEAU -- BagAppraiser prend désormais en charge les listes blanches et les listes noires! Consultez la fenêtre de configuration pour plus de détails.";
L["feature_allowlist"] =
"NOUVEAU -- BagAppraiser prend désormais en charge les listes blanches! Consultez la fenêtre de configuration pour plus de détails.";
L["feature_classic"] = "NOUVEAU -- BagAppraiser prend désormais en charge Classic Era et Wrath!";
L["addon_disabled"] = "|cffff0000BagAppraiser désactivé.|r (voir la fenêtre contextuelle pour plus de détails)";
L["missing_price_source"] =
"|cffff0000Attention!|r Votre source de prix sélectionnée dans BagAppraiser n'est pas ou n'est plus valide (peut-être en raison d'un module/addon manquant). Veuillez sélectionner une autre source de prix dans les paramètres de BagAppraiser ou installer le module/addon nécessaire pour la source de prix sélectionnée.";
L["poor"] = "Mauvais";
L["common"] = "Commun";
L["uncommon"] = "Inhabituel";
L["rare"] = "Rare";
L["epic"] = "Épique";
L["historical_price"] = "Prix historique";
L["market_value"] = "Valeur marchande";
L["region_historical_price"] = "Prix historique de la région";
L["region_market_value_avg"] = "Moyenne de la valeur marchande de la région";
L["region_min_buyout_avg"] = "Moyenne de l'achat minimum de la région";
L["region_global_sale_average"] = "Moyenne des ventes mondiales de la région";
L["vendorsell"] = "Vente au vendeur";
L["globalMedian"] = "Médiane régionale";
L["globalMean"] = "Moyenne régionale";
L["globalStdDev"] = "Déviation standard régionale";
L["stddev"] = "Écart-type sur 14 jours";
L["market"] = "Prix sur 14 jours";
L["recent"] = "Prix sur 3 jours";
L["bagtotal"] = "Total du sac";
L["banktotal"] = "Total de la banque";
L["combinedtotal"] = "Total combiné";
L["precision_full"] = "Précision complète";
L["precision_silver"] = "Argent le plus proche";
L["precision_gold"] = "Or le plus proche";
L["price_source"] = "Source de prix";
L["price_source_desc"] = "Sources de prix prédéfinies pour le calcul de la valeur des objets.";
L["price_source_changed"] = "Source de prix modifiée en : ";
L["price_source_poor"] = "Les objets de qualité |cff9d9d9dPauvre|r sont toujours évalués avec la source VendorSell.";
L["ldb_label_source"] = "Source de l'étiquette LDB";
L["ldb_label_source_desc"] = "Contrôle ce qui est affiché pour l'addon dans les cadres hôtes LDB.";
L["ldb_label_source_changed"] = "Source de l'étiquette LDB modifiée en : ";
L["show_minimap_icon"] = "Afficher l'icône de la minimap";
L["show_top_contributors"] = "Afficher les meilleurs contributeurs";
L["show_top_contributors_desc"] = "Affiche les 10 objets uniques les plus contributifs à la valeur totale.";
L["enable_guild_bank"] = "Activer la banque de guilde";
L["enable_guild_bank_desc"] =
"Résumer le contenu de la banque de guilde. Ce paramètre n'a aucun effet si vous n'êtes pas dans une guilde.";
L["enable_guild_bank_footer"] =
"Activer la banque de guilde inclura sa valeur partout où le 'Total Combiné' est affiché. Les calculs de la banque de guilde ne sont pas partagés entre les personnages.";
L["ldb_money_format"] = "Format d'argent LDB";
L["ldb_money_format_desc"] = "Contrôle la précision du montant affiché dans l'affichage LDB.";
L["tooltip_money_format"] = "Format d'argent de l'infobulle";
L["tooltip_money_format_desc"] = "Contrôle la précision des montants affichés dans l'infobulle.";
L["enable_quality_filter"] = "Activer le filtre de qualité";
L["enable_quality_filter_desc"] = "Si activé, ignore les objets en dessous de la qualité sélectionnée";
L["enabled"] = "activé";
L["disabled"] = "désactivé";
L["quality_filter_toggled"] = "Filtre de qualité %s";
L["quality_filter"] = "Filtre de qualité";
L["quality_filter_desc"] =
"Les objets en dessous de la qualité sélectionnée ne seront pas pris en compte dans les calculs";
L["quality_filter_changed"] = "Filtre de qualité défini pour : %s et plus";
L["item_blocklist_enable"] = "Activer la liste de blocage des objets";
L["item_blocklist_desc"] =
"Si activé, ignore tout objet ajouté à la liste de blocage. Mutuellement exclusif avec la liste d'autorisation.";
L["item_blocklist_toggled"] = "Liste de blocage des objets %s";
L["item_blocklist_instructions"] =
"Pour ajouter à la liste de blocage, faites glisser un objet sur le bouton ci-dessous et cliquez dessus. Tout objet ajouté à la liste de blocage sera ignoré lors de l'évaluation de la valeur du sac. Les objets liés à l'âme sont automatiquement ignorés. Vous pouvez supprimer des éléments en les décochant dans la liste de blocage.";
L["drag_item_click"] = "Faites glisser un objet ici et cliquez pour l'ajouter.";
L["item_on_blocklist"] = "%s est déjà sur la liste de blocage.";
L["item_added_blocklist"] = "Ajout de %s à la liste de blocage.";
L["item_blocklist_nothing_detected"] = "Aucun objet détecté, donc rien ajouté à la liste de blocage.";
L["blocked_items"] = "Objets bloqués";
L["blocked_items_desc"] = "Objets à exclure de l'évaluation";
L["blocklist_removed_item"] = "Suppression de %s de la liste de blocage.";
L["item_allowlist_enable"] = "Activer la liste d'autorisation des objets";
L["item_allowlist_desc"] =
"Si activé, seuls les objets ajoutés à la liste d'autorisation seront comptés. Mutuellement exclusif avec la liste de blocage.";
L["item_allowlist_toggled"] = "Liste d'autorisation des objets %s";
L["item_allowlist_instructions"] =
"Pour ajouter à la liste d'autorisation, faites glisser un objet sur le bouton ci-dessous et cliquez dessus. Seuls les objets ajoutés à la liste d'autorisation seront pris en compte lors de l'évaluation de la valeur du sac. Vous pouvez supprimer des éléments en les décochant dans la liste d'autorisation.";
L["item_on_allowlist"] = "%s est déjà sur la liste d'autorisation.";
L["item_added_allowlist"] = "Ajout de %s à la liste d'autorisation.";
L["item_allowlist_nothing_detected"] = "Aucun objet détecté, donc rien ajouté à la liste d'autorisation.";
L["allowed_items"] = "Objets autorisés";
L["allowed_items_desc"] = "Objets à considérer exclusivement pour l'évaluation";
L["allowlist_removed_item"] = "Suppression de %s de la liste d'autorisation.";
L["about"] = "A propos";
L["about_bagappraiser"] =
"BagAppraiser est un addon simple qui évalue le contenu de vos sacs et de votre banque en utilisant la source de prix sélectionnée.\n\nVeuillez comprendre que cet addon ne détermine PAS l'or liquide que vous êtes assuré de gagner, mais plutôt les valeurs potentielles d' 'actifs' (valeur des objets pillés) des objets pillés où vous devrez faire le travail et les vendre à l'Hôtel des ventes, dans le chat commercial, etc.\n";
L["credits"] = "Crédits";
L["author"] = "Écrit par clocklear (github.com/clocklear)";
L["woweconomy_thanks"] = "Merci à /r/woweconomy pour le soutien et les excellentes idées de fonctionnalités.";
L["other_thanks"] = "Un remerciement spécial à ProfitzTV et Testerle pour leur travail sur LootAppraiser ; cet addon s’appuie fortement sur leur travail. Je me tiens sur les épaules de géants.\n\nMerci également à lordtyrion2005 pour avoir fourni une mise à jour pour WoW 11.1.x durant mon absence."
L["need_help"] =
"Besoin d'aide ? Vous avez une demande de fonctionnalité ? Ouvrez un problème sur le dépôt de code pour BagAppraiser ou envoyez-moi un MP sur Reddit.";
L["issue_tracker"] = "Suivi des problèmes:";
L["feedback"] = "Retour d'information";
L["realm_price"] = "Prix du Royaume";
L["region_price"] = "Prix de la Région";
L["disabled_instructions"] =
"BagAppraiser fonctionne en mode désactivé car aucune source de prix appropriée ne peut être trouvée. Vous pouvez résoudre ce problème en installant l'un des addons suivants:"
L["min_bid"] = "Enchère minimale";
L["min_buyout"] = "Achat immédiat minimum";
L["no_price_sources"] =
"|cffff0000Attention !|r Addons supplémentaires manquants pour les sources de prix. Consultez le panneau de configuration de l'addon pour plus de détails.\n\n|cffff0000BagAppraiser désactivé.|r";
L["feature_localization"] =
"NOUVEAU -- BagAppraiser prend désormais en charge la localisation ! Un large éventail de langues natives est désormais pris en compte."
L["feature_pricing_sources"] =
"NOUVEAU -- En plus de TSM, BagAppraiser prend désormais en charge Auction House DataBase, Auctionator et Oribos Exchange en tant que sources de prix alternatives."
L["bags"] = "Sacs";
L["bag"] = "Sac";
L["bank"] = "Banque";
L["guild_bank"] = "Banque de guilde";
L["total"] = "Total";
L["based_on"] = "Basé sur";
L["bank_last_updated"] = "Banque dernière mise à jour";
L["guild_bank_last_updated"] = "Banque de guilde dernière mise à jour";
L["open_options"] = "|cFFFFFFCCClic gauche|r pour ouvrir la fenêtre d'options";
L["top_contributors"] = "Top %d contributeurs";
L["text_display"] = "Affichage texte";
L["recent_value"] = "Valeur marchande récente";
L["account_bank"] = "Banque de la bande de guerre";
L["account_bank_last_updated"] = "Dernière mise à jour de la banque de la bande de guerre";
L["enable_account_bank"] = "Activer la banque de la bande de guerre";
L["enable_account_bank_desc"] = "Résumer le contenu de la banque de la bande de guerre.";
L["enable_account_bank_footer"] = "L'activation de la banque de la bande de guerre inclura sa valeur partout où le 'Total combiné' est affiché. Bien que la valeur de la banque de la bande de guerre soit partagée entre les personnages, le calcul ne l'est pas.";
L["feature_tww_support"] = "NOUVEAU -- BagAppraiser prend désormais en charge The War Within et offre un support initial pour la Banque de la bande de guerre ! Veuillez signaler tout problème que vous rencontrez.";
L["feature_reagent_bag_only"] = "NOUVEAU - BagAppraiser prend désormais en charge un mode sac à composants uniquement ! Consultez la fenêtre de configuration pour plus de détails."
L["bag_selection"] = "Sélection de Sacs"
L["bags_all"] = "Tous les Sacs"
L["bags_reagent"] = "Sacs à Composants Uniquement"
L["bag_selection_desc"] = "Sélectionnez les sacs à inclure dans l'évaluation. Si vous choisissez une option autre que 'Tous les Sacs', la banque de guilde sera exclue car Blizzard traite ces emplacements légèrement différemment."
L["bag_selection_changed"] = "Sélection de sacs changée en : %s"