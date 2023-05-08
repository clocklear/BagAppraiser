local L = LibStub("AceLocale-3.0"):NewLocale("BagAppraiser", "ptBR")
if not L then return end

L["welcome_message"] = "%s carregado.  Digite '/ba' para abrir a configuração.";
L["feature_filter"] =
"NOVO -- BagAppraiser agora suporta listas de permissão e listas de bloqueio!  Verifique a janela de configuração para obter mais detalhes.";
L["feature_allowlist"] =
"NOVO -- BagAppraiser agora suporta listas de permissão!  Verifique a janela de configuração para obter mais detalhes.";
L["feature_classic"] = "NOVO -- BagAppraiser agora suporta Classic Era e Wrath!";
L["addon_disabled"] = "|cffff0000BagAppraiser desativado.|r (veja a janela pop-up para obter mais detalhes)";
L["missing_price_source"] =
"|cffff0000Atenção!|r A fonte de preços selecionada no BagAppraiser não é válida ou não é mais válida (talvez devido a um módulo/addon ausente). Selecione outra fonte de preços nas configurações do BagAppraiser ou instale o módulo/addon necessário para a fonte de preços selecionada.";
L["poor"] = "Pobre";
L["common"] = "Comum";
L["uncommon"] = "Incomum";
L["rare"] = "Raro";
L["epic"] = "Épico";
L["historical_price"] = "Preço histórico";
L["market_value"] = "Valor de mercado";
L["region_historical_price"] = "Preço histórico da região";
L["region_market_value_avg"] = "Média do valor de mercado da região";
L["region_min_buyout_avg"] = "Média de compra mínima da região";
L["region_global_sale_average"] = "Média de venda global da região";
L["vendorsell"] = "Venda ao vendedor";
L["globalMedian"] = "Mediana regional";
L["globalMean"] = "Média regional";
L["globalStdDev"] = "Desvio padrão regional";
L["stddev"] = "Desvio padrão de 14 dias";
L["market"] = "Preço de 14 dias";
L["recent"] = "Preço de 3 dias";
L["bagtotal"] = "Total da mochila";
L["banktotal"] = "Total do banco";
L["combinedtotal"] = "Total combinado";
L["precision_full"] = "Precisão total";
L["precision_silver"] = "Prata mais próxima";
L["precision_gold"] = "Ouro mais próximo";
L["price_source"] = "Fonte de preço";
L["price_source_desc"] = "Fontes de preço predefinidas para o cálculo do valor do item.";
L["price_source_changed"] = "Fonte de preço alterada para: ";
L["price_source_poor"] = "Itens de qualidade |cff9d9d9dPobre|r são sempre avaliados com a fonte VendorSell.";
L["ldb_label_source"] = "Fonte do rótulo LDB";
L["ldb_label_source_desc"] = "Controla o que é exibido para o addon dentro dos quadros do host LDB.";
L["ldb_label_source_changed"] = "Fonte do rótulo LDB alterada para: ";
L["show_minimap_icon"] = "Mostrar ícone do minimapa";
L["show_top_contributors"] = "Mostrar principais contribuintes";
L["show_top_contributors_desc"] = "Exibe os 10 itens únicos que mais contribuem para o valor total.";
L["enable_guild_bank"] = "Habilitar banco da guilda";
L["enable_guild_bank_desc"] =
"Resuma o conteúdo do banco da guilda. Esta configuração não tem efeito se você não estiver em uma guilda.";
L["enable_guild_bank_footer"] =
"Habilitar o banco da guilda incluirá seu valor em qualquer lugar onde o 'Total Combinado' é exibido. Os cálculos do banco da guilda não são compartilhados entre personagens.";
L["ldb_money_format"] = "Formato de dinheiro LDB";
L["ldb_money_format_desc"] = "Controla a precisão do valor mostrado no display LDB.";
L["tooltip_money_format"] = "Formato de dinheiro da dica de ferramenta";
L["tooltip_money_format_desc"] = "Controla a precisão dos valores mostrados na dica de ferramenta.";
L["enable_quality_filter"] = "Habilitar filtro de qualidade";
L["enable_quality_filter_desc"] = "Se habilitado, ignora itens abaixo da qualidade selecionada";
L["enabled"] = "habilitado";
L["disabled"] = "desabilitado";
L["quality_filter_toggled"] = "Filtro de qualidade %s";
L["quality_filter"] = "Filtro de qualidade";
L["quality_filter_desc"] = "Itens abaixo da qualidade selecionada não serão considerados nos cálculos";
L["quality_filter_changed"] = "Filtro de qualidade definido para: %s e acima";
L["item_blocklist_enable"] = "Habilitar lista de bloqueio de itens";
L["item_blocklist_desc"] =
"Se habilitado, ignora qualquer item adicionado à lista de bloqueio. Exclusivo mutuamente com a lista de permissões.";
L["item_blocklist_toggled"] = "Lista de bloqueio de itens %s";
L["item_blocklist_instructions"] =
"Para adicionar à lista de bloqueio, arraste um item para o botão abaixo e clique nele. Qualquer item adicionado à lista de bloqueio será ignorado ao avaliar o valor da bolsa. Itens vinculados à alma são ignorados automaticamente. Você pode remover itens desmarcando-os dentro da lista de bloqueio.";
L["drag_item_click"] = "Arraste um item aqui e clique para adicioná-lo.";
L["item_on_blocklist"] = "%s já está na lista de bloqueio.";
L["item_added_blocklist"] = "Adicionado %s à lista de bloqueio.";
L["item_blocklist_nothing_detected"] = "Nenhum item detectado, então nada adicionado à lista de bloqueio.";
L["blocked_items"] = "Itens bloqueados";
L["blocked_items_desc"] = "Itens que devem ser excluídos da avaliação";
L["blocklist_removed_item"] = "Removido %s da lista de bloqueio.";
L["item_allowlist_enable"] = "Habilitar lista de permissões de itens";
L["item_allowlist_desc"] =
"Se habilitado, apenas itens adicionados à lista de permissões serão contados. Exclusivo mutuamente com a lista de bloqueio.";
L["item_allowlist_toggled"] = "Lista de permissões de itens %s";
L["item_allowlist_instructions"] =
"Para adicionar à lista de permissões, arraste um item para o botão abaixo e clique nele. Apenas itens adicionados à lista de permissões serão considerados ao avaliar o valor da bolsa. Você pode remover itens desmarcando-os dentro da lista de permissões.";
L["item_on_allowlist"] = "%s já está na lista de permissões.";
L["item_added_allowlist"] = "Adicionado %s à lista de permissões.";
L["item_allowlist_nothing_detected"] = "Nenhum item detectado, então nada adicionado à lista de permissões.";
L["allowed_items"] = "Itens permitidos";
L["allowed_items_desc"] = "Itens que devem ser considerados exclusivamente para avaliação";
L["allowlist_removed_item"] = "Removido %s da lista de permissões.";
L["about"] = "Sobre";
L["about_bagappraiser"] =
"BagAppraiser é um addon simples que avalia o conteúdo de suas bolsas e banco usando a fonte de preço selecionada.\n\nPor favor, entenda que este addon NÃO determina o ouro líquido que você está garantido para ganhar, mas sim, os valores potenciais de 'ativos' (valor dos itens saqueados) dos itens saqueados onde você terá que fazer o trabalho e vendê-los no Leilão, bate-papo comercial, etc.\n";
L["credits"] = "Créditos";
L["author"] = "Escrito por clocklear (github.com/clocklear)";
L["woweconomy_thanks"] = "Agradecemos ao /r/woweconomy pelo apoio e pelas excelentes ideias de recursos.";
L["other_thanks"] =
"Agradecimentos especiais a ProfitzTV e Testerle por seu trabalho no LootAppraiser; este addon se inspira fortemente em seu trabalho. Estou pisando nos ombros de gigantes.";
L["need_help"] =
"Precisa de ajuda? Tem uma solicitação de recurso? Abra um problema no repositório de código para BagAppraiser ou envie-me uma PM no Reddit.";
L["issue_tracker"] = "Rastreador de problemas:";
L["feedback"] = "Feedback";
L["realm_price"] = "Preço do Reino";
L["region_price"] = "Preço da Região";
L["disabled_instructions"] =
"BagAppraiser está funcionando no modo desativado porque não foi encontrada uma fonte de preços adequada. Você pode resolver isso instalando um dos seguintes addons:"
L["min_bid"] = "Lance mínimo";
L["min_buyout"] = "Arremate mínimo";
L["no_price_sources"] =
"|cffff0000Atenção!|r Addons adicionais ausentes para fontes de preços. Consulte o painel de configuração do addon para mais detalhes.\n\n|cffff0000BagAppraiser desativado.|r";
L["feature_localization"] =
"NOVO -- BagAppraiser agora possui suporte à localização! Uma ampla gama de idiomas nativos é agora acomodada."
L["feature_pricing_sources"] =
"NOVO -- Além do TSM, BagAppraiser agora suporta Auction House DataBase, Auctionator e Oribos Exchange como fontes alternativas de preços."
