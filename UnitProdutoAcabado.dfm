object formProdutoAcabado: TformProdutoAcabado
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produto Acabado'
  ClientHeight = 417
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labFiltrarPor: TLabel
    Left = 56
    Top = 16
    Width = 78
    Height = 13
    Caption = 'Filtrar pelo(a)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labDadosConsulta: TLabel
    Left = 224
    Top = 16
    Width = 115
    Height = 13
    Caption = 'Dados para consulta'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labColecao: TLabel
    Left = 447
    Top = 16
    Width = 103
    Height = 13
    Caption = 'Cole'#231#227'o deste ano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object butProdutoPesquisar: TSpeedButton
    Left = 200
    Top = 80
    Width = 97
    Height = 33
    Caption = 'Consultar'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      5A0B0000424D5A0B00000000000036000000280000001E0000001F0000000100
      180000000000240B0000C40E0000C40E00000000000000000000F3F2F2EBEAEA
      F4F3F3EBEBEBF3EEEEE8DCD7EACBC3E5B09FE39980E2896BE28566E06E46E068
      41E16840E16941E16941E16840E06941E1724DE3896BE28E71E4A18BE6B8AAE9
      D1CAEDE3E2EFECEBF0EFEFEFEFEFF2F1F1EEEDED0000E9E9E9F9F8F8E8E6E6F8
      F7F7EBEAEAF5F6F7EDF1F2F4FFFFEDFBFFE49C83DF6338E1673FE16840E16941
      E16941E16941E16941E16940E0643BE06B44E5AC99F0FFFFF5FCFFF0F4F5F1F2
      F2EEEFEFEFEFEFF2F0F0EEEDEDF4F3F30000F7F6F6E4E3E3FAFAFAE5E4E4F7F7
      F7E9EBEBF6FFFFE79A80DD4C1BE06339E16840E16941E16941E16941E16941E1
      6941E16941E16941E16941E0673FE05F34DE5225EAC4B7F5FFFFEEEDEEEEEDED
      F0F0F0EDEDEDF4F4F4EAE9E90000E7E6E6FDFDFDE3E1E1FBFBFBE8ECEEF5F8F6
      E05F34DF5E34E16941E16941E16941E16941E16941E16941E16941E16941E169
      41E16941E16941E16941E16941E16840DE5528E18161F2FFFFEFEFEFEFEEEEF3
      F3F3EBEBEBF5F5F50000FBFAFADEDEDEFFFFFFE2E5E7F8F5F3DD5122E0653DE1
      6941E16941E16941E16941E16941E16941E16941E16941E16941E16941E16941
      E16941E16941E16941E16941E16941E05F34E06C45EFFFFFF2F1F2EBECEBF7F6
      F6E9E8E80000E2E1E1FFFFFFDCDCDDFDFFFFDC5224E0673EE16941E16941E169
      41E16941E16941E16941E16941E16941E16941E16941E16941E16941E16941E1
      6941E0683FDF6137E16840E16941E06035E07955EFFFFFF5F4F4E8E7E7F8F8F8
      0000FFFFFFD9D8D8FFFFFFDB6A43E0643AE16941E16941E16941E16941E16941
      E16941E16941E16941E16941E16941E16941E16941E16941E16941E1673EDD5E
      33EAA48DDD6036E16840E16941DF592CE9AA94EDF7FAFAF8F8E6E5E50000E3E2
      E2FFFFFFDFB5A8E0582AE16941E16941E16941E16941E16941E16941E16941E1
      6941E16941E16941E16941E16941E16941E16941E1673EDA5427FBFCFDFFFFFF
      F1CCBEDE5B30E16941E16941DD4C1CF7F7F7E9EAEAF9F9F90000FDFDFDE5FCFF
      E05728E06840E16941E16941E16941E16941E16941E16941E16941E16941E169
      41E16941E16941E16941E16940E1673FDA5325FBF9F9FFFFFFFFFFFFE9A087DF
      6036E16941E16941E0643AE18161FBFFFFE8E7E70000E5EBEDF2C4B3DF592DE1
      6941E16941E16941E16941E16941E16941E16941E16840E0643ADF6036E06238
      E0663DE16941E16841DA5225F9F5F3FFFFFFFFFFFFEBBAA8DD5527E16941E169
      41E16941E16942DE4A19E8F6FBF8F8F80000FDFFFFDF7856E0653DE16940E169
      41E16941E16941E16941E16941DF5E33DC5A30E48565E89D84E69276E0734EDD
      5427DA4C1EF8EEEBFFFFFFFFFFFFEDC0B0DC5123E16941E16941E16941E16941
      E16941DF5E34EDB29FEAF0F20000ECFFFFDE4715E16A42E16941E16941E16941
      E16941E16942DD5426E49378FDFCFBFFFFFFFFFFFFFFFFFFFFFFFFF4D7CCE596
      7DFFFFFFFFFFFFF0C7B9DB5122E16941E16941E16941E16941E16941E16940E0
      653CE07957F8FFFF0000F4E7E3DE5425E16941E16941E16941E16941E16941DD
      5628EBB39FFFFFFFFFFFFFF0C4B5E69A80E9A58EF5E0D9FFFFFFFFFFFFFDF9F8
      EAAB95DD5528E16941E16941E16941E16941E16941E16941E16941E16941DD53
      26EEFFFF0000E8C7BAE05C2FE16941E16941E16941E16941E0653CE17753FFFF
      FFFEFFFFDC633BDD572BDF5E33DE5C30DC5527E8A38DFFFFFFF8F0EDD83F0DE1
      6A42E16941E16941E16941E16941E16941E16941E16941E16A42DD4614F8FFFF
      0000ECBAA7DF5F34E16941E16941E16941E16942DD5122F5E7E1FFFFFFDC653D
      E06239E16941E16941E16941E16941DC4F21EFC7B9FFFFFFE18464E0643BE169
      41E16941E16941E16941E16941E16941E16941E16A42DE4E1EEBEFF10000E7B6
      A3E06035E16941E16941E16941E16941D85022FFFFFFF4DED6DD4F20E16942E1
      6941E16941E16941E16940E0673EDD6941FFFFFFEEC0B0DF5C31E16941E16941
      E16941E16941E16941E16941E16941E16A42DD4F20F7F8F70000EFC7B9DF5C31
      E16941E16941E16941E0663DE0734EFFFFFFEBAE99DF5E34E16941E16941E169
      41E16941E16941E16A42D64110FFFFFFF7DFD7DD5528E16941E16941E16941E1
      6941E16941E16941E16941E16A43DE4715EBFDFF0000EADAD5DF5629E16941E1
      6941E16941E0673EDD6840FFFFFFEDB9A7DF5C31E16941E16941E16941E16941
      E16941E16941D84B1DFFFFFFF3D8CEDE572BE16941E16941E16941E16941E169
      41E16941E16941E16941DD4E1DF9FFFF0000F9FFFFDB4513E16A42E16941E169
      41E16A42D84616FFFFFFFCFFFFD94616E16A42E16941E16941E16941E16941E0
      6238E28667FFFFFFE9A993DF6035E16941E16941E16941E16941E16941E16941
      E16941E0653CE37956EEFCFF0000EBFEFFE2714CE0663DE16941E16941E16941
      DF5D32ECB7A6FFFFFFE8A58EDD5325E0673FE16840E06840E0633ADA4F21FCFD
      FDFFFFFFDC633AE0673EE16941E16941E16941E16941E16941E16941E16941E0
      6036E3A791F7FFFF0000FAFEFFE5B29FDF5D32E16941E16941E16941E16840DB
      5428FFFFFFFFFFFFE9AD99DE5F36DD5D31DE5D32DF6E49FAF5F3FFFFFFEBB6A3
      DE572BE16941E16941E16941E16941E16941E16941E16941E16942DC4A1AF8FB
      FAEBEBEC0000E9E8E9F9FFFFDD4D1EE16941E16941E16941E16941E0653CDE64
      3BFCFFFFFFFFFFFEFFFFF6E3DCF8ECE8FFFFFFFFFFFFF0C8BADC5022E16942E1
      6941E16941E16941E16941E16941E16941E16941E0653CE27D5AEFFFFFF4F3F3
      0000F5F4F4E9F4F7E9A993DF5C30E16941E16941E16941E16941E0653CDB582C
      EAAC97FCFCFBFEFFFFFEFFFFF5E1D9E48566DC5325E16942E16941E16941E169
      41E16941E16941E16941E16941E16942DD4C1CEBEAE9F4F5F6ECECEC0000EDED
      EDF4F4F4F0FFFFDC5D34E1673EE16941E16941E16941E16941E16840DF5D32DA
      5022DD6137DC5A2EDC5022E0643AE16941E16941E16941E16941E16941E16941
      E16941E16941E16941DF5C31E6987DF4FFFFEFEEEEF2F2F20000F3F1F1ECECEC
      F3F4F5F0F4F5DC4B1AE16941E16941E16941E16941E16941E16941E16941E168
      40E16840E16942E16941E16941E16941E16941E16941E16941E16941E16941E1
      6941E06339E16940F4FFFFEFEFEFF2F1F1EEEDED0000F0EFEFF1F1F1EFEEEEF1
      F7F9F1E4E0DC4B1AE16840E16941E16941E16941E16941E16941E16941E16941
      E16941E16941E16941E16941E16941E16941E16941E16941E16941E06238E060
      36F3F9FBF1F1F2F0EFEFF1F0F0F0EFEF0000EFEEEEF1F1F1EFEEEEF1F0F0F0F8
      FBF1E9E5DD5022E06339E16941E16941E16941E16941E16941E16941E16941E1
      6941E16941E16941E16941E16941E16941E16941DF5C2FE26F49F4FBFEEFF2F3
      F0EFEFF1F1F1EFEFEFF1F0F00000F1F1F1ECECECF2F1F1EDECECF2F1F1EFF1F3
      F3FFFFDE7857DE5526E0643BE16942E16941E16941E16941E16941E16941E169
      41E16941E16941E16941DF6137DE4E1EE6A38CF5FFFFEFEFF0EEEDEDF0F0F0EF
      EFEFF1F1F1EFEEEE0000ECEBEBF1F1F1EAEAEAF2F1F1ECEBEBF0EFEFEEEEEEF4
      FFFFECD2C9E47D5BDD4C1CDF5D32E06137E0643BE0653DE0653CE0643ADF6035
      E05B2FDC4C1DE9997EEBF4F6F2FDFFEEEDEDEFEDEDECEBEBEEEEEEEFEEEEEEED
      EDF0EFEF0000F4F3F3EBEAEAF4F4F4EBEAEAF4F3F3EEECECF2F1F1EFEFEFF1F4
      F5F0FFFFEEF8FCEBBAA9E39A82E5805EDE704BE57A56DC8161F1A68DE1C5BBF8
      FFFFEEF6F9F2F3F4EFEFEFF0F0F0EFEEEEEEEEEEF0EFEFF0EFEFF2F1F1EEEDED
      0000ECEBEBF6F6F6EAE8E8F5F5F5ECEBEBF3F2F2EEEDEDF1F1F1F1EFEFEFEEEE
      F0F1F1F1F5F7F3FDFFF0FDFFF5FFFFEFFDFFF7FFFFEBF3F6F6FAFCEBEAEAF4F3
      F3EDECECF2F1F1F0EFEFF0F0F0EEEEEEF0EFEFF1F1F1EEEEEEF2F2F20000}
    Layout = blGlyphRight
    ParentFont = False
    OnClick = butProdutoPesquisarClick
  end
  object Label1: TLabel
    Left = 56
    Top = 65
    Width = 83
    Height = 13
    Caption = 'Data de cadastro'
  end
  object comboFiltro: TComboBox
    Left = 56
    Top = 35
    Width = 162
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 1
    ParentFont = False
    TabOrder = 0
    Text = 'REFERENCIA'
    Items.Strings = (
      '<<  N'#227'o Informar >>'
      'REFERENCIA'
      'NUMERO DA FICHA'
      'DESCRICAO REFERENCIA')
  end
  object editSearchPA: TEdit
    Left = 224
    Top = 35
    Width = 201
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object gridProdutoAcabado: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 136
    Width = 700
    Height = 278
    Align = alBottom
    DataSource = dmOrdemCorte.dsProdutoAcabado
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridProdutoAcabadoDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'cad_id'
        Title.Alignment = taCenter
        Title.Caption = 'C'#243'digo'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cad_idreferencia'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Visible = True
      end
      item
        Color = 11664126
        Expanded = False
        FieldName = 'cad_descricao'
        Title.Alignment = taCenter
        Title.Caption = 'Descri'#231#227'o'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ficha_id'
        Title.Alignment = taCenter
        Title.Caption = 'Ficha T'#233'cnica'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'strcomplementar'
        Title.Alignment = taCenter
        Title.Caption = #201' Complementar'
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'straproveitamento'
        Title.Alignment = taCenter
        Title.Caption = 'De Aproveitamento'
        Width = 101
        Visible = True
      end>
  end
  object DTCadastro: TDateTimePicker
    Left = 56
    Top = 84
    Width = 121
    Height = 24
    Date = 44935.000000000000000000
    Time = 0.493591724538418900
    ShowCheckbox = True
    Checked = False
    TabOrder = 2
  end
  object DBLCBoxColecao: TDBLookupComboBox
    Left = 431
    Top = 35
    Width = 200
    Height = 21
    KeyField = 'co_id'
    ListField = 'nome'
    ListSource = dmOrdemCorte.DS_BoxColecao
    TabOrder = 4
  end
  object BtnLimpColecao: TButton
    Left = 632
    Top = 34
    Width = 16
    Height = 25
    Caption = 'I'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtnLimpColecaoClick
  end
  object ApplicationEvents1: TApplicationEvents
    Left = 488
    Top = 72
  end
end
