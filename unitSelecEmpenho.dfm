object formSelecEmpenho: TformSelecEmpenho
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Selecionar Estoque'
  ClientHeight = 469
  ClientWidth = 865
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
  object labNomeCOD: TLabel
    Left = 8
    Top = 16
    Width = 34
    Height = 17
    Caption = 'COD:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labCOD: TLabel
    Left = 48
    Top = 16
    Width = 6
    Height = 17
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNomePROD: TLabel
    Left = 112
    Top = 16
    Width = 71
    Height = 17
    Caption = 'PRODUTO:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labPROD: TLabel
    Left = 189
    Top = 16
    Width = 6
    Height = 17
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNomeCOR: TLabel
    Left = 8
    Top = 39
    Width = 33
    Height = 17
    Caption = 'COR:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labCor: TLabel
    Left = 48
    Top = 39
    Width = 6
    Height = 17
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNomeLargura: TLabel
    Left = 8
    Top = 62
    Width = 67
    Height = 17
    Caption = 'LARGURA:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labLargura: TLabel
    Left = 81
    Top = 62
    Width = 6
    Height = 17
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNomeCoRef: TLabel
    Left = 8
    Top = 85
    Width = 62
    Height = 17
    Caption = 'COR REF:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labCoRef: TLabel
    Left = 81
    Top = 85
    Width = 6
    Height = 17
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNomeConsumo: TLabel
    Left = 8
    Top = 108
    Width = 77
    Height = 17
    Caption = 'CONSUMO:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labConsumo: TLabel
    Left = 93
    Top = 108
    Width = 6
    Height = 17
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI Historic'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labComprador: TLabel
    Left = 8
    Top = 143
    Width = 61
    Height = 16
    Caption = 'Comprador'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI Emoji'
    Font.Style = []
    ParentFont = False
  end
  object labFornecedor: TLabel
    Left = 197
    Top = 143
    Width = 60
    Height = 16
    Caption = 'Fornecedor'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI Emoji'
    Font.Style = []
    ParentFont = False
  end
  object panelFoto: TPanel
    Left = 510
    Top = 8
    Width = 350
    Height = 200
    Caption = 'Foto'
    TabOrder = 0
    object imagem: TImage
      Left = 1
      Top = 1
      Width = 348
      Height = 198
      Align = alClient
      Stretch = True
      ExplicitLeft = 73
      ExplicitTop = 0
      ExplicitWidth = 263
      ExplicitHeight = 159
    end
  end
  object dbLCBoxComprador: TDBLookupComboBox
    Left = 8
    Top = 164
    Width = 165
    Height = 23
    KeyField = 'comp_id'
    ListField = 'comp_nome'
    ListSource = dmPrincipal.dsBoxComprador
    TabOrder = 1
  end
  object butLimpaCompradores: TButton
    Left = 172
    Top = 164
    Width = 16
    Height = 23
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = butLimpaCompradoresClick
  end
  object chkMarcarTodas: TCheckBox
    Left = 385
    Top = 167
    Width = 112
    Height = 17
    Caption = 'Marcar Todas'
    TabOrder = 3
    OnClick = chkMarcarTodasClick
  end
  object dbLCBoxFornecedor: TDBLookupComboBox
    Left = 197
    Top = 165
    Width = 160
    Height = 23
    KeyField = 'for_codigo'
    ListField = 'for_apelido'
    ListSource = dmPrincipal.dsBoxFornecedor
    TabOrder = 4
  end
  object butLimpaFornecedores: TButton
    Left = 357
    Top = 164
    Width = 16
    Height = 23
    Caption = 'X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = butLimpaFornecedoresClick
  end
  object gridSelecEmpenho: TDBGrid
    Left = 8
    Top = 216
    Width = 852
    Height = 209
    DataSource = dmSelecEmpenho.dsTecido
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = gridSelecEmpenhoDrawColumnCell
    OnKeyPress = gridSelecEmpenhoKeyPress
  end
  object panelSelecionar: TPanel
    Left = 656
    Top = 431
    Width = 201
    Height = 34
    Color = clGreen
    ParentBackground = False
    TabOrder = 7
    object butSelecionar: TSpeedButton
      Left = 1
      Top = 1
      Width = 199
      Height = 32
      Align = alClient
      Caption = 'Selecionar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = butSelecionarClick
      ExplicitTop = 0
    end
  end
end
