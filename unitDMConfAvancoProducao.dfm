object dmConfirmacaoAvancoProducao: TdmConfirmacaoAvancoProducao
  Height = 480
  Width = 640
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
    Top = 24
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
    Top = 24
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
  object tbConfAvancoProducao: TFDTable
    Active = True
    IndexFieldNames = 'capr_id'
    Connection = dmOrdemCorte.Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'confimacao_avanco_producao_referencia'
    Left = 312
    Top = 24
  end
  object qyOldValue: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 448
    Top = 24
  end
  object dsAvancoProducaoItens: TDataSource
    Left = 216
    Top = 104
  end
  object tbAvancoProducaoItens: TFDTable
    Active = True
    IndexFieldNames = 'capri_id'
    MasterSource = dsAvancoProducaoItens
    Connection = dmOrdemCorte.Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'confimacao_avanco_producao_referencia_itens'
    Left = 64
    Top = 104
  end
  object dsProdutoAvancoProd: TDataSource
    DataSet = cdsProdSemEstoque
    Left = 352
    Top = 104
  end
  object dsProdReposicao: TDataSource
    DataSet = cdsProdReposicao
    Left = 496
    Top = 104
  end
end
