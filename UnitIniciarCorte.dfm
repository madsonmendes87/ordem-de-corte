object formIniciarCorte: TformIniciarCorte
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Iniciar Corte'
  ClientHeight = 407
  ClientWidth = 1190
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object butSairInicioCorte: TSpeedButton
    Left = 1136
    Top = 24
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
    OnClick = butSairInicioCorteClick
  end
  object labNumOrd: TLabel
    Left = 32
    Top = 24
    Width = 177
    Height = 25
    Caption = 'N'#186' Ordem de Corte:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNumeroOrd: TLabel
    Left = 215
    Top = 31
    Width = 8
    Height = 25
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labTipoCorte: TLabel
    Left = 32
    Top = 55
    Width = 83
    Height = 13
    Caption = 'TIPO DE CORTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labPrototipo: TLabel
    Left = 192
    Top = 55
    Width = 61
    Height = 16
    Caption = 'Prot'#243'tipo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNumProt: TLabel
    Left = 218
    Top = 77
    Width = 5
    Height = 13
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labCodigo: TLabel
    Left = 296
    Top = 57
    Width = 44
    Height = 13
    Caption = 'C'#211'DIGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labF2: TLabel
    Left = 407
    Top = 79
    Width = 14
    Height = 16
    Caption = 'F2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labReferencia: TLabel
    Left = 427
    Top = 55
    Width = 67
    Height = 13
    Caption = 'REFER'#202'NCIA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labFicha: TLabel
    Left = 547
    Top = 55
    Width = 34
    Height = 13
    Caption = 'FICHA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labDescricao: TLabel
    Left = 667
    Top = 55
    Width = 64
    Height = 13
    Caption = 'DESCRI'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labSituacao: TLabel
    Left = 32
    Top = 109
    Width = 58
    Height = 13
    Caption = 'SITUA'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNormal: TLabel
    Left = 32
    Top = 128
    Width = 47
    Height = 13
    Caption = 'NORMAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labComplementar: TLabel
    Left = 119
    Top = 109
    Width = 90
    Height = 13
    Caption = 'COMPLEMENTAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNaoComp: TLabel
    Left = 119
    Top = 128
    Width = 23
    Height = 13
    Caption = 'NAO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labAproveitamento: TLabel
    Left = 239
    Top = 109
    Width = 102
    Height = 13
    Caption = 'APROVEITAMENTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labNaoAprov: TLabel
    Left = 239
    Top = 128
    Width = 23
    Height = 13
    Caption = 'NAO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object panelIniciarCorte: TPanel
    Left = 0
    Top = 0
    Width = 1190
    Height = 25
    Align = alTop
    Caption = 'Iniciar Corte'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object comboTipoCorte: TComboBox
    Left = 32
    Top = 74
    Width = 145
    Height = 21
    TabOrder = 1
    Items.Strings = (
      'PRODUCAO'
      'PROTOTIPO')
  end
  object editCodigo: TEdit
    Left = 296
    Top = 74
    Width = 105
    Height = 21
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 427
    Top = 74
    Width = 105
    Height = 21
    TabOrder = 3
  end
  object editFicha: TEdit
    Left = 547
    Top = 74
    Width = 105
    Height = 21
    TabOrder = 4
  end
  object editReferencia: TEdit
    Left = 667
    Top = 74
    Width = 294
    Height = 21
    TabOrder = 5
  end
  object butEscolherCores: TButton
    Left = 976
    Top = 72
    Width = 137
    Height = 25
    Action = acaoCores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object ActionList1: TActionList
    Left = 872
    Top = 32
    object acaoCores: TAction
      Category = 'cores'
      Caption = 'Escolher Cores (F6)'
      ShortCut = 117
      OnExecute = acaoCoresExecute
    end
  end
end
