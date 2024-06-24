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
end
