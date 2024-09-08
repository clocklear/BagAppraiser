local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "esES")
if not L then return end

L["welcome_message"] = "%s cargado.  Escribe '/ba' para abrir la configuración.";
L["feature_filter"] =
"NUEVO -- ¡BagAppraiser ahora admite listas de permitidos y bloqueados!  Consulta la ventana de configuración para obtener más detalles.";
L["feature_allowlist"] =
"NUEVO -- ¡BagAppraiser ahora admite listas de permitidos!  Consulta la ventana de configuración para obtener más detalles.";
L["feature_classic"] = "NUEVO -- ¡BagAppraiser ahora admite Classic Era y Wrath!";
L["addon_disabled"] = "|cffff0000BagAppraiser deshabilitado.|r (consulte la ventana emergente para obtener más detalles)";
L["missing_price_source"] =
"|cffff0000¡Atención!|r La fuente de precios seleccionada en BagAppraiser no es válida o ya no lo es (quizás debido a un módulo/addon faltante). Por favor, seleccione otra fuente de precios en la configuración de BagAppraiser o instale el módulo/addon necesario para la fuente de precios seleccionada.";
L["poor"] = "Pobre";
L["common"] = "Común";
L["uncommon"] = "Poco común";
L["rare"] = "Raro";
L["epic"] = "Épico";
L["historical_price"] = "Precio histórico";
L["market_value"] = "Valor de mercado";
L["region_historical_price"] = "Precio histórico de la región";
L["region_market_value_avg"] = "Promedio del valor de mercado de la región";
L["region_min_buyout_avg"] = "Promedio de compra mínima de la región";
L["region_global_sale_average"] = "Promedio de venta global de la región";
L["vendorsell"] = "Venta al vendedor";
L["globalMedian"] = "Mediana regional";
L["globalMean"] = "Media regional";
L["globalStdDev"] = "Desviación estándar regional";
L["stddev"] = "Desviación estándar de 14 días";
L["market"] = "Precio de 14 días";
L["recent"] = "Precio de 3 días";
L["bagtotal"] = "Total de la bolsa";
L["banktotal"] = "Total del banco";
L["combinedtotal"] = "Total combinado";
L["precision_full"] = "Precisión completa";
L["precision_silver"] = "Plata más cercana";
L["precision_gold"] = "Oro más cercano";
L["price_source"] = "Fuente de precios";
L["price_source_desc"] = "Fuentes de precios predefinidas para el cálculo del valor del objeto.";
L["price_source_changed"] = "Fuente de precios cambiada a: ";
L["price_source_poor"] = "|cff9d9d9dMala|r calidad de objetos siempre se valoran con la fuente VendorSell.";
L["ldb_label_source"] = "Fuente de etiqueta LDB";
L["ldb_label_source_desc"] = "Controla lo que se muestra para el addon dentro de los marcos del anfitrión LDB.";
L["ldb_label_source_changed"] = "Fuente de etiqueta LDB cambiada a: ";
L["show_minimap_icon"] = "Mostrar icono en el minimapa";
L["show_top_contributors"] = "Mostrar los principales contribuyentes";
L["show_top_contributors_desc"] = "Muestra los 10 objetos únicos con mayor contribución al valor total.";
L["enable_guild_bank"] = "Habilitar banco de hermandad";
L["enable_guild_bank_desc"] =
"Resumir el contenido del banco de la hermandad. Esta configuración no tiene efecto si no estás en una hermandad.";
L["enable_guild_bank_footer"] =
"La habilitación del banco de la hermandad incluirá su valor en cualquier lugar donde se muestre el 'Total combinado'. Los cálculos del banco de la hermandad no se comparten entre personajes.";
L["ldb_money_format"] = "Formato de dinero LDB";
L["ldb_money_format_desc"] = "Controla la precisión de la cantidad mostrada en la pantalla LDB.";
L["tooltip_money_format"] = "Formato de dinero del tooltip";
L["tooltip_money_format_desc"] = "Controla la precisión de las cantidades mostradas en el tooltip.";
L["enable_quality_filter"] = "Habilitar filtro de calidad";
L["enable_quality_filter_desc"] = "Si está habilitado, ignora objetos por debajo de la calidad seleccionada";
L["enabled"] = "habilitado";
L["disabled"] = "deshabilitado";
L["quality_filter_toggled"] = "Filtro de calidad %s";
L["quality_filter"] = "Filtro de calidad";
L["quality_filter_desc"] = "Los objetos por debajo de la calidad seleccionada no se tendrán en cuenta en los cálculos";
L["quality_filter_changed"] = "Filtro de calidad establecido en: %s y superior";
L["item_blocklist_enable"] = "Habilitar lista de bloqueo de objetos";
L["item_blocklist_desc"] =
"Si está habilitado, ignora cualquier objeto añadido a la lista de bloqueo. Mutuamente exclusivo con la lista de permitidos.";
L["item_blocklist_toggled"] = "Lista de bloqueo de objetos %s";
L["item_blocklist_instructions"] =
"Para agregar a la lista de bloqueo, arrastre un objeto al botón de abajo y haga clic en él. Cualquier objeto agregado a la lista de bloqueo se omitirá al evaluar el valor de la bolsa. Los objetos ligados al alma se omiten automáticamente. Puede eliminar objetos desmarcándolos dentro de la lista de bloqueo."
L["drag_item_click"] = "Arrastra un objeto aquí y haz clic para agregarlo.";
L["item_on_blocklist"] = "%s ya está en la lista de bloqueo.";
L["item_added_blocklist"] = "Agregado %s a la lista de bloqueo.";
L["item_blocklist_nothing_detected"] = "No se detectó ningún objeto, por lo que no se agregó nada a la lista de bloqueo.";
L["blocked_items"] = "Objetos bloqueados";
L["blocked_items_desc"] = "Objetos que deben ser excluidos de la valoración";
L["blocklist_removed_item"] = "Eliminado %s de la lista de bloqueo."
L["item_allowlist_enable"] = "Habilitar lista de permitidos de objetos";
L["item_allowlist_desc"] =
"Si está habilitado, solo se contarán los objetos añadidos a la lista de permitidos. Mutuamente exclusivo con la lista de bloqueo.";
L["item_allowlist_toggled"] = "Lista de permitidos de objetos %s";
L["item_allowlist_instructions"] =
"Para agregar a la lista de permitidos, arrastre un objeto al botón de abajo y haga clic en él. Solo los objetos añadidos a la lista de permitidos se considerarán al evaluar el valor de la bolsa. Puede eliminar objetos desmarcándolos dentro de la lista de permitidos."
L["item_on_allowlist"] = "%s ya está en la lista de permitidos.";
L["item_added_allowlist"] = "Agregado %s a la lista de permitidos.";
L["item_allowlist_nothing_detected"] =
"No se detectó ningún objeto, por lo que no se agregó nada a la lista de permitidos.";
L["allowed_items"] = "Objetos permitidos";
L["allowed_items_desc"] = "Objetos que deben ser considerados exclusivamente para la valoración";
L["allowlist_removed_item"] = "Eliminado %s de la lista de permitidos.";
L["about"] = "Acerca de";
L["about_bagappraiser"] =
"BagAppraiser es un complemento simple que valora el contenido de tus bolsas y banco utilizando la fuente de precios seleccionada.\n\nPor favor, comprenda que este complemento NO determina el oro líquido que está garantizado para ganar, sino más bien, los valores potenciales de 'activos' (valor de objetos saqueados) de los objetos saqueados en los que deberá hacer el trabajo y venderlos en la Casa de subastas, chat comercial, etc.\n";
L["credits"] = "Créditos";
L["author"] = "Escrito por clocklear (github.com/clocklear)";
L["woweconomy_thanks"] = "Gracias a /r/woweconomy por el apoyo y las excelentes ideas para funciones.";
L["other_thanks"] =
"Agradecimiento especial a ProfitzTV y Testerle por su trabajo en LootAppraiser; este complemento se basa en gran medida en su trabajo. Estoy de pie sobre los hombros de gigantes.";
L["need_help"] =
"¿Necesitas ayuda? ¿Tienes una solicitud de función? Abre un problema en el repositorio de código para BagAppraiser o envíame un mensaje privado en Reddit.";
L["issue_tracker"] = "Seguimiento de problemas:";
L["feedback"] = "Comentarios";
L["realm_price"] = "Precio del Reino";
L["region_price"] = "Precio de la Región";
L["disabled_instructions"] =
"BagAppraiser está funcionando en modo deshabilitado porque no se puede encontrar una fuente de precios adecuada. Puede solucionar esto instalando uno de los siguientes addons:"
L["min_bid"] = "Puja mínima";
L["min_buyout"] = "Compra mínima";
L["no_price_sources"] =
"|cffff0000¡Atención!|r Faltan addons adicionales para fuentes de precios. Consulta el panel de configuración del addon para más detalles.\n\n|cffff0000BagAppraiser deshabilitado.|r";
L["feature_localization"] =
"¡NUEVO -- BagAppraiser ahora incluye soporte de localización! Se admiten una amplia gama de idiomas nativos."
L["feature_pricing_sources"] =
"¡NUEVO -- Además de TSM, BagAppraiser ahora admite Auction House DataBase, Auctionator y Oribos Exchange como fuentes de precios alternativas."
L["bags"] = "Bolsas";
L["bag"] = "Bolsa";
L["bank"] = "Banco";
L["guild_bank"] = "Banco de hermandad";
L["total"] = "Total";
L["based_on"] = "Basado en";
L["bank_last_updated"] = "Banco última actualización";
L["guild_bank_last_updated"] = "Banco de hermandad última actualización";
L["open_options"] = "|cFFFFFFCCClick izquierdo|r para abrir la ventana de opciones";
L["top_contributors"] = "Top %d Contribuyentes";
L["text_display"] = "Visualización de texto";
L["recent_value"] = "Valor de mercado reciente";
L["account_bank"] = "Banco de la Banda de Guerra";
L["account_bank_last_updated"] = "Banco de la Banda de Guerra actualizado por última vez";
L["enable_account_bank"] = "Habilitar banco de la Banda de Guerra";
L["enable_account_bank_desc"] = "Resumir el contenido del banco de la Banda de Guerra.";
L["enable_account_bank_footer"] = "Habilitar el banco de la Banda de Guerra incluirá su valor en cualquier lugar donde se muestre el 'Total combinado'. Aunque el valor del banco de la Banda de Guerra se comparta entre los personajes, el cálculo no lo es.";
L["feature_tww_support"] = "NUEVO -- ¡BagAppraiser ahora es compatible con The War Within y tiene soporte inicial para el Banco de la Banda de Guerra! Por favor, reporte cualquier problema que encuentre.";
L["feature_reagent_bag_only"] = "NUEVO - ¡BagAppraiser ahora admite un modo solo para bolsas de componentes! Consulta la ventana de configuración para más detalles."
L["bag_selection"] = "Selección de Bolsas"
L["bags_all"] = "Todas las Bolsas"
L["bags_reagent"] = "Solo Bolsas de Componentes"
L["bag_selection_desc"] = "Selecciona qué bolsas incluir en la valoración. Si se configura en algo distinto a 'Todas las Bolsas', se excluirá el banco de hermandad, ya que Blizzard trata esos espacios de manera diferente."
L["bag_selection_changed"] = "Selección de bolsas cambiada a: %s"