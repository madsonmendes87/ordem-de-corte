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
      'SELECT'
      '    Cast(concat(lpad(cast(oc.oc_id As varchar), 7, '#39'0'#39'),'
      
        '    '#39'-'#39', lpad(cast(oc.oc_ordem As varchar), 3, '#39'0'#39') )as characte' +
        'r varying(15))'
      '    as NumerodoCorte,'
      
        '    cc.co_descricao, (ocs.os_nome)as situacao, (ce.es_nome)as es' +
        'tilista,'
      
        '    oc.oc_idfichatecnica, (SELECT op.op_id FROM ordem_producao A' +
        'S op'
      
        '    WHERE op.op_idordemcorte = oc.oc_id AND op.op_idstatus <> '#39'4' +
        #39')'
      '    as noordproducao, (SELECT (CASE WHEN ((oc.oc_situacao = 1)'
      
        '    AND (coalesce(ocpi.oci_id, 0) = 0) AND (coalesce(ocri.oci_id' +
        ',0) = 0)) THEN'
      '    CURRENT_DATE - oc.oc_dtgerada::DATE'
      
        '    WHEN ((oc.oc_situacao = 1) AND  (coalesce(ocpi.oci_id, 0) > ' +
        '0)'
      
        '    AND (coalesce(ocri.oci_id,0) = 0)) THEN CURRENT_DATE - ocpi.' +
        'oci_dtlanc::DATE'
      
        '    WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0' +
        ')'
      
        '    AND (coalesce(ocri.oci_id,0) > 0)) THEN CURRENT_DATE - ocri.' +
        'oci_dtlanc::DATE'
      '  ELSE 0 END)'
      
        'FROM ordem_corte as oci LEFT JOIN ordem_corte_itens_previsto as ' +
        'ocpi on'
      
        '((ocpi.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT I' +
        'N (2, 4)))'
      'LEFT JOIN ordem_corte_itens_real as ocri on'
      
        '((ocri.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT I' +
        'N (2, 4)))'
      'WHERE oci.oc_id=oc.oc_id LIMIT 1 ) AS diasemprocesso,'
      'Cast(Case When oc.oc_prototipo = True Then '#39'Prot'#243'tipo'#39
      'ELSE '#39'Grande Escala'#39' END as character varying(15)) AS tipo,'
      
        '(pa.cad_idreferencia)as referencia,(pa.cad_descricao)as produtoa' +
        'cabado,'
      '(oc.oc_dtgerada)as datagerada,'
      '(SELECT oci_dtlanc FROM ordem_corte_itens_previsto'
      
        'WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as' +
        ' datagradeprevisto,'
      '(SELECT oci_dtlanc FROM ordem_corte_itens_real'
      
        'WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as' +
        ' datagradereal,'
      '   Cast(CASE WHEN (SELECT emp_tipo FROM controle_empenho'
      
        '   WHERE emp_idordemcorte= oc.oc_id And emp_situacao <>'#39'C'#39' LIMIT' +
        ' 1) IS NULL THEN '#39'N'#195'O EMPENHADO'#39
      
        '   ELSE(CASE WHEN (SELECT emp_tipo FROM controle_empenho WHERE e' +
        'mp_idordemcorte=oc.oc_id'
      '      AND emp_situacao IN ('#39'N'#39', '#39'P'#39') AND emp_mod = '#39'0'#39
      
        '      ORDER BY emp_id DESC LIMIT 1)= '#39'S'#39' THEN '#39'PLANEJAMENTO => A' +
        'LMOXARIFADO'#39
      
        '    WHEN (SELECT emp_tipo FROM controle_empenho WHERE emp_idorde' +
        'mcorte=oc.oc_id'
      
        '      AND emp_situacao='#39'N'#39' AND emp_mod = '#39'1'#39' ORDER BY emp_id DES' +
        'C LIMIT 1)= '#39'E'#39' THEN '#39'ALMOXARIFADO => CORTE'#39
      
        '    WHEN (SELECT emp_tipo FROM controle_empenho WHERE emp_idorde' +
        'mcorte=oc.oc_id'
      
        '      AND emp_situacao= '#39'P'#39' AND emp_mod = '#39'1'#39' ORDER BY emp_id DE' +
        'SC LIMIT 1) = '#39'E'#39' THEN '#39'RECEBIDO NO CORTE'#39
      '    END)'
      '  END as character varying(30)) AS processoempenho,'
      
        'oc.oc_observacao FROM ordem_corte as oc JOIN produto_acabado as ' +
        'pa on pa.cad_id = oc.oc_idcodprodutoacabado LEFT JOIN colecao as' +
        ' cc on'
      'cc.co_id = pa.cad_idcolecao LEFT JOIN cadastro_estilista as ce'
      
        'on pa.cad_idestilista = ce.es_id LEFT JOIN ordem_corte_situacao ' +
        'as ocs on'
      'ocs.os_id = oc.oc_situacao WHERE oc.oc_situacao <> '#39'2'#39
      'AND not EXISTS (SELECT * FROM ordem_producao AS op'
      '  WHERE op.op_idordemcorte=oc.oc_id and op.op_idstatus <> 4)'
      'ORDER BY oc.oc_id desc limit 30'
      '')
    Left = 448
    Top = 16
  end
  object tbEstilista: TFDTable
    Active = True
    IndexFieldNames = 'es_id'
    Connection = Conexao
    TableName = 'cadastro_estilista'
    Left = 600
    Top = 440
  end
  object dsEstilista: TDataSource
    DataSet = tbEstilista
    Left = 656
    Top = 440
  end
  object qyProdutoAcabado: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select pa.cad_id,  pa.cad_idreferencia, pa.cad_descricao, ft.fi_' +
        'id as ficha_id,'
      'Cast(CASE WHEN ft.fi_complementar=TRUE THEN '#39'SIM'#39' ELSE '#39'N'#195'O'#39' END'
      ' as character varying(5)) strComplementar,'
      
        'Cast(CASE WHEN ft.fi_aproveitamento=TRUE THEN '#39'SIM'#39' ELSE '#39'N'#195'O'#39' E' +
        'ND'
      'as character varying(5)) strAproveitamento'
      
        'from produto_acabado as pa join ficha_tecnica as ft on ft.fi_idp' +
        'rodutoacabado = pa.cad_id'
      'where pa.cad_situacao='#39'A'#39' order By ft.fi_id desc limit 15;')
    Left = 528
    Top = 16
  end
  object dsProdutoAcabado: TDataSource
    DataSet = qyProdutoAcabado
    Left = 616
    Top = 16
  end
  object tbProdutoAcabado: TFDTable
    Active = True
    IndexFieldNames = 'cad_id'
    Connection = Conexao
    TableName = 'produto_acabado'
    Left = 704
    Top = 16
  end
end
