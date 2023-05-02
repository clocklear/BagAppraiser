local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "esMX")
if not L then return end

L["welcome_message"] = "%s cargado.  Escribe '/ba' para abrir la configuración.";
L["feature_filter"] =
"NUEVO -- ¡BagAppraiser ahora admite listas de permitidos y bloqueados!  Consulta la ventana de configuración para obtener más detalles.";
L["feature_allowlist"] =
"NUEVO -- ¡BagAppraiser ahora admite listas de permitidos!  Consulta la ventana de configuración para obtener más detalles.";
L["feature_classic"] = "NUEVO -- ¡BagAppraiser ahora admite Classic Era y Wrath!";
L["no_price_sources"] =
"|cffff0000¡Atención!|r Falta de addons adicionales para fuentes de precios (por ejemplo, como TradeSkillMaster o The Undermine Journal).\n\n|cffff0000BagAppraiser deshabilitado.|r";
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
L["min_buyout"] = "Compra mínima";
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
L["feedback"] = "Opiniones";
