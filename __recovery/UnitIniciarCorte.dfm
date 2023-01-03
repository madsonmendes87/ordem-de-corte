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
    Top = 40
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
    Top = 40
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
    Left = 224
    Top = 40
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
  object panelIniciarCorte: TPanel
    Left = 0
    Top = 0
    Width = 1190
    Height = 41
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
end
