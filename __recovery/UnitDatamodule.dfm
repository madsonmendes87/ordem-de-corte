object dmOrdemCorte: TdmOrdemCorte
  Height = 1164
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
  object dsOrdemCorte: TDataSource
    DataSet = qyOrdemCorte
    Left = 440
    Top = 16
  end
  object dsOrdemCorteCores: TDataSource
    DataSet = qyCores
    Left = 880
    Top = 16
  end
  object dsOrdemdeCorte: TDataSource
    Left = 616
    Top = 72
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
  object qyOrdemCorte: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      '    oc.oc_id as NumerodoCorte,'
      
        '    Cast(lpad(cast(oc.oc_ordem As varchar), 3, '#39'0'#39') as character' +
        ' varying(5))as numeroseq,'
      
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
      'Cast(Case When oc.oc_prototipo = True Then '#39'Prototipo'#39
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
      'ORDER BY oc.oc_id desc limit 23'
      '')
    Left = 720
    Top = 368
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
      
        'where pa.cad_situacao='#39'A'#39' and ft.fi_situacao in ('#39'F'#39', '#39'Z'#39') order' +
        ' By ft.fi_id desc limit 15;')
    Left = 528
    Top = 16
  end
  object dsProdutoAcabado: TDataSource
    DataSet = qyProdutoAcabado
    Left = 624
    Top = 16
  end
  object qyBoxColecao: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'Select co_id, '
      
        'Cast(concat(co_descricao,'#39' '#39', to_char(co_anocolecao, '#39'YYYY'#39'))as ' +
        'character varying(15))as nome'
      'from colecao'
      'order by co_descricao')
    Left = 784
    Top = 440
  end
  object dsBoxColecao: TDataSource
    DataSet = qyBoxColecao
    Left = 888
    Top = 440
  end
  object qyBoxEstilista: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select es_id, es_nome from cadastro_estilista order by es_nome;')
    Left = 40
    Top = 488
  end
  object dsBoxEstilista: TDataSource
    DataSet = qyBoxEstilista
    Left = 160
    Top = 488
  end
  object qyTroca: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select pti_idfichatecnica, pti_idusuariosolicitacao, pti_dtsolic' +
        'itacao, pti_idusuarioconfirmacao, fi_id, us_nome from producao_t' +
        'roca_item, ficha_tecnica, usuario'
      
        'where pti_idusuariosolicitacao = us_id and pti_idusuarioconfirma' +
        'cao = us_id and pti_idfichatecnica = fi_id;')
    Left = 240
    Top = 72
  end
  object qyEmpenho: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select emp_dtlanc, emp_hrlanc, emp_idordemcorte, emp_idusulanc, ' +
        'us_nome from controle_empenho, ordem_corte, usuario'
      'where emp_idordemcorte = oc_id and emp_idusulanc = us_id;')
    Left = 112
    Top = 72
  end
  object qyRealCortado: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select oci_dtlanc, oci_hrlanc, oci_codusulanc, oci_dtfinalizada,' +
        ' us_nome, oci_situacao_id, descricao from ordem_corte_itens_real' +
        ', usuario, ordem_corte_itens_situacao'
      'where oci_codusulanc = us_id and oci_situacao_id = id;')
    Left = 304
    Top = 72
  end
  object qyEmpenhoReal: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select emp_dtsaidaent, emp_hrsaidaent, emp_idususaidaent, us_nom' +
        'e from controle_empenho, ordem_corte, usuario'
      'where emp_idordemcorte = oc_id and emp_idususaidaent = us_id;')
    Left = 384
    Top = 72
  end
  object qyRealFinal: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select oci_dtfinalizada, oci_hrfinalizada, oci_idusualterou, oci' +
        '_idusufinalizou, us_nome, oci_situacao_id, descricao from ordem_' +
        'corte_itens_real, usuario, ordem_corte_itens_situacao'
      'where oci_idusualterou = us_id and oci_situacao_id = id;')
    Left = 456
    Top = 72
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
    Left = 800
    Top = 16
  end
  object tbProdutoAcabado: TFDTable
    IndexFieldNames = 'cad_id'
    Connection = Conexao
    TableName = 'produto_acabado'
    Left = 720
    Top = 16
  end
  object tbOrdemdeCorte: TFDTable
    IndexFieldNames = 'oc_id'
    MasterSource = dsOrdemdeCorte
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte'
    Left = 528
    Top = 72
  end
  object qyFichaTecnica: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select fi_situacao from ficha_tecnica, produto_acabado where fi_' +
        'idprodutoacabado = cad_id')
    Left = 712
    Top = 72
  end
  object qyOrdemIniciarCorte: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select oc_situacao from ordem_corte where oc_id = 8132')
    Left = 808
    Top = 72
  end
  object qyOrdemDeCorte: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from ordem_corte; ')
    Left = 904
    Top = 72
  end
  object qyGradeModificada: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      #9'(fti.fti_id) AS itemId,'
      #9'(ftq.fti_id) gradeId'
      #9'FROM ficha_tecnica_itens AS fti'
      
        #9'LEFT JOIN ficha_tecnica_qtdtamanho AS ftq ON fti.fti_cortecidoi' +
        'dgrade = ftq.fti_cortecidoidgrade'
      #9'AND ftq.fti_idfichatec = fti.fti_idfichatec'
      #9'WHERE fti.fti_idfichatec='#39'5234'#39' '
      '        AND fti.fti_tipo='#39'P'#39
      '        AND fti.fti_tecido='#39'A'#39
      '        AND fti.fti_status<>'#39'C'#39)
    Left = 32
    Top = 128
  end
  object qyLinha120: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT (TRUE) AS existe FROM ficha_tecnica_itens AS fti'
      #9'JOIN ficha_tecnica AS ft ON ft.fi_id = fti.fti_idfichatec'
      
        #9'JOIN produto_acabado AS pa ON pa.cad_id = ft.fi_idprodutoacabad' +
        'o'
      #9'JOIN tipo_tecido AS tt ON tt.tec_id = pa.cad_idtipotecido'
      #9'WHERE ('
      
        #9#9#9'(SELECT conf_idsubgrupotecjeans_cadprod FROM configuracao LIM' +
        'IT 1)=tt.tec_id OR'
      
        #9#9#9'(SELECT conf_idsubgrupotecsarja_cadprod FROM configuracao LIM' +
        'IT 1)=tt.tec_id'
      #9#9'  )'
      #9'AND fti.fti_status<>'#39'C'#39
      #9'AND fti.fti_idproduto=2296'
      #9'AND fti.fti_idgradetam=439'
      #9'And EXISTS ('
      
        #9#9'SELECT * FROM ficha_tecnica_itensfase AS ftf WHERE ftf.ftf_idi' +
        'temfichatecnica=fti.fti_id'
      #9#9'AND ftf.ftf_idfaseproducao=10'
      #9#9#9'   )'
      #9#9'AND fti.fti_idfichatec=5142'
      #9#9)
    Left = 112
    Top = 128
  end
  object qyFaseInformada: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from ficha_tecnica_itens where fti_idfichatec = '#39'5233'#39
      
        'and fti_status = '#39'N'#39' and fti_tecido = '#39'N'#39' and fti_id not in(sele' +
        'ct ftf_iditemfichatecnica from ficha_tecnica_itensfase);')
    Left = 192
    Top = 128
  end
  object qyFichaPrototipo: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from ficha_tecnica_prototipo where fp_idfichatec = 5229')
    Left = 288
    Top = 128
  end
  object qyCorGradeProt: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      #9'*'
      #9'FROM ficha_tecnica_itens, ficha_tecnica_prototipo'
      #9'WHERE fti_idfichatec = '#39'5231'#39
      #9'AND fp_idfichatec = '#39'5231'#39
      #9'AND fti_status='#39'N'#39
      #9'AND fti_tipo='#39'P'#39
      #9'AND fti_cortecidoidgrade = fp_cortecido'
      #9'AND'
      #9#9'('
      
        #9#9#9'fti_tam1=fp_tamanho OR fti_tam2=fp_tamanho OR fti_tam3=fp_tam' +
        'anho OR fti_tam4=fp_tamanho OR fti_tam5=fp_tamanho OR'
      
        #9#9' '#9'fti_tam6 =fp_tamanho OR fti_tam7=fp_tamanho OR fti_tam8=fp_t' +
        'amanho OR fti_tam9=fp_tamanho OR fti_tam10=fp_tamanho OR'
      
        #9#9#9'fti_tam11=fp_tamanho OR fti_tam12=fp_tamanho OR fti_tam13=fp_' +
        'tamanho OR fti_tam14=fp_tamanho OR fti_tam15=fp_tamanho'
      #9#9')')
    Left = 384
    Top = 128
  end
  object qyTecidoPrincipal: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'SELECT fti_cortecidoidgrade, count(fti_id) as qtdPrincipal FROM ' +
        'ficha_tecnica_itens'
      '      WHERE fti_idfichatec = '#39'5234'#39' AND'
      '      fti_tipo ='#39'P'#39' AND'
      '      fti_status='#39'N'#39
      '      GROUP BY fti_cortecidoidgrade')
    Left = 472
    Top = 128
  end
  object qyGradeFicha: TFDQuery
    Connection = Conexao
    Left = 560
    Top = 128
  end
  object qyFichaId: TFDQuery
    Connection = Conexao
    Left = 640
    Top = 128
  end
  object qyFichaSemGrade: TFDQuery
    Connection = Conexao
    Left = 712
    Top = 128
  end
  object qyRefArtigoCor: TFDQuery
    Connection = Conexao
    Left = 800
    Top = 128
  end
  object qyAviamentosPorFicha: TFDQuery
    Connection = Conexao
    Left = 904
    Top = 128
  end
  object qyEstoqueSemReservaProt: TFDQuery
    Connection = Conexao
    Left = 64
    Top = 184
  end
  object qyCortePorTipoFichaId: TFDQuery
    Connection = Conexao
    Left = 192
    Top = 184
  end
  object qyGEComOuSemProt: TFDQuery
    Connection = Conexao
    Left = 312
    Top = 184
  end
  object qyVerCorteReal: TFDQuery
    Connection = Conexao
    Left = 408
    Top = 184
  end
  object qyConsumoFaseGE: TFDQuery
    Connection = Conexao
    Left = 496
    Top = 184
  end
  object qyFichaFaseGE: TFDQuery
    Connection = Conexao
    Left = 592
    Top = 184
  end
  object qyDadosCorteById: TFDQuery
    Connection = Conexao
    Left = 688
    Top = 184
  end
  object qyCoresNoCorte: TFDQuery
    Connection = Conexao
    Left = 984
    Top = 16
  end
  object dsCoresNoCorte: TDataSource
    DataSet = qyCoresNoCorte
    Left = 1072
    Top = 16
  end
  object tbCorteCores: TFDTable
    IndexFieldNames = 'occ_id'
    Connection = Conexao
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte_cores'
    Left = 1000
    Top = 72
  end
  object dsProdutoAvancoProd: TDataSource
    DataSet = cdsProdSemEstoque
    Left = 1024
    Top = 128
  end
  object dsProdReposicao: TDataSource
    DataSet = cdsProdReposicao
    Left = 888
    Top = 184
  end
  object qyUserOrdem2: TFDQuery
    Connection = Conexao
    Left = 984
    Top = 184
  end
  object tbConfAvancoProducao: TFDTable
    IndexFieldNames = 'capr_id'
    MasterSource = dsConfAvancoProducao
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'confimacao_avanco_producao_referencia'
    Left = 1088
    Top = 184
  end
  object dsConfAvancoProducao: TDataSource
    Left = 1208
    Top = 184
  end
  object tbAvancoProducaoItens: TFDTable
    IndexFieldNames = 'capri_id'
    MasterSource = dsAvancoProducaoItens
    Connection = Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'confimacao_avanco_producao_referencia_itens'
    Left = 1176
    Top = 16
  end
  object dsAvancoProducaoItens: TDataSource
    Left = 1120
    Top = 64
  end
  object qyOldValue: TFDQuery
    Connection = Conexao
    Left = 1208
    Top = 128
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
    Left = 1128
    Top = 120
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
    Left = 792
    Top = 184
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
  object qyCodProdAcabadoFicha: TFDQuery
    Connection = Conexao
    Left = 64
    Top = 232
  end
  object qyStatusPrevisto: TFDQuery
    Connection = Conexao
    Left = 200
    Top = 232
  end
  object qyFichaIdCorte: TFDQuery
    Connection = Conexao
    Left = 312
    Top = 232
  end
  object qyOrdemPrototipo: TFDQuery
    Connection = Conexao
    Left = 424
    Top = 232
  end
  object qyGridPrevisto: TFDQuery
    Connection = Conexao
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
    Left = 536
    Top = 240
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
    Left = 648
    Top = 240
  end
  object qyPrevistoOciId: TFDQuery
    Connection = Conexao
    Left = 752
    Top = 240
  end
  object qyPrevistoQtdCortes: TFDQuery
    Connection = Conexao
    Left = 864
    Top = 240
  end
  object qyGerMediaPecas: TFDQuery
    Connection = Conexao
    Left = 976
    Top = 240
  end
  object qyItensFichaPrevisto: TFDQuery
    Connection = Conexao
    Left = 1096
    Top = 240
  end
  object tbOrdemCorteItensPrevisto: TFDTable
    IndexFieldNames = 'oci_id'
    Connection = Conexao
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte_itens_previsto'
    Left = 80
    Top = 296
  end
  object qyIdCorte: TFDQuery
    Connection = Conexao
    Left = 1208
    Top = 240
  end
  object tbOrdemCorteProtFase: TFDTable
    IndexFieldNames = 'ocpf_id'
    Connection = Conexao
    Transaction = FDTransaction1
    UpdateTransaction = FDTransaction1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'ordem_corte_prototipo_fase'
    Left = 320
    Top = 304
  end
  object dsOrdemCorteProtFase: TDataSource
    DataSet = tbOrdemCorteProtFase
    Left = 520
    Top = 304
  end
  object qyOrdemCorteProtFase: TFDQuery
    Connection = Conexao
    Left = 672
    Top = 304
  end
  object qyDefinirPrevistoGE: TFDQuery
    Connection = Conexao
    Left = 800
    Top = 304
  end
  object qyTemOrdPrototipo: TFDQuery
    Connection = Conexao
    Left = 912
    Top = 304
  end
  object qyChecaReserva: TFDQuery
    Connection = Conexao
    Left = 1080
    Top = 312
  end
  object qyCorPrevisto: TFDQuery
    Connection = Conexao
    Left = 1192
    Top = 320
  end
  object qyConsTamFicha: TFDQuery
    Connection = Conexao
    Left = 824
    Top = 368
  end
  object qyEditGradePrevisto: TFDQuery
    Connection = Conexao
    Left = 992
    Top = 368
  end
  object qyEditGradeCor: TFDQuery
    Connection = Conexao
    Left = 984
    Top = 440
  end
  object qyArtCancelados: TFDQuery
    Connection = Conexao
    Left = 40
    Top = 392
  end
  object dsArtCancelados: TDataSource
    DataSet = qyArtCancelados
    Left = 144
    Top = 392
  end
  object qyUsuario: TFDQuery
    Connection = Conexao
    Left = 232
    Top = 392
  end
  object qyRetirArtigo: TFDQuery
    Connection = Conexao
    Left = 1088
    Top = 440
  end
  object qyUsuArtNProgramado: TFDQuery
    Connection = Conexao
    Left = 552
    Top = 504
  end
  object qyMudancArtigo: TFDQuery
    Active = True
    Connection = Conexao
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
    Left = 696
    Top = 504
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
    Left = 800
    Top = 504
  end
  object qyTipoProduto: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT tp_id, tp_nome FROM tipo_produto ORDER BY tp_id')
    Left = 256
    Top = 512
  end
  object dsTipoProduto: TDataSource
    DataSet = qyTipoProduto
    Left = 360
    Top = 512
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
  object qyGradeTamanho: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'SELECT grt_id, grt_nome FROM grade_tamanho ORDER BY grt_id')
    Left = 408
    Top = 368
  end
  object dsGradeTamanho: TDataSource
    DataSet = qyGradeTamanho
    Left = 512
    Top = 368
  end
  object qySelecArtigo: TFDQuery
    Connection = Conexao
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
    Left = 1040
    Top = 504
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
  object dsSelecArtigo: TDataSource
    DataSet = qySelecArtigo
    Left = 1136
    Top = 504
  end
  object qyFotoProduto: TFDQuery
    Connection = Conexao
    Left = 512
    Top = 576
  end
  object qyFotoProduto2: TFDQuery
    Connection = Conexao
    Left = 608
    Top = 576
  end
  object qyEstilistaFicha: TFDQuery
    Connection = Conexao
    Left = 720
    Top = 568
  end
  object qyTemSolicTroca: TFDQuery
    Connection = Conexao
    Left = 848
    Top = 568
  end
  object qyEstoqueArtigo: TFDQuery
    Connection = Conexao
    Left = 960
    Top = 568
  end
  object qyDeletArtigo: TFDQuery
    Connection = Conexao
    Left = 1064
    Top = 568
  end
  object qySelecArtigoDel: TFDQuery
    Connection = Conexao
    Left = 1160
    Top = 568
  end
  object qyInserirTrocaItem: TFDQuery
    Connection = Conexao
    Left = 1088
    Top = 640
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
  object qyETecidoCorProd: TFDQuery
    Connection = Conexao
    Left = 968
    Top = 640
  end
  object qyDelItemReserva: TFDQuery
    Connection = Conexao
    Left = 1192
    Top = 640
  end
  object qyConsumoTroca: TFDQuery
    Connection = Conexao
    Left = 1184
    Top = 704
  end
  object qyEstoqueSemReserProt: TFDQuery
    Connection = Conexao
    Left = 1032
    Top = 720
  end
  object qyInserirTrocaItemReserva: TFDQuery
    Connection = Conexao
    Left = 864
    Top = 712
  end
  object qyEstoqueSemReserProt2: TFDQuery
    Connection = Conexao
    Left = 896
    Top = 792
  end
  object qyEstoqueComReserva: TFDQuery
    Connection = Conexao
    Left = 1152
    Top = 792
  end
  object qyEstoqueComReserva2: TFDQuery
    Connection = Conexao
    Left = 960
    Top = 856
  end
  object qyComparArtigo1: TFDQuery
    Connection = Conexao
    Left = 1104
    Top = 864
  end
  object qyComparArtigo2: TFDQuery
    Connection = Conexao
    Left = 1200
    Top = 888
  end
  object qyCorteOrdem: TFDQuery
    Connection = Conexao
    Left = 1016
    Top = 936
  end
  object qyCorteItensPrev: TFDQuery
    Connection = Conexao
    Left = 1120
    Top = 944
  end
  object qyTemEmpPrevisto: TFDQuery
    Connection = Conexao
    Left = 920
    Top = 968
  end
  object qyQuantidadeCorte: TFDQuery
    Connection = Conexao
    Left = 792
    Top = 904
  end
  object qyGradePecasCor: TFDQuery
    Connection = Conexao
    Left = 720
    Top = 816
  end
  object qyItensAviamentoFicha: TFDQuery
    Connection = Conexao
    Left = 624
    Top = 928
  end
  object qyFinalizaPrevisto: TFDQuery
    Connection = Conexao
    Left = 704
    Top = 704
  end
  object qyIniciadoRealCortado: TFDQuery
    Connection = Conexao
    Left = 752
    Top = 1008
  end
  object qyReabrirPrevisto: TFDQuery
    Connection = Conexao
    Left = 1032
    Top = 1016
  end
  object qyLimpaCampos: TFDQuery
    Connection = Conexao
    Left = 903
    Top = 1048
  end
  object qyPrevisto: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select oci_idocorte, oci_dtlanc, oci_hrlanc, oci_codusulanc, oci' +
        '_situacao_id, descricao, us_nome from ordem_corte_itens_previsto' +
        ', usuario, ordem_corte_itens_situacao'
      'where oci_codusulanc = us_id and oci_situacao_id = id;')
    Left = 176
    Top = 72
  end
end
