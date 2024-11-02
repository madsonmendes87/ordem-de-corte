object dmOrdemCorte: TdmOrdemCorte
  Height = 1247
  Width = 1271
  object Conexao: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=postgres'
      'Database=dberp'
      'Password=#maga2020'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 16
    Top = 8
  end
  object FDTransaction1: TFDTransaction
    Connection = Conexao
    Left = 104
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 336
    Top = 8
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 216
    Top = 8
  end
  object dsOrdemCorteCores: TDataSource
    DataSet = qyCores
    Left = 552
    Top = 8
  end
  object tbOrdemCorteTrocaItem: TFDTable
    IndexFieldNames = 'octi_id'
    Connection = Conexao
    TableName = 'ordem_corte_troca_item'
    Left = 376
    Top = 440
  end
  object dsOrdemCorteTrocaItem: TDataSource
    DataSet = tbOrdemCorteTrocaItem
    Left = 512
    Top = 440
  end
  object tbEstilista: TFDTable
    IndexFieldNames = 'es_id'
    Connection = Conexao
    TableName = 'cadastro_estilista'
    Left = 616
    Top = 440
  end
  object dsEstilista: TDataSource
    DataSet = tbEstilista
    Left = 696
    Top = 440
  end
  object qyCores: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT (cast('#39'Cod Uso: '#39' || (gc.grc_codexterno) ||'#39'    '#39' ||'
      #9#9#9#9'   TRIM(GC.grc_nome) || '#39' ('#39' ||'
      
        #9#9#9#9'   TRIM(GC.grc_sigla) || '#39')'#39' as character varying(120))) AS ' +
        'grc_nome'
      #9#9#9#9'   FROM ordem_corte ,ordem_corte_cores AS occ'
      #9#9#9#9'   JOIN grade_cor AS gc ON gc.grc_id = occ.occ_idcor'
      #9#9#9#9'   WHERE occ_idordemcorte=oc_id')
    Left = 456
    Top = 8
  end
  object qyCoresNoCorte: TFDQuery
    Connection = Conexao
    Left = 672
    Top = 8
  end
  object dsCoresNoCorte: TDataSource
    DataSet = qyCoresNoCorte
    Left = 776
    Top = 8
  end
  object tbCorteCores: TFDTable
    IndexFieldNames = 'occ_id'
    Connection = Conexao
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte_cores'
    Left = 880
    Top = 8
  end
  object dsProdutoAvancoProd: TDataSource
    Left = 1024
    Top = 128
  end
  object dsProdReposicao: TDataSource
    Left = 888
    Top = 184
  end
  object dsConfAvancoProducao: TDataSource
    Left = 1208
    Top = 184
  end
  object qyIdCorte: TFDQuery
    Connection = Conexao
    Left = 1208
    Top = 240
  end
  object dsOrdemCorteProtFase: TDataSource
    Left = 520
    Top = 304
  end
  object qyCorPrevisto: TFDQuery
    Connection = Conexao
    Left = 1192
    Top = 320
  end
  object qyGrc: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT '
      'grc_id,'
      
        'CAST(COALESCE(gc.grc_codexterno, '#39#39') ||'#39' - '#39' || TRIM(gc.grc_nome' +
        ', '#39#39') AS character varying(18)) AS grc_nome_pa'
      'FROM grade_cor AS gc')
    Left = 896
    Top = 504
  end
  object dsGrc: TDataSource
    DataSet = qyGrc
    Left = 968
    Top = 504
  end
  object tbTrocaItem: TFDTable
    Connection = Conexao
    Transaction = FDTransaction1
    TableName = 'producao_troca_item'
    Left = 520
    Top = 640
  end
  object dsTrocaItem: TDataSource
    DataSet = tbTrocaItem
    Left = 608
    Top = 640
  end
  object tbTrocaItemReserva: TFDTable
    Connection = Conexao
    Transaction = FDTransaction1
    TableName = 'producao_troca_item_reserva'
    Left = 704
    Top = 640
  end
  object dsTrocaItemReserva: TDataSource
    DataSet = tbTrocaItemReserva
    Left = 824
    Top = 640
  end
  object qyLimpaCampos: TFDQuery
    Connection = Conexao
    Left = 903
    Top = 1048
  end
  object cdsProdSemEstoque: TClientDataSet
    PersistDataPacket.Data = {
      DA0000009619E0BD010000001800000009000000000003000000DA0009696450
      726F6475746F04000100000000000750726F6475746F01004900000001000557
      4944544802000200280003436F72010049000000010005574944544802000200
      1E000754616D616E686F01004900000001000557494454480200020019000454
      69706F010049000000010005574944544802000200140007436F6E73756D6F08
      000400000000000A446973706F6E6976656C080004000000000006636F64436F
      7204000100000000000A636F6454616D616E686F04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 168
    object cdsProdSemEstoqueidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object cdsProdSemEstoqueProduto: TStringField
      FieldName = 'Produto'
      Size = 40
    end
    object cdsProdSemEstoqueCor: TStringField
      FieldName = 'Cor'
      Size = 30
    end
    object cdsProdSemEstoqueTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 25
    end
    object cdsProdSemEstoqueTipo: TStringField
      FieldName = 'Tipo'
    end
    object cdsProdSemEstoqueConsumo: TFloatField
      FieldName = 'Consumo'
      DisplayFormat = ',#0.0000'
    end
    object cdsProdSemEstoqueDisponivel: TFloatField
      FieldName = 'Disponivel'
      DisplayFormat = ',#0.0000'
    end
    object cdsProdSemEstoquecodCor: TIntegerField
      FieldName = 'codCor'
    end
    object cdsProdSemEstoquecodTamanho: TIntegerField
      FieldName = 'codTamanho'
    end
  end
  object cdsProdReposicao: TClientDataSet
    PersistDataPacket.Data = {
      B50000009619E0BD010000001800000007000000000003000000B50009696450
      726F6475746F04000100000000000750726F6475746F01004900000001000557
      4944544802000200280003436F72010049000000010005574944544802000200
      1E000754616D616E686F01004900000001000557494454480200020019000E44
      617461205265706F736963616F040006000000000006636F64436F7204000100
      000000000A636F6454616D616E686F04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 168
    object cdsProdReposicaoidProduto: TIntegerField
      FieldName = 'idProduto'
    end
    object cdsProdReposicaoProduto: TStringField
      FieldName = 'Produto'
      Size = 40
    end
    object cdsProdReposicaoCor: TStringField
      FieldName = 'Cor'
      Size = 30
    end
    object cdsProdReposicaoTamanho: TStringField
      FieldName = 'Tamanho'
      Size = 25
    end
    object cdsProdReposicaoDataReposicao: TDateField
      FieldName = 'Data Reposicao'
    end
    object cdsProdReposicaocodCor: TIntegerField
      FieldName = 'codCor'
    end
    object cdsProdReposicaocodTamanho: TIntegerField
      FieldName = 'codTamanho'
    end
  end
end
