object dmEmpenho: TdmEmpenho
  Height = 480
  Width = 640
  object qyArtigoEmpenho: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'oci.oci_id,'
      #9'oci.oci_iditemficha,'
      #9'oci.oci_tecido,'
      #9'cp.cp_id,'
      #9'gc.grc_id,'
      #9'gt.grt_id,'
      #9'oci.oci_idgradecorprodutoacabado,'
      #9'cp.cp_descricao,'
      
        #9'CAST(COALESCE(gc.grc_codexterno, '#39#39') ||'#39' - '#39' || TRIM(gc.grc_nom' +
        'e)AS character varying(18)) AS grc_nome,'
      #9'grt_nome,'
      
        #9'CAST(COALESCE(gc_pa.grc_codexterno, '#39#39') ||'#39' - '#39' || TRIM(gc_pa.g' +
        'rc_nome)AS character varying(18)) AS grc_nome_pa,'
      #9'oci.oci_vlrtotal,'
      #9'(oci.oci_vlrtotal) AS oci_restante,'
      #9'(SELECT'
      #9' '#9'COALESCE('
      #9#9#9'SUM ('
      #9#9#9#9#9'('
      
        #9#9#9#9#9#9'COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidafo' +
        'rn, 0.000) +'
      
        #9#9#9#9#9#9'COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatrans' +
        'f, 0.0000)'
      #9#9#9#9#9') -'
      #9#9#9#9#9'('
      
        #9#9#9#9#9#9'COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entemp' +
        'enho, 0.0000)'
      #9#9#9#9#9') -'#9#9#9#9#9
      #9#9#9#9#9'('
      
        #9#9#9#9#9#9'COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbal' +
        'anco, 0.0000)'
      #9#9#9#9#9')'
      #9#9#9#9')'#9#9
      #9#9', 0.0000)'
      #9#9'FROM estoque As e'
      #9#9'JOIN cadastro_produto AS cp_i ON e.es_codproduto = cp_i.cp_id'
      #9' '#9'JOIN grade_cor As gc_i On gc_i.grc_id = e.es_idgradecor'
      #9' '#9'WHERE gc_i.grc_id=gc.grc_id'
      #9' '#9'AND cp_i.cp_id=cp.cp_id'
      #9' '#9'AND('
      #9#9#9#9'('
      
        #9#9#9#9#9'COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidafor' +
        'n, 0.000) +'
      
        #9#9#9#9#9'COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf' +
        ', 0.0000)'
      #9#9#9#9') -'
      #9#9#9#9'('
      
        #9#9#9#9#9'COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempe' +
        'nho, 0.0000)'
      #9#9#9#9') -'
      #9#9#9#9'('
      
        #9#9#9#9#9'COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbala' +
        'nco, 0.0000)'
      #9#9#9#9')'
      #9#9#9')>0'
      #9' )AS disponivel,'
      #9' cp.cp_un'
      #9' FROM ordem_corte_itens_previsto AS oci'
      #9' JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id'
      
        #9' JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = ' +
        'gc_pa.grc_id'
      #9' JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id'
      #9' JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto'
      
        #9' JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_s' +
        'ituacao_id'
      
        #9' WHERE oci.oci_idocorte='#39'8113'#39' AND oci.oci_situacao_id = '#39'1'#39' AN' +
        'D oci.oci_tecido = true'
      #9#9#9)
    Left = 48
    Top = 32
    object qyArtigoEmpenhooci_id: TIntegerField
      FieldName = 'oci_id'
      Origin = 'oci_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyArtigoEmpenhooci_iditemficha: TIntegerField
      FieldName = 'oci_iditemficha'
      Origin = 'oci_iditemficha'
    end
    object qyArtigoEmpenhooci_tecido: TBooleanField
      FieldName = 'oci_tecido'
      Origin = 'oci_tecido'
    end
    object qyArtigoEmpenhocp_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cp_id'
      Origin = 'cp_id'
    end
    object qyArtigoEmpenhogrc_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grc_id'
      Origin = 'grc_id'
    end
    object qyArtigoEmpenhogrt_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grt_id'
      Origin = 'grt_id'
    end
    object qyArtigoEmpenhooci_idgradecorprodutoacabado: TIntegerField
      FieldName = 'oci_idgradecorprodutoacabado'
      Origin = 'oci_idgradecorprodutoacabado'
    end
    object qyArtigoEmpenhocp_descricao: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 50
      FieldName = 'cp_descricao'
      Origin = 'cp_descricao'
      Size = 60
    end
    object qyArtigoEmpenhogrc_nome: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 25
      FieldName = 'grc_nome'
      Origin = 'grc_nome'
      ReadOnly = True
      Size = 18
    end
    object qyArtigoEmpenhogrt_nome: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 13
      FieldName = 'grt_nome'
      Origin = 'grt_nome'
      Size = 30
    end
    object qyArtigoEmpenhogrc_nome_pa: TWideStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 25
      FieldName = 'grc_nome_pa'
      Origin = 'grc_nome_pa'
      ReadOnly = True
      Size = 18
    end
    object qyArtigoEmpenhooci_vlrtotal: TBCDField
      FieldName = 'oci_vlrtotal'
      Origin = 'oci_vlrtotal'
      DisplayFormat = ',#0.0000'
      Precision = 12
    end
    object qyArtigoEmpenhodisponivel: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayWidth = 16
      FieldName = 'disponivel'
      Origin = 'disponivel'
      ReadOnly = True
      DisplayFormat = ',#0.0000'
      Precision = 64
      Size = 0
    end
    object qyArtigoEmpenhooci_restante: TBCDField
      FieldName = 'oci_restante'
      Origin = 'oci_restante'
      DisplayFormat = ',#0.0000'
      Precision = 12
    end
    object qyArtigoEmpenhocp_un: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_un'
      Origin = 'cp_un'
      FixedChar = True
      Size = 6
    end
  end
  object dsArtigoEmpenho: TDataSource
    DataSet = qyArtigoEmpenho
    Left = 160
    Top = 32
  end
end
