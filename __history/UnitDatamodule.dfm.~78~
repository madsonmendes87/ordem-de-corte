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
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object FDTransaction1: TFDTransaction
    Connection = Conexao
    Left = 96
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 280
    Top = 16
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 176
    Top = 16
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
  object tbOrdemCorteSobraSituacao: TFDTable
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
      '    oc.oc_id as NumerodoCorte,'
      
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
    Left = 368
    Top = 16
  end
  object tbEstilista: TFDTable
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
      
        'where pa.cad_situacao='#39'A'#39' and ft.fi_situacao in ('#39'F'#39', '#39'Z'#39') order' +
        ' By ft.fi_id desc limit 15;')
    Left = 528
    Top = 16
  end
  object dsProdutoAcabado: TDataSource
    DataSet = qyProdutoAcabado
    Left = 616
    Top = 16
  end
  object qyBoxColecao: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'Select co_id, '
      
        'Cast(concat(co_descricao,'#39' '#39', to_char(co_anocolecao, '#39'YYYY'#39'))as ' +
        'character varying(15))as nome'
      'from colecao'
      'order by co_descricao')
    Left = 752
    Top = 440
  end
  object dsBoxColecao: TDataSource
    DataSet = qyBoxColecao
    Left = 848
    Top = 440
  end
  object qyBoxEstilista: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      'select es_id, es_nome from cadastro_estilista order by es_nome;')
    Left = 88
    Top = 488
  end
  object dsBoxEstilista: TDataSource
    DataSet = qyBoxEstilista
    Left = 160
    Top = 488
  end
  object qyOrdemHistorico: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      
        'select oc_id, oc_usugerou, oc_dtgerada, oc_hrgerada, us_nome fro' +
        'm ordem_corte, usuario'
      'where oc_usugerou = us_id;')
    Left = 32
    Top = 72
  end
  object qyPrevisto: TFDQuery
    Active = True
    Connection = Conexao
    SQL.Strings = (
      
        'select oci_idocorte, oci_dtlanc, oci_hrlanc, oci_codusulanc, oci' +
        '_situacao_id, descricao, us_nome from ordem_corte_itens_previsto' +
        ', usuario, ordem_corte_itens_situacao'
      'where oci_codusulanc = us_id and oci_situacao_id = id;')
    Left = 176
    Top = 72
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
    Left = 712
    Top = 16
  end
  object tbOrdemdeCorte: TFDTable
    Active = True
    IndexFieldNames = 'oc_id'
    MasterSource = dsOrdemdeCorte
    Connection = Conexao
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
  object qyGradeFicha: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'SELECT'
      #9'COUNT(oftr.oftr_id) AS oftr_id'
      #9'FROM ordem_fabricacao_tamanhoreal AS oftr'
      #9'JOIN ordem_producao AS op ON op.op_id = oftr.oftr_idordproducao'
      #9'JOIN ordem_corte AS oc ON oc.oc_id = op.op_idordemcorte'
      #9'JOIN ficha_tecnica AS ft ON ft.fi_id = oc.oc_idfichatecnica'
      
        #9'WHERE ft.fi_id='#39'5230'#39' AND ft.fi_situacao<>'#39'C'#39' AND oc.oc_prototi' +
        'po = true')
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
end
