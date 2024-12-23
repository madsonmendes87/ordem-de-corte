object dmHistoricOrdem: TdmHistoricOrdem
  Height = 446
  Width = 785
  object qyOrdemHistorico: TFDQuery
    Active = True
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select oc_id, oc_usugerou, oc_dtgerada, oc_hrgerada, us_nome fro' +
        'm ordem_corte, usuario'
      'where oc_usugerou = us_id;')
    Left = 72
    Top = 16
  end
  object qyPrevisto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select oci_idocorte, oci_dtlanc, oci_hrlanc, oci_codusulanc, oci' +
        '_situacao_id, descricao, us_nome from ordem_corte_itens_previsto' +
        ', usuario, ordem_corte_itens_situacao'
      'where oci_codusulanc = us_id and oci_situacao_id = id;')
    Left = 176
    Top = 16
  end
  object qyTroca: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select pti_idfichatecnica, pti_idusuariosolicitacao, pti_dtsolic' +
        'itacao, pti_idusuarioconfirmacao, fi_id, us_nome from producao_t' +
        'roca_item, ficha_tecnica, usuario'
      
        'where pti_idusuariosolicitacao = us_id and pti_idusuarioconfirma' +
        'cao = us_id and pti_idfichatecnica = fi_id;')
    Left = 256
    Top = 16
  end
  object qyEmpenho: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select emp_dtlanc, emp_hrlanc, emp_idordemcorte, emp_idusulanc, ' +
        'us_nome from controle_empenho, ordem_corte, usuario'
      'where emp_idordemcorte = oc_id and emp_idusulanc = us_id;')
    Left = 336
    Top = 16
  end
  object qyRealCortado: TFDQuery
    Active = True
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select oci_dtlanc, oci_hrlanc, oci_codusulanc, oci_dtfinalizada,' +
        ' us_nome, oci_situacao_id, descricao from ordem_corte_itens_real' +
        ', usuario, ordem_corte_itens_situacao'
      'where oci_codusulanc = us_id and oci_situacao_id = id;')
    Left = 432
    Top = 16
  end
  object qyEmpenhoReal: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select emp_dtsaidaent, emp_hrsaidaent, emp_idususaidaent, us_nom' +
        'e from controle_empenho, ordem_corte, usuario'
      'where emp_idordemcorte = oc_id and emp_idususaidaent = us_id;')
    Left = 64
    Top = 96
  end
  object qyRealFinal: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select oci_dtfinalizada, oci_hrfinalizada, oci_idusualterou, oci' +
        '_idusufinalizou, us_nome, oci_situacao_id, descricao from ordem_' +
        'corte_itens_real, usuario, ordem_corte_itens_situacao'
      'where oci_idusualterou = us_id and oci_situacao_id = id;')
    Left = 176
    Top = 96
  end
end
