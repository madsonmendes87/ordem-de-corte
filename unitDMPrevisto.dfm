object dmPrevisto: TdmPrevisto
  Height = 480
  Width = 640
  object qyFinalizaPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 32
    Top = 16
  end
  object qyCorteOrdem: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 136
    Top = 16
  end
  object qyCorteItensPrev: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 240
    Top = 16
  end
  object qyTemEmpPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 360
    Top = 16
  end
  object qyQuantidadeCorte: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 488
    Top = 16
  end
  object qyGradePecasCor: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 32
    Top = 96
  end
  object qyItensAviamentoFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 160
    Top = 96
  end
  object qyEstoqueSemReserProt: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 304
    Top = 96
  end
  object qyUsuario: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 424
    Top = 96
  end
  object qyOrdemPrototipo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 528
    Top = 96
  end
  object qyCodProdAcabadoFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 64
    Top = 176
  end
  object qyStatusPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 192
    Top = 176
  end
  object qyFichaIdCorte: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 296
    Top = 176
  end
  object qyGridPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'oci.oci_id,'
      #9'ocis.descricao AS situacao,'
      
        #9'CAST(COALESCE(gc_pa.grc_codexterno, '#39#39') || '#39' - '#39'  || TRIM(gc_pa' +
        '.grc_nome, '#39#39') ||'#39' - '#39' ||'
      
        #9'TRIM(CAST(CASE WHEN oci_tipo = '#39'P'#39' THEN '#39'PRINCIPAL'#39' ELSE '#39'SECUN' +
        'DARIO'#39' END AS character varying(10))) AS character varying(45)) ' +
        'AS grc_nome_pa,'
      #9'cp.cp_id,'
      #9'cp.cp_descricao,'
      
        #9'CAST(COALESCE(gc.grc_codexterno,  '#39#39') || '#39' - '#39' || TRIM(gc.grc_n' +
        'ome)AS character varying(18)) AS grc_nome,'
      
        #9'CAST(TRIM(gt.grt_nome) || '#39' ('#39' || TRIM(gt.grt_sigla) || '#39')'#39' AS ' +
        'character varying(18)) AS grt_nome,'
      #9'oci_vlrtotal,'
      
        #9'oci_qtdade1, oci_qtdade2, oci_qtdade3, oci_qtdade4, oci_qtdade5' +
        ', oci_qtdade6, oci_qtdade7, oci_qtdade8,'
      
        #9'oci_qtdade9, oci_qtdade10, oci_qtdade11, oci_qtdade12, oci_qtda' +
        'de13, oci_qtdade14, oci_qtdade15,'
      #9'cp.cp_un, oci_tipo, oci_tecido'
      #9'FROM ordem_corte_itens_previsto AS oci'
      #9'JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id'
      
        #9'JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = g' +
        'c_pa.grc_id'
      #9'JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id'
      #9'JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto'
      
        #9'JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_si' +
        'tuacao_id'
      #9'WHERE oci.oci_idocorte = '#39'8240'#39' AND oci.oci_situacao_id<>'#39'2'#39
      
        #9'ORDER BY CASE WHEN oci_tecido = true THEN 0 ELSE 1  END, oci.oc' +
        'i_idcortecido, oci.oci_tipo ASC')
    Left = 400
    Top = 176
    object qyGridPrevistooci_id: TIntegerField
      FieldName = 'oci_id'
      Origin = 'oci_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyGridPrevistosituacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 50
    end
    object qyGridPrevistogrc_nome_pa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome_pa'
      Origin = 'grc_nome_pa'
      ReadOnly = True
      Size = 45
    end
    object qyGridPrevistocp_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cp_id'
      Origin = 'cp_id'
    end
    object qyGridPrevistocp_descricao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_descricao'
      Origin = 'cp_descricao'
      Size = 60
    end
    object qyGridPrevistogrc_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome'
      Origin = 'grc_nome'
      ReadOnly = True
      Size = 18
    end
    object qyGridPrevistogrt_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grt_nome'
      Origin = 'grt_nome'
      ReadOnly = True
      Size = 18
    end
    object qyGridPrevistooci_vlrtotal: TBCDField
      FieldName = 'oci_vlrtotal'
      Origin = 'oci_vlrtotal'
      DisplayFormat = ',#0.0000'
      Precision = 12
    end
    object qyGridPrevistooci_qtdade1: TBCDField
      FieldName = 'oci_qtdade1'
      Origin = 'oci_qtdade1'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade2: TBCDField
      FieldName = 'oci_qtdade2'
      Origin = 'oci_qtdade2'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade3: TBCDField
      FieldName = 'oci_qtdade3'
      Origin = 'oci_qtdade3'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade4: TBCDField
      FieldName = 'oci_qtdade4'
      Origin = 'oci_qtdade4'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade5: TBCDField
      FieldName = 'oci_qtdade5'
      Origin = 'oci_qtdade5'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade6: TBCDField
      FieldName = 'oci_qtdade6'
      Origin = 'oci_qtdade6'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade7: TBCDField
      FieldName = 'oci_qtdade7'
      Origin = 'oci_qtdade7'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade8: TBCDField
      FieldName = 'oci_qtdade8'
      Origin = 'oci_qtdade8'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade9: TBCDField
      FieldName = 'oci_qtdade9'
      Origin = 'oci_qtdade9'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade10: TBCDField
      FieldName = 'oci_qtdade10'
      Origin = 'oci_qtdade10'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade11: TBCDField
      FieldName = 'oci_qtdade11'
      Origin = 'oci_qtdade11'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade12: TBCDField
      FieldName = 'oci_qtdade12'
      Origin = 'oci_qtdade12'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade13: TBCDField
      FieldName = 'oci_qtdade13'
      Origin = 'oci_qtdade13'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade14: TBCDField
      FieldName = 'oci_qtdade14'
      Origin = 'oci_qtdade14'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistooci_qtdade15: TBCDField
      FieldName = 'oci_qtdade15'
      Origin = 'oci_qtdade15'
      Precision = 14
      Size = 0
    end
    object qyGridPrevistocp_un: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_un'
      Origin = 'cp_un'
      FixedChar = True
      Size = 6
    end
    object qyGridPrevistooci_tipo: TWideStringField
      FieldName = 'oci_tipo'
      Origin = 'oci_tipo'
      FixedChar = True
      Size = 1
    end
    object qyGridPrevistooci_tecido: TBooleanField
      FieldName = 'oci_tecido'
      Origin = 'oci_tecido'
    end
  end
  object dsGridPrevisto: TDataSource
    DataSet = qyGridPrevisto
    Left = 504
    Top = 176
  end
  object qyGerMediaPecas: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 64
    Top = 264
  end
  object qyPrevistoOciId: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 176
    Top = 264
  end
  object qyPrevistoQtdCortes: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 296
    Top = 264
  end
  object qyIniciadoRealCortado: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 432
    Top = 264
  end
  object qyReabrirPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 552
    Top = 264
  end
  object qyRetirArtigo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 56
    Top = 336
  end
  object qyEditGradeCor: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 152
    Top = 336
  end
  object qyConsTamFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 256
    Top = 336
  end
  object qyEditGradePrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 376
    Top = 336
  end
end
