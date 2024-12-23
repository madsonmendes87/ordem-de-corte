object dmMudancArtigo: TdmMudancArtigo
  Height = 480
  Width = 640
  object qyEstilistaFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 32
    Top = 24
  end
  object qyTemSolicTroca: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 144
    Top = 24
  end
  object qySelecArtigoDel: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 256
    Top = 24
  end
  object qyDelItemReserva: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 368
    Top = 24
  end
  object qyDeletArtigo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 480
    Top = 24
  end
  object qyMudancArtigo: TFDQuery
    Active = True
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'cp.cp_id,'
      
        #9'CAST(COALESCE(gc_pa.grc_codexterno, '#39#39') ||'#39' - '#39' || TRIM(gc_pa.g' +
        'rc_nome, '#39' '#39') AS character varying(22)) AS grc_nome_pa,'
      #9'oci_vlrtotal,'
      #9'cp.cp_descricao,'
      
        #9'CAST(COALESCE(gc.grc_codexterno, '#39' '#39') ||'#39' - '#39' || TRIM(gc.grc_no' +
        'me)AS character varying(22)) AS grc_nome,'
      '        gt.grt_nome,'
      
        '        oci.oci_id, oci.oci_tecido, oci.oci_tipo, gc.grc_id, gt.' +
        'grt_id'
      #9'FROM ordem_corte_itens_previsto AS oci'
      #9'JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id'
      
        #9'JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = g' +
        'c_pa.grc_id'
      #9'JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id'
      #9'JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto'
      
        #9'JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_si' +
        'tuacao_id'
      #9'WHERE oci.oci_idocorte = '#39'8563'#39' AND oci.oci_situacao_id<>'#39'2'#39
      
        #9'ORDER BY CASE WHEN oci_tecido = true THEN 0 ELSE 1  END, oci.oc' +
        'i_idcortecido, oci.oci_tipo ASC')
    Left = 32
    Top = 104
    object qyMudancArtigocp_id: TIntegerField
      FieldName = 'cp_id'
      Origin = 'cp_id'
    end
    object qyMudancArtigogrc_nome_pa: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome_pa'
      Origin = 'grc_nome_pa'
      ReadOnly = True
      Size = 18
    end
    object qyMudancArtigooci_vlrtotal: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'oci_vlrtotal'
      Origin = 'oci_vlrtotal'
      DisplayFormat = ',#0.0000'
      Precision = 12
    end
    object qyMudancArtigocp_descricao: TWideStringField
      FieldName = 'cp_descricao'
      Origin = 'cp_descricao'
      Size = 60
    end
    object qyMudancArtigogrc_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome'
      Origin = 'grc_nome'
      ReadOnly = True
      Size = 18
    end
    object qyMudancArtigogrt_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grt_nome'
      Origin = 'grt_nome'
      ReadOnly = True
      Size = 18
    end
    object qyMudancArtigooci_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'oci_id'
      Origin = 'oci_id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qyMudancArtigooci_tecido: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'oci_tecido'
      Origin = 'oci_tecido'
    end
    object qyMudancArtigooci_tipo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'oci_tipo'
      Origin = 'oci_tipo'
      FixedChar = True
      Size = 1
    end
    object qyMudancArtigogrc_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grc_id'
      Origin = 'grc_id'
    end
    object qyMudancArtigogrt_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grt_id'
      Origin = 'grt_id'
    end
  end
  object dsMudancArtigo: TDataSource
    DataSet = qyMudancArtigo
    Left = 136
    Top = 104
  end
  object qyETecidoCorProd: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 256
    Top = 104
  end
  object qyInserirTrocaItem: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 376
    Top = 104
  end
  object qyConsumoTroca: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 504
    Top = 104
  end
  object qyEstoqueSemReserProt: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 56
    Top = 176
  end
  object qyInserirTrocaItemReserva: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 208
    Top = 176
  end
  object qyEstoqueSemReserProt2: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 368
    Top = 176
  end
  object qyEstoqueComReserva: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 520
    Top = 176
  end
  object qyEstoqueComReserva2: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 48
    Top = 280
  end
end
