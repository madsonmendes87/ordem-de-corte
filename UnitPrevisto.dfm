object formPrevisto: TformPrevisto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Corte Previsto'
  ClientHeight = 405
  ClientWidth = 1190
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object butSairPrevisto: TSpeedButton
    Left = 1128
    Top = 23
    Width = 23
    Height = 22
    Caption = 'X'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = butSairPrevistoClick
  end
  object labControleCorte: TLabel
    Left = 8
    Top = 48
    Width = 53
    Height = 14
    Caption = 'Controle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNumCorte: TLabel
    Left = 24
    Top = 67
    Width = 17
    Height = 20
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object labHifen: TLabel
    Left = 67
    Top = 67
    Width = 6
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object labOrdem: TLabel
    Left = 79
    Top = 67
    Width = 6
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object labControleProdAcabado: TLabel
    Left = 224
    Top = 48
    Width = 53
    Height = 14
    Caption = 'Controle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labReferencia: TLabel
    Left = 336
    Top = 48
    Width = 64
    Height = 14
    Caption = 'Refer'#234'ncia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labDescricao: TLabel
    Left = 472
    Top = 48
    Width = 57
    Height = 14
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labCodProdAcabado: TLabel
    Left = 224
    Top = 67
    Width = 6
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object labNumReferencia: TLabel
    Left = 336
    Top = 67
    Width = 6
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object labNomeDescricao: TLabel
    Left = 472
    Top = 67
    Width = 6
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object labSituacao: TLabel
    Left = 976
    Top = 48
    Width = 53
    Height = 14
    Caption = 'Situa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labStatuSituacao: TLabel
    Left = 976
    Top = 67
    Width = 14
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1190
    Height = 25
    Align = alTop
    Caption = 'Corte Previsto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object radioCorte: TRadioGroup
    Left = 0
    Top = 31
    Width = 185
    Height = 66
    Caption = 'Corte'
    TabOrder = 1
  end
  object radioProdAcabado: TRadioGroup
    Left = 200
    Top = 31
    Width = 729
    Height = 66
    Caption = 'Produto Acabado'
    TabOrder = 2
  end
  object radioEstadoGuia: TRadioGroup
    Left = 943
    Top = 31
    Width = 154
    Height = 66
    Caption = 'Estado da Guia'
    TabOrder = 3
  end
end
