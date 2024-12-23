object dmSelecEmpenho: TdmSelecEmpenho
  Height = 480
  Width = 640
  object qyFoto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 40
    Top = 32
  end
  object qyTecido: TFDQuery
    Active = True
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'e.es_id,'
      #9'cc.comp_nome,'
      #9'cp.cp_descricao,'
      
        '        CAST(COALESCE(gc.grc_codexterno, '#39#39') ||'#39' - '#39' || TRIM(gc.' +
        'grc_nome)AS character varying(18)) AS grc_nome,'
      #9'gt.grt_nome,'
      #9'('
      #9#9'( '
      
        #9#9#9'COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn,' +
        ' 0.000) +'
      
        #9#9#9'COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, ' +
        '0.0000)'
      #9#9') -'
      #9#9'('
      
        #9#9#9'COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenh' +
        'o, 0.0000)'
      #9#9') -'
      #9#9'('
      
        #9#9#9'COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanc' +
        'o, 0.0000)'
      #9#9')'
      #9#9
      #9')AS disponivel,'
      #9'e.es_numrolo,'
      
        '        CAST((igf.ig_quantidade || '#39' '#39' ||  cp.cp_unestoque) AS c' +
        'haracter varying(18)) AS entrada_em_metro,'
      #9'COALESCE(e.es_custoatual, 0) AS es_custoatual,'
      #9'f.for_nome,'
      #9'f.for_apelido,'
      '        (false) AS selected_item'
      #9'FROM estoque AS e'
      #9'JOIN cadastro_produto AS cp ON e.es_codproduto = cp.cp_id'
      #9'JOIN grade_cor AS gc ON gc.grc_id = e.es_idgradecor'
      #9'JOIN grade_tamanho AS gt ON gt.grt_id = e.es_idgradetam'
      
        #9'LEFT JOIN itens_grade_nfentrada AS igf ON igf.ig_codproduto=cp.' +
        'cp_id'
      #9'AND igf.ig_gradecor=gc.grc_id'
      #9'AND igf.ig_gradetam=gt.grt_id'
      #9'AND igf.ig_numrolo=e.es_numrolo'
      #9'AND igf.ig_metragemrolo=e.es_metragemrolo'
      
        #9'LEFT JOIN nota_fiscal_entrada AS nfe ON igf.ig_idnfent=nfe.nfe_' +
        'id'
      
        #9'LEFT JOIN cadastro_compradores AS cc ON cc.comp_id = igf.ig_idc' +
        'omprador'
      #9'LEFT JOIN fornecedor AS f ON f.for_codigo = nfe.nfe_codforn'
      #9'LEFT JOIN itens_xml AS ixml ON ixml.pnfe_idnfe=nfe.nfe_id'
      #9'AND ixml.pnfe_coditem=igf.ig_codproduto'
      #9'WHERE gc.grc_id='#39'11'#39
      #9'AND cp.cp_id='#39'3917'#39
      #9'AND'
      #9#9'('
      #9#9#9'('
      
        #9#9#9#9'COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn' +
        ', 0.000) +'
      
        #9#9#9#9'COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf,' +
        ' 0.0000)'
      #9#9#9') -'
      #9#9#9'('
      
        #9#9#9#9'COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempen' +
        'ho, 0.0000)'
      #9#9#9') -'
      #9#9#9'('
      
        #9#9#9#9'COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalan' +
        'co, 0.0000)'
      #9#9#9')'
      #9#9') > 0'
      #9'ORDER BY e.es_numrolo, disponivel ASC'
      #9
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 128
    Top = 32
    object qyTecidoes_id: TIntegerField
      FieldName = 'es_id'
      Origin = 'es_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyTecidocomp_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'comp_nome'
      Origin = 'comp_nome'
    end
    object qyTecidocp_descricao: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 40
      FieldName = 'cp_descricao'
      Origin = 'cp_descricao'
      Size = 60
    end
    object qyTecidogrc_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome'
      Origin = 'grc_nome'
      ReadOnly = True
      Size = 18
    end
    object qyTecidogrt_nome: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 20
      FieldName = 'grt_nome'
      Origin = 'grt_nome'
      Size = 30
    end
    object qyTecidodisponivel: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayWidth = 15
      FieldName = 'disponivel'
      Origin = 'disponivel'
      ReadOnly = True
      DisplayFormat = ',#0.0000'
      Precision = 64
      Size = 0
    end
    object qyTecidoes_numrolo: TWideStringField
      FieldName = 'es_numrolo'
      Origin = 'es_numrolo'
    end
    object qyTecidoentrada_em_metro: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'entrada_em_metro'
      Origin = 'entrada_em_metro'
      ReadOnly = True
      Size = 18
    end
    object qyTecidoes_custoatual: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayWidth = 15
      FieldName = 'es_custoatual'
      Origin = 'es_custoatual'
      ReadOnly = True
      DisplayFormat = ',#0.0000'
      Precision = 64
      Size = 0
    end
    object qyTecidofor_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'for_nome'
      Origin = 'for_nome'
      Size = 50
    end
    object qyTecidofor_apelido: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'for_apelido'
      Origin = 'for_apelido'
      Size = 30
    end
    object qyTecidoselected_item: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'selected_item'
      Origin = 'selected_item'
      ReadOnly = True
    end
  end
  object dsTecido: TDataSource
    DataSet = cdSelecEmpenho
    Left = 208
    Top = 32
  end
  object qySelecLinhaGrid: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 304
    Top = 32
  end
  object cdSelecEmpenho: TClientDataSet
    PersistDataPacket.Data = {
      610100009619E0BD01000000180000000C00000000000300000061010565735F
      6964040001000000000009636F6D705F6E6F6D65010049000000010005574944
      54480200020014000C63705F64657363726963616F0100490000000100055749
      445448020002003C00086772635F6E6F6D650100490000000100055749445448
      020002001200086772745F6E6F6D650100490000000100055749445448020002
      001E000A646973706F6E6976656C08000400000000000A65735F6E756D726F6C
      6F010049000000010005574944544802000200140010656E74726164615F656D
      5F6D6574726F01004900000001000557494454480200020012000D65735F6375
      73746F617475616C080004000000000008666F725F6E6F6D6501004900000001
      000557494454480200020028000B666F725F6170656C69646F01004900000001
      000557494454480200020014000D73656C65637465645F6974656D0200030000
      0000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 32
    object cdSelecEmpenhoes_id: TIntegerField
      FieldName = 'es_id'
    end
    object cdSelecEmpenhocomp_nome: TStringField
      FieldName = 'comp_nome'
    end
    object cdSelecEmpenhocp_descricao: TStringField
      FieldName = 'cp_descricao'
      Size = 60
    end
    object cdSelecEmpenhogrc_nome: TStringField
      FieldName = 'grc_nome'
      Size = 18
    end
    object cdSelecEmpenhogrt_nome: TStringField
      FieldName = 'grt_nome'
      Size = 30
    end
    object cdSelecEmpenhodisponivel: TFloatField
      FieldName = 'disponivel'
    end
    object cdSelecEmpenhoes_numrolo: TStringField
      FieldName = 'es_numrolo'
    end
    object cdSelecEmpenhoentrada_em_metro: TStringField
      FieldName = 'entrada_em_metro'
      Size = 18
    end
    object cdSelecEmpenhoes_custoatual: TFloatField
      FieldName = 'es_custoatual'
    end
    object cdSelecEmpenhofor_nome: TStringField
      FieldName = 'for_nome'
      Size = 40
    end
    object cdSelecEmpenhofor_apelido: TStringField
      FieldName = 'for_apelido'
    end
    object cdSelecEmpenhoselected_item: TBooleanField
      FieldName = 'selected_item'
    end
  end
end
