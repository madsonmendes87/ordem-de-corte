object formRefRealCortado: TformRefRealCortado
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ordens de Corte'
  ClientHeight = 378
  ClientWidth = 845
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object labTipoCorte: TLabel
    Left = 8
    Top = 16
    Width = 97
    Height = 15
    Caption = 'Por Tipo de Corte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labRefeDescricao: TLabel
    Left = 176
    Top = 16
    Width = 250
    Height = 15
    Caption = 'Refer'#234'ncia ou Descri'#231#227'o do Produto Acabado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object butOrdemPesquisar: TSpeedButton
    Left = 737
    Top = 37
    Width = 97
    Height = 23
    Caption = 'Consultar'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Layout = blGlyphRight
    ParentFont = False
    OnClick = butOrdemPesquisarClick
  end
  object comboTipoCorte: TComboBox
    Left = 8
    Top = 37
    Width = 145
    Height = 22
    Style = csOwnerDrawVariable
    ItemIndex = 0
    TabOrder = 0
    Text = 'TODOS'
    Items.Strings = (
      'TODOS'
      'PROTOTIPO'
      'PRODUCAO')
  end
  object editSearch: TEdit
    Left = 176
    Top = 37
    Width = 545
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
    OnKeyPress = editSearchKeyPress
  end
  object gridRefRealCortado: TDBGrid
    Left = 8
    Top = 80
    Width = 826
    Height = 290
    DataSource = dsRefRealCortado
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = gridRefRealCortadoDblClick
  end
  object qyRefRealCortado: TFDQuery
    Active = True
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'oc.oc_id,'
      
        #9'CAST(lpad(cast(oc.oc_ordem AS varchar), 3, '#39'0'#39') AS character va' +
        'rying(5))AS NumerodoCorte,'
      #9'--oc.oc_prototipo,'
      
        #9'CAST(CASE WHEN oc.oc_prototipo=true THEN '#39'PROTOTIPO'#39' ELSE '#39'PROD' +
        'U'#199#195'O'#39' END as character varying(15)) AS tipo,'
      #9'pa.cad_idreferencia as referencia,'
      #9'pa.cad_descricao as produto_acabado,'
      #9'oc.oc_dtgerada as data_gerada,'
      #9'ocs.os_nome as situacao,'
      #9'oc.oc_dtsolicitacao,'
      #9'oc.oc_dtprevisaofinalizacao,'
      #9'oc.oc_observacao'
      #9'FROM ordem_corte As oc'
      #9'JOIN produto_acabado As pa'
      #9'ON pa.cad_id = oc.oc_idcodprodutoacabado'
      #9'JOIN ordem_corte_situacao As ocs'
      #9'ON ocs.os_id = oc.oc_situacao'
      #9'WHERE oc.oc_situacao<>'#39'2'#39
      #9'ORDER BY oc.oc_id DESC LIMIT 23')
    Left = 608
    Top = 16
  end
  object dsRefRealCortado: TDataSource
    DataSet = qyRefRealCortado
    Left = 712
    Top = 16
  end
  object qyCodProdAcabado: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 520
    Top = 16
  end
  object qyObservacoes: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 408
    Top = 16
  end
  object qyIdFicha: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 272
    Top = 16
  end
end
