object dmProdAcabado: TdmProdAcabado
  Height = 480
  Width = 640
  object dsProdutoAcabado: TDataSource
    DataSet = qyProdutoAcabado
    Left = 184
    Top = 16
  end
  object qyProdutoAcabado: TFDQuery
    Connection = dmOrdemCorte.Conexao
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
    Left = 56
    Top = 16
  end
  object qyFichaTecnica: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      
        'select fi_situacao from ficha_tecnica, produto_acabado where fi_' +
        'idprodutoacabado = cad_id')
    Left = 320
    Top = 16
  end
  object tbProdutoAcabado: TFDTable
    IndexFieldNames = 'cad_id'
    Connection = dmOrdemCorte.Conexao
    TableName = 'produto_acabado'
    Left = 440
    Top = 16
  end
end
