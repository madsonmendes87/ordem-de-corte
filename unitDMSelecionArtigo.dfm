object dmSelecionArtigo: TdmSelecionArtigo
  Height = 480
  Width = 640
  object dsSelecArtigo: TDataSource
    DataSet = qySelecArtigo
    Left = 136
    Top = 24
  end
  object qySelecArtigo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'cc.comp_nome,'
      #9'cp.cp_id,'
      #9'cp.cp_descricao AS produto,'
      
        #9'CAST(COALESCE(gc.grc_codexterno, '#39#39') ||'#39' - '#39' || TRIM(gc.grc_nom' +
        'e)AS character varying(22)) AS grc_nome,'
      #9'gt.grt_nome,'
      #9'(SUM('
      #9#9#9'('
      
        #9#9#9#9'COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn' +
        ', 0.000) +'
      
        #9#9#9#9'COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf,' +
        ' 0.0000)'
      #9#9#9') -'
      #9#9#9'('
      
        #9#9#9#9'COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempen' +
        'ho, 0.0000)'
      #9#9#9')'
      #9#9#9'- ('
      
        #9#9#9#9'COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalan' +
        'co, 0.0000)'
      #9#9#9')'
      #9#9') '
      #9')AS disponivel,'
      #9' cp.cp_un,'
      #9' cp.cp_nomefoto1,'
      #9' cp.cp_nomefoto2,'
      #9' cp.cp_nomefoto3,'
      #9' pgc.pgc_nomefoto,'
      #9' cp.cp_qtdadefracionada,'
      #9' cp.cp_rolopeca,'
      #9' cp.cp_idtipoproduto,'
      #9' gc.grc_id,'
      #9' gt.grt_id'
      #9' FROM estoque AS e'
      #9' JOIN cadastro_produto AS cp ON e.es_codproduto = cp.cp_id'
      #9' JOIN grade_cor As gc on gc.grc_id = e.es_idgradecor'
      #9' JOIN grade_tamanho As gt on gt.grt_id = e.es_idgradetam'
      
        #9' LEFT JOIN itens_grade_nfentrada AS igf ON igf.ig_codproduto=cp' +
        '.cp_id'
      #9' AND igf.ig_gradecor=gc.grc_id'
      #9' AND igf.ig_gradetam=gt.grt_id'
      #9' AND igf.ig_numrolo=e.es_numrolo'
      #9' AND igf.ig_metragemrolo=e.es_metragemrolo'
      
        #9' LEFT JOIN cadastro_compradores AS cc ON cc.comp_id = igf.ig_id' +
        'comprador'
      
        #9' LEFT JOIN produto_gradecor AS pgc ON pgc.pgc_idcodproduto = cp' +
        '.cp_id  AND pgc.pgc_idgradecor = gc.grc_id'
      #9' WHERE cp.cp_direto = TRUE'
      #9' AND cp.cp_desativado = FALSE'
      #9' GROUP BY'
      #9#9'cp.cp_id,'
      #9#9'gc.grc_id,'
      #9#9'gt.grt_id,'
      #9#9'cp.cp_descricao,'
      #9#9'gc.grc_nome,'
      #9#9'gc.grc_codexterno,'
      #9#9'gc.grc_sigla,'
      #9#9'gt.grt_nome,'
      #9#9'gt.grt_sigla,'
      #9#9'cp.cp_nomefoto1,'
      #9#9'cp.cp_nomefoto2,'
      #9#9'cp.cp_nomefoto3,'
      #9#9'cp.cp_qtdadefracionada,'
      #9#9'cc.comp_nome,'
      #9#9'pgc.pgc_nomefoto'
      
        #9' ORDER BY cp.cp_descricao,gc.grc_nome, gt.grt_nome ASC  LIMIT 2' +
        '0')
    Left = 32
    Top = 24
    object qySelecArtigocomp_nome: TWideStringField
      FieldName = 'comp_nome'
      Origin = 'comp_nome'
    end
    object qySelecArtigocp_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cp_id'
      Origin = 'cp_id'
    end
    object qySelecArtigoproduto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'produto'
      Size = 60
    end
    object qySelecArtigogrc_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grc_nome'
      Origin = 'grc_nome'
      ReadOnly = True
      Size = 18
    end
    object qySelecArtigogrt_nome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'grt_nome'
      Origin = 'grt_nome'
      Size = 30
    end
    object qySelecArtigodisponivel: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'disponivel'
      Origin = 'disponivel'
      ReadOnly = True
      DisplayFormat = ',#0.0000'
      Precision = 64
      Size = 0
    end
    object qySelecArtigocp_un: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_un'
      Origin = 'cp_un'
      FixedChar = True
      Size = 6
    end
    object qySelecArtigocp_nomefoto1: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_nomefoto1'
      Origin = 'cp_nomefoto1'
      Size = 80
    end
    object qySelecArtigocp_nomefoto2: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_nomefoto2'
      Origin = 'cp_nomefoto2'
      Size = 80
    end
    object qySelecArtigocp_nomefoto3: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'cp_nomefoto3'
      Origin = 'cp_nomefoto3'
      Size = 80
    end
    object qySelecArtigopgc_nomefoto: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'pgc_nomefoto'
      Origin = 'pgc_nomefoto'
      Size = 80
    end
    object qySelecArtigocp_qtdadefracionada: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cp_qtdadefracionada'
      Origin = 'cp_qtdadefracionada'
    end
    object qySelecArtigocp_rolopeca: TBooleanField
      AutoGenerateValue = arDefault
      FieldName = 'cp_rolopeca'
      Origin = 'cp_rolopeca'
    end
    object qySelecArtigocp_idtipoproduto: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'cp_idtipoproduto'
      Origin = 'cp_idtipoproduto'
    end
    object qySelecArtigogrc_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grc_id'
      Origin = 'grc_id'
    end
    object qySelecArtigogrt_id: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'grt_id'
      Origin = 'grt_id'
    end
  end
  object qyComparArtigo1: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 248
    Top = 24
  end
  object qyComparArtigo2: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 368
    Top = 24
  end
  object qyEstoqueArtigo: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 496
    Top = 24
  end
  object qyFotoProduto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 40
    Top = 96
  end
end
