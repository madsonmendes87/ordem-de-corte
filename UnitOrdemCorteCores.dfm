object formOrdemCorteCores: TformOrdemCorteCores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Ordem Corte Cores'
  ClientHeight = 496
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 8
    Width = 700
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
    Left = 0
    Top = 248
    Width = 700
    Height = 217
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
    Top = 24
    Width = 684
    Height = 185
    DataSource = dmOrdemCorte.dsOrdemCorteCores
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object gridCoresCorte: TDBGrid
    Left = 8
    Top = 264
    Width = 685
    Height = 193
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object butAdd: TBitBtn
    Left = 8
    Top = 215
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 4
    OnClick = butAddClick
  end
  object butAddTodas: TBitBtn
    Left = 89
    Top = 215
    Width = 88
    Height = 25
    Caption = 'Adicionar Todas'
    TabOrder = 5
  end
  object butRetirar: TBitBtn
    Left = 8
    Top = 463
    Width = 75
    Height = 25
    Caption = 'Retirar'
    TabOrder = 6
  end
  object butRetirarTodas: TBitBtn
    Left = 89
    Top = 463
    Width = 75
    Height = 25
    Caption = 'Retirar Todas'
    TabOrder = 7
  end
end
