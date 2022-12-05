object dmOrdemCorte: TdmOrdemCorte
  OldCreateOrder = False
  Height = 577
  Width = 1047
  object Conexao: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=postgres'
      'Database=dberp'
      'Password=#maga2020'
      'DriverID=PG')
    Connected = True
    Left = 48
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = Conexao
    Left = 144
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 368
    Top = 16
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 256
    Top = 16
  end
  object tbOrdemCorte: TFDTable
    Active = True
    IndexFieldNames = 'oc_id'
    Connection = Conexao
    TableName = 'ordem_corte'
    Left = 40
    Top = 72
  end
  object dsOrdemCorte: TDataSource
    DataSet = qyOrdemCorte
    Left = 112
    Top = 72
  end
  object tbOrdemCorteCores: TFDTable
    Active = True
    IndexFieldNames = 'occ_id'
    Connection = Conexao
    TableName = 'ordem_corte_cores'
    Left = 200
    Top = 72
  end
  object dsOrdemCorteCores: TDataSource
    DataSet = tbOrdemCorteCores
    Left = 312
    Top = 72
  end
  object tbOrdemCorteEmpenho: TFDTable
    Active = True
    IndexFieldNames = 'oce_id'
    Connection = Conexao
    TableName = 'ordem_corte_empenho'
    Left = 424
    Top = 72
  end
  object dsOrdemCorteEmpenho: TDataSource
    DataSet = tbOrdemCorteEmpenho
    Left = 528
    Top = 72
  end
  object tbOrdemCorteEmpenhoAdicional: TFDTable
    Active = True
    IndexFieldNames = 'ocea_id'
    Connection = Conexao
    TableName = 'ordem_corte_empenho_adicional'
    Left = 672
    Top = 72
  end
  object dsOrdemCorteEmpenhoAdicional: TDataSource
    DataSet = tbOrdemCorteEmpenhoAdicional
    Left = 832
    Top = 72
  end
  object tbOrdemCorteEmpenhoReal: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    TableName = 'ordem_corte_empenho_real'
    Left = 64
    Top = 136
  end
  object dsOrdemCorteEmpenhoReal: TDataSource
    DataSet = tbOrdemCorteEmpenhoReal
    Left = 192
    Top = 136
  end
  object tbOrdemCorteEstoqueSobras: TFDTable
    Active = True
    IndexFieldNames = 'oce_id'
    Connection = Conexao
    TableName = 'ordem_corte_estoque_sobras'
    Left = 336
    Top = 136
  end
  object dsOrdemCorteEstoqueSobras: TDataSource
    Left = 488
    Top = 136
  end
  object tbOrdemCorteItensPrevisto: TFDTable
    Active = True
    IndexFieldNames = 'oci_id'
    Connection = Conexao
    TableName = 'ordem_corte_itens_previsto'
    Left = 640
    Top = 136
  end
  object dsOrdemCorteItensPrevisto: TDataSource
    DataSet = tbOrdemCorteItensPrevisto
    Left = 784
    Top = 136
  end
  object tbOrdemCorteItensReal: TFDTable
    Active = True
    IndexFieldNames = 'oci_id'
    Connection = Conexao
    TableName = 'ordem_corte_itens_real'
    Left = 56
    Top = 208
  end
  object dsOrdemCorteItensReal: TDataSource
    DataSet = tbOrdemCorteItensReal
    Left = 176
    Top = 208
  end
  object tbOrdemCorteItensRealNaopro: TFDTable
    Connection = Conexao
    Left = 320
    Top = 208
  end
  object dsOrdemCorteItensRealNaopro: TDataSource
    DataSet = tbOrdemCorteItensRealNaopro
    Left = 480
    Top = 208
  end
  object tbOrdemCorteItensRealSobra: TFDTable
    Active = True
    IndexFieldNames = 'ocirs_id'
    Connection = Conexao
    TableName = 'ordem_corte_itens_real_sobra'
    Left = 632
    Top = 208
  end
  object dsOrdemCorteItensRealSobra: TDataSource
    DataSet = tbOrdemCorteItensRealSobra
    Left = 784
    Top = 208
  end
  object tbOrdemCorteItensSituacao: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    TableName = 'ordem_corte_itens_situacao'
    Left = 64
    Top = 280
  end
  object dsOrdemCorteItensSituacao: TDataSource
    DataSet = tbOrdemCorteItensSituacao
    Left = 200
    Top = 280
  end
  object tbOrdemCortePrototipoFase: TFDTable
    Active = True
    IndexFieldNames = 'ocpf_id'
    Connection = Conexao
    TableName = 'ordem_corte_prototipo_fase'
    Left = 344
    Top = 280
  end
  object dsOrdemCortePrototipoFase: TDataSource
    DataSet = tbOrdemCortePrototipoFase
    Left = 496
    Top = 280
  end
  object tbOrdemCorteRealHistoricoGrade: TFDTable
    Active = True
    IndexFieldNames = 'ocrhg_id'
    Connection = Conexao
    TableName = 'ordem_corte_real_historico_grade'
    Left = 648
    Top = 280
  end
  object dsOrdemCorteRealHistoricoGrade: TDataSource
    DataSet = tbOrdemCorteRealHistoricoGrade
    Left = 816
    Top = 280
  end
  object tbOrdemCorteRetalhosPrevisto: TFDTable
    Active = True
    IndexFieldNames = 'ocrp_id'
    Connection = Conexao
    TableName = 'ordem_corte_retalhos_previsto'
    Left = 80
    Top = 360
  end
  object dsOrdemCorteRetalhosPrevisto: TDataSource
    DataSet = tbOrdemCorteRetalhosPrevisto
    Left = 240
    Top = 360
  end
  object tbOrdemCorteRetalhosReserva: TFDTable
    Active = True
    IndexFieldNames = 'ocrr_id'
    Connection = Conexao
    TableName = 'ordem_corte_retalhos_reserva'
    Left = 408
    Top = 360
  end
  object dsOrdemCorteRetalhosReserva: TDataSource
    DataSet = tbOrdemCorteRetalhosReserva
    Left = 576
    Top = 360
  end
  object tbOrdemCorteSituacao: TFDTable
    Active = True
    IndexFieldNames = 'os_id'
    Connection = Conexao
    TableName = 'ordem_corte_situacao'
    Left = 712
    Top = 360
  end
  object dsOrdemCorteSituacao: TDataSource
    DataSet = tbOrdemCorteSituacao
    Left = 832
    Top = 360
  end
  object tbOrdemCorteSobraSituacao: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = Conexao
    TableName = 'ordem_corte_sobra_situacao'
    Left = 88
    Top = 440
  end
  object dsOrdemCorteSobraSituacao: TDataSource
    DataSet = tbOrdemCorteSobraSituacao
    Left = 232
    Top = 440
  end
  object tbOrdemCorteTrocaItem: TFDTable
    Active = True
    IndexFieldNames = 'octi_id'
    Connection = Conexao
    TableName = 'ordem_corte_troca_item'
    Left = 376
    Top = 440
  end
  object dsOrdemCorteTrocaItem: TDataSource
    DataSet = tbOrdemCorteTrocaItem
    Left = 504
    Top = 440
  end
  object qyOrdemCorte: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from ordem_corte;')
    Left = 448
    Top = 16
  end
end
