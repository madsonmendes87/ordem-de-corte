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
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object butSairInicioCorte: TSpeedButton
    Left = 1128
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
  object labCodigo: TLabel
    Left = 35
    Top = 55
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
    Left = 146
    Top = 77
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
    Left = 166
    Top = 53
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
    Left = 286
    Top = 53
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
    Left = 406
    Top = 53
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
  object labOrdCorte: TLabel
    Left = 88
    Top = 159
    Width = 96
    Height = 13
    Caption = 'ORDEM DE CORTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labCortePrevisto: TLabel
    Left = 387
    Top = 159
    Width = 94
    Height = 13
    Caption = 'CORTE PREVISTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labRealCortado: TLabel
    Left = 667
    Top = 159
    Width = 85
    Height = 13
    Caption = 'REAL CORTADO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
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
  object editCodigo: TEdit
    Left = 35
    Top = 72
    Width = 105
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object editReferencia: TEdit
    Left = 166
    Top = 72
    Width = 105
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object editFicha: TEdit
    Left = 286
    Top = 72
    Width = 105
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object editDescReferencia: TEdit
    Left = 406
    Top = 72
    Width = 294
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object butEscolherCores: TButton
    Left = 1003
    Top = 74
    Width = 137
    Height = 25
    Action = acaoCores
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
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
    object acaoAbrirProdAcab: TAction
      Category = 'produtoacabado'
      Caption = 'acaoAbrirProdAcab'
      ShortCut = 113
      OnExecute = acaoAbrirProdAcabExecute
    end
  end
end
