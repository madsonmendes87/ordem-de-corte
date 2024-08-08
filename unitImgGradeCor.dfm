object formImgGradeCor: TformImgGradeCor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Imagem Grade Cor'
  ClientHeight = 355
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClick = FormClick
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object imageGradeCor: TImage
    Left = 0
    Top = 0
    Width = 503
    Height = 329
    Stretch = True
  end
  object labFoto1: TLabel
    Left = 201
    Top = 335
    Width = 16
    Height = 17
    Cursor = crHandPoint
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = labFoto1Click
  end
  object labFoto2: TLabel
    Left = 241
    Top = 335
    Width = 8
    Height = 17
    Cursor = crHandPoint
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = labFoto2Click
  end
  object labFoto3: TLabel
    Left = 281
    Top = 335
    Width = 8
    Height = 17
    Cursor = crHandPoint
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = labFoto3Click
  end
  object qyFoto: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 464
    Top = 16
  end
end
