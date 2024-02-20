object formOrdemCorteCores: TformOrdemCorteCores
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Ordem Corte Cores'
  ClientHeight = 520
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object butFecharCores: TSpeedButton
    Left = 604
    Top = 0
    Width = 19
    Height = 17
    Caption = 'X'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = butFecharCoresClick
  end
  object RadioGroup1: TRadioGroup
    Left = 2
    Top = 16
    Width = 605
    Height = 209
    Caption = 'CORES REFER'#202'NCIA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object RadioGroup2: TRadioGroup
    Left = 2
    Top = 264
    Width = 605
    Height = 209
    Caption = 'CORES NO CORTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object gridCoresReferencia: TDBGrid
    Left = 8
    Top = 40
    Width = 593
    Height = 177
    DataSource = dmOrdemCorte.dsOrdemCorteCores
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object gridCoresCorte: TDBGrid
    Left = 8
    Top = 288
    Width = 593
    Height = 177
    DataSource = dmOrdemCorte.dsCoresNoCorte
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object butAdd: TBitBtn
    Left = 2
    Top = 231
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = butAddClick
  end
  object butAddTodas: TBitBtn
    Left = 83
    Top = 231
    Width = 88
    Height = 25
    Caption = 'Adicionar Todas'
    TabOrder = 5
    OnClick = butAddTodasClick
  end
  object butRetirar: TBitBtn
    Left = 2
    Top = 487
    Width = 75
    Height = 25
    Caption = 'Retirar'
    TabOrder = 6
    OnClick = butRetirarClick
  end
  object butRetirarTodas: TBitBtn
    Left = 83
    Top = 487
    Width = 75
    Height = 25
    Caption = 'Retirar Todas'
    TabOrder = 7
    OnClick = butRetirarTodasClick
  end
end
