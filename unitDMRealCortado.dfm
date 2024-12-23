object dmRealCortado: TdmRealCortado
  Height = 480
  Width = 640
  object qyOrdemPrototipo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 48
    Top = 8
  end
  object qyCodProdAcabadoFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 176
    Top = 8
  end
  object qyStatusRealCortado: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 328
    Top = 8
  end
  object qyFichaIdCorte: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 464
    Top = 16
  end
  object qyGridRealCortado: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'oci.oci_id,'
      #9'CAST(COALESCE(ocis.descricao, '#39' '#39') ||'#39' - '#39'||'
      
        #9'TRIM(CAST(CASE WHEN oci_tipo = '#39'P'#39' THEN '#39'PRINCIPAL'#39' ELSE '#39'SECUN' +
        'DARIO'#39' END AS character varying(10))) AS character varying(45)) ' +
        'AS situacao,'
      
        #9'CAST(COALESCE(gc_pa.grc_codexterno, '#39#39') ||'#39' - '#39' || TRIM(gc_pa.g' +
        'rc_nome, '#39' '#39') AS character varying(18)) AS grc_nome_pa,'
      #9'cp.cp_id,'
      #9'cp.cp_descricao,'
      #9'cm.cm_descricao,'
      
        #9'CAST(COALESCE(gc.grc_codexterno, '#39' '#39') ||'#39' - '#39' || TRIM(gc.grc_no' +
        'me)AS character varying(18)) AS grc_nome,'
      
        #9'CAST(TRIM(gt.grt_nome) || '#39' ('#39' || TRIM(gt.grt_sigla) || '#39')'#39' AS ' +
        'character varying(18)) AS grt_nome,'
      #9'oci_vlrtotal, oci_vlr_sobra,'
      
        #9'oci_qtdade1, oci_qtdade2, oci_qtdade3, oci_qtdade4, oci_qtdade5' +
        ', oci_qtdade6, oci_qtdade7, oci_qtdade8,'
      
        #9'oci_qtdade9, oci_qtdade10, oci_qtdade11, oci_qtdade12, oci_qtda' +
        'de13, oci_qtdade14, oci_qtdade15,'
      #9'cp.cp_un, oci_tipo, oci_tecido'
      #9'FROM ordem_corte_itens_real AS oci'
      #9'JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id'
      
        #9'JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = g' +
        'c_pa.grc_id'
      #9'JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id'
      #9'JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto'
      
        #9'LEFT JOIN composicao_material AS cm ON cm.cm_id = cp.cp_idcompo' +
        'sicao'
      
        #9'JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_si' +
        'tuacao_id'
      #9'WHERE oci.oci_idocorte = '#39'8043'#39' AND oci.oci_situacao_id<>'#39'2'#39
      
        #9'ORDER BY CASE WHEN oci_tecido = true THEN 0 ELSE 1  END, oci.oc' +
        'i_idcortecido, oci.oci_tipo ASC')
    Left = 40
    Top = 88
    object qyGridRealCortadooci_id: TIntegerField
      FieldName = 'oci_id'
      Origin = 'oci_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyGridRealCortadosituacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'situacao'
      Origin = 'situacao'
      ReadOnly = True
      Size = 45
    end
    object qyGridRealCortadogrc_nome_pa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome_pa'
      Origin = 'grc_nome_pa'
      ReadOnly = True
      Size = 18
    end
    object qyGridRealCortadocp_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cp_id'
      Origin = 'cp_id'
    end
    object qyGridRealCortadocp_descricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_descricao'
      Origin = 'cp_descricao'
      Size = 60
    end
    object qyGridRealCortadocm_descricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cm_descricao'
      Origin = 'cm_descricao'
      Size = 100
    end
    object qyGridRealCortadogrc_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome'
      Origin = 'grc_nome'
      ReadOnly = True
      Size = 18
    end
    object qyGridRealCortadogrt_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grt_nome'
      Origin = 'grt_nome'
      ReadOnly = True
      Size = 18
    end
    object qyGridRealCortadooci_vlrtotal: TBCDField
      FieldName = 'oci_vlrtotal'
      Origin = 'oci_vlrtotal'
      DisplayFormat = ',#0.0000'
      Precision = 12
    end
    object qyGridRealCortadooci_vlr_sobra: TBCDField
      FieldName = 'oci_vlr_sobra'
      Origin = 'oci_vlr_sobra'
      DisplayFormat = ',#0.0000'
      Precision = 10
    end
    object qyGridRealCortadooci_qtdade1: TBCDField
      FieldName = 'oci_qtdade1'
      Origin = 'oci_qtdade1'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade2: TBCDField
      FieldName = 'oci_qtdade2'
      Origin = 'oci_qtdade2'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade3: TBCDField
      FieldName = 'oci_qtdade3'
      Origin = 'oci_qtdade3'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade4: TBCDField
      FieldName = 'oci_qtdade4'
      Origin = 'oci_qtdade4'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade5: TBCDField
      FieldName = 'oci_qtdade5'
      Origin = 'oci_qtdade5'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade6: TBCDField
      FieldName = 'oci_qtdade6'
      Origin = 'oci_qtdade6'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade7: TBCDField
      FieldName = 'oci_qtdade7'
      Origin = 'oci_qtdade7'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade8: TBCDField
      FieldName = 'oci_qtdade8'
      Origin = 'oci_qtdade8'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade9: TBCDField
      FieldName = 'oci_qtdade9'
      Origin = 'oci_qtdade9'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade10: TBCDField
      FieldName = 'oci_qtdade10'
      Origin = 'oci_qtdade10'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade11: TBCDField
      FieldName = 'oci_qtdade11'
      Origin = 'oci_qtdade11'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade12: TBCDField
      FieldName = 'oci_qtdade12'
      Origin = 'oci_qtdade12'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade13: TBCDField
      FieldName = 'oci_qtdade13'
      Origin = 'oci_qtdade13'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade14: TBCDField
      FieldName = 'oci_qtdade14'
      Origin = 'oci_qtdade14'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadooci_qtdade15: TBCDField
      FieldName = 'oci_qtdade15'
      Origin = 'oci_qtdade15'
      Precision = 14
      Size = 0
    end
    object qyGridRealCortadocp_un: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_un'
      Origin = 'cp_un'
      FixedChar = True
      Size = 6
    end
    object qyGridRealCortadooci_tipo: TWideStringField
      FieldName = 'oci_tipo'
      Origin = 'oci_tipo'
      FixedChar = True
      Size = 1
    end
    object qyGridRealCortadooci_tecido: TBooleanField
      FieldName = 'oci_tecido'
      Origin = 'oci_tecido'
    end
  end
  object dsGridRealCortado: TDataSource
    DataSet = qyGridRealCortado
    Left = 152
    Top = 88
  end
  object qyGerMediaPecas: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 272
    Top = 88
  end
  object qyRealCortadoOciId: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 400
    Top = 88
  end
  object qyRealQtdCortes: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 48
    Top = 160
  end
  object qyRealQtdGrade: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 176
    Top = 160
  end
end
