object formIniciarCorte: TformIniciarCorte
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Iniciar Corte'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
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
    Left = 27
    Top = 28
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
    Left = 30
    Top = 59
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
    Left = 141
    Top = 81
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
    Left = 161
    Top = 57
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
    Left = 281
    Top = 57
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
    Left = 401
    Top = 57
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
    Left = 27
    Top = 114
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
    Top = 133
    Width = 5
    Height = 13
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labComplementar: TLabel
    Left = 119
    Top = 114
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
    Left = 160
    Top = 133
    Width = 5
    Height = 13
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labAproveitamento: TLabel
    Left = 239
    Top = 114
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
    Left = 280
    Top = 133
    Width = 5
    Height = 13
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labOrdCorte: TLabel
    Left = 111
    Top = 173
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
    Left = 499
    Top = 177
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
    Left = 902
    Top = 177
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
  object Label1: TLabel
    Left = 85
    Top = 196
    Width = 148
    Height = 13
    Caption = 'Data e Hora de Solicita'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label14: TLabel
    Left = 61
    Top = 239
    Width = 201
    Height = 13
    Caption = 'Previs'#227'o Data e Hora de Finaliza'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel
    Left = 29
    Top = 285
    Width = 67
    Height = 13
    Caption = 'Observa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 493
    Top = 196
    Width = 100
    Height = 13
    Caption = 'Previs'#227'o de In'#237'cio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label17: TLabel
    Left = 454
    Top = 237
    Width = 201
    Height = 13
    Caption = 'Previs'#227'o Data e Hora de Finaliza'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labTipoCorte: TLabel
    Left = 760
    Top = 79
    Width = 5
    Height = 13
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label18: TLabel
    Left = 902
    Top = 239
    Width = 131
    Height = 13
    Caption = 'Previs'#227'o de Finaliza'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label20: TLabel
    Left = 910
    Top = 196
    Width = 100
    Height = 13
    Caption = 'Previs'#227'o de In'#237'cio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labTipoProducao: TLabel
    Left = 745
    Top = 56
    Width = 109
    Height = 13
    Caption = 'TIPO DE PRODU'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
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
    object Label2: TLabel
      Left = 280
      Top = 64
      Width = 161
      Height = 16
      Caption = 'oc_dtprevisaofinalizacao'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 280
      Top = 112
      Width = 99
      Height = 16
      Caption = 'oc_observacao'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 280
      Top = 160
      Width = 204
      Height = 16
      Caption = 'oc_datapreviniciocorteprevisto'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 280
      Top = 208
      Width = 191
      Height = 16
      Caption = 'oc_dataprevfimcorteprevisto'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 280
      Top = 256
      Width = 191
      Height = 16
      Caption = 'oc_datapreviniciorealcortado'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 280
      Top = 304
      Width = 178
      Height = 16
      Caption = 'oc_dataprevfimrealcortado'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 280
      Top = 352
      Width = 161
      Height = 16
      Caption = 'oc_hrprevisaofinalizacao'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 280
      Top = 400
      Width = 204
      Height = 16
      Caption = 'oc_horapreviniciocorteprevisto'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 280
      Top = 448
      Width = 191
      Height = 16
      Caption = 'oc_horaprevfimcorteprevisto'
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 280
      Top = 496
      Width = 191
      Height = 16
      Caption = 'oc_horapreviniciorealcortado'
      FocusControl = DBEdit11
    end
    object Label12: TLabel
      Left = 280
      Top = 544
      Width = 178
      Height = 16
      Caption = 'oc_horaprevfimrealcortado'
      FocusControl = DBEdit12
    end
    object Label13: TLabel
      Left = 280
      Top = 592
      Width = 121
      Height = 16
      Caption = 'oc_horasolicitacao'
      FocusControl = DBEdit13
    end
    object DBEdit1: TDBEdit
      Left = 280
      Top = 32
      Width = 134
      Height = 24
      DataField = 'oc_dtsolicitacao'
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 280
      Top = 80
      Width = 134
      Height = 24
      DataField = 'oc_dtprevisaofinalizacao'
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 280
      Top = 128
      Width = 459
      Height = 24
      DataField = 'oc_observacao'
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 280
      Top = 176
      Width = 134
      Height = 24
      DataField = 'oc_datapreviniciocorteprevisto'
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 280
      Top = 224
      Width = 134
      Height = 24
      DataField = 'oc_dataprevfimcorteprevisto'
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 280
      Top = 272
      Width = 134
      Height = 24
      DataField = 'oc_datapreviniciorealcortado'
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 280
      Top = 320
      Width = 134
      Height = 24
      DataField = 'oc_dataprevfimrealcortado'
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 280
      Top = 368
      Width = 134
      Height = 24
      DataField = 'oc_hrprevisaofinalizacao'
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 280
      Top = 416
      Width = 134
      Height = 24
      DataField = 'oc_horapreviniciocorteprevisto'
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 280
      Top = 464
      Width = 134
      Height = 24
      DataField = 'oc_horaprevfimcorteprevisto'
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 280
      Top = 512
      Width = 134
      Height = 24
      DataField = 'oc_horapreviniciorealcortado'
      TabOrder = 10
    end
    object DBEdit12: TDBEdit
      Left = 280
      Top = 560
      Width = 134
      Height = 24
      DataField = 'oc_horaprevfimrealcortado'
      TabOrder = 11
    end
    object DBEdit13: TDBEdit
      Left = 280
      Top = 608
      Width = 134
      Height = 24
      DataField = 'oc_horasolicitacao'
      TabOrder = 12
    end
  end
  object editCodigo: TEdit
    Left = 30
    Top = 76
    Width = 105
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object editReferencia: TEdit
    Left = 161
    Top = 76
    Width = 105
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object editFicha: TEdit
    Left = 281
    Top = 76
    Width = 105
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object editDescReferencia: TEdit
    Left = 401
    Top = 76
    Width = 294
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object butNovo: TBitBtn
    Left = 29
    Top = 354
    Width = 105
    Height = 41
    Caption = '&Nova'
    Glyph.Data = {
      42090000424D4209000000000000420000002800000018000000180000000100
      20000300000000090000120B0000120B000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000004A000000E3000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF00000091000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000E3000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF00000036000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF00000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF00000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00F8000000920000003700000000000000000000003600000091000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF0000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF0000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF0000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      000000000000000000000000000000000000000000E3000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000E2000000000000
      0000000000000000000000000000000000000000004B000000E4000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000E30000004A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    TabOrder = 6
    OnClick = butNovoClick
  end
  object butSalvar: TBitBtn
    Left = 152
    Top = 354
    Width = 105
    Height = 41
    Caption = '&Salvar'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF4646463D3D3D4141416B6B6BA5A5A5ADADADA9
      A9A9A8A8A8A6A6A6A4A4A4A2A2A2A0A0A09E9E9E9D9D9D9A9A9A9999999A9A9A
      9191916363633D3D3D353535414141FFFFFFFFFFFF4040409494944B4B4B8888
      88128BF3128BF3128BF3128BF3128BF3128BF3128BF3128BF3128BF3128BF312
      8BF3128BF3128BF3128BF37878787F7F7F505050343434FFFFFFFFFFFF454545
      AEAEAE99999985858525A5F725A5F725A5F725A5F725A5F725A5F725A5F725A5
      F725A5F725A5F725A5F725A5F725A5F725A5F7777777929292A4A4A4353535FF
      FFFFFFFFFF4747473E3E3E414141868686F0F0F0FFFFFFFFFFFFFDFDFDFAFAFA
      F6F6F6F3F3F3F0F0F0EEEEEEEAEAEAE7E7E7E4E4E4E7E7E7D5D5D57979793030
      30212121353535FFFFFFFFFFFF4A4A4A424242444444878787EFEFEFFFFFFFFF
      FFFFFFFFFFFEFEFEFBFBFBF8F8F8F5F5F5F3F3F3EFEFEFECECECE9E9E9ECECEC
      D9D9D9797979303030212121353535FFFFFFFFFFFF4D4D4D4747474747478787
      87EFEFEFCEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CE
      BDB5CEBDB5CEBDB5DEDEDE7B7B7B2F2F2F212121353535FFFFFFFFFFFF4F4F4F
      4C4C4C4B4B4B878787EFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFCFCFCF8F8F8F5F5F5F1F1F1F5F5F5E2E2E27D7D7D2F2F2F212121353535FF
      FFFFFFFFFF5353535151514E4E4E888888EFEFEFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAFAFAF6F6F6FBFBFBE6E6E67D7D7D2F2F
      2F212121353535FFFFFFFFFFFF575757575757515151898989EFEFEFCEBDB5CE
      BDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5CEBDB5
      ECECEC8080802F2F2F212121353535FFFFFFFFFFFF5959595B5B5B5555558B8B
      8BF0F0F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF0F0F08484842F2F2F212121353535FFFFFFFFFFFF5B5B5B
      606060595959888888E9E9E9FCFCFCF5F5F5F4F4F4F4F4F4F4F4F4F5F5F5F5F5
      F5F5F5F5F5F5F5F5F5F5F6F6F6FFFFFFEAEAEA808080313131222222353535FF
      FFFFFFFFFF5E5E5E6767676060606767678787878C8C8C888888868686848484
      8282828282828181818181818181817F7F7F8080808181817979794F4F4F3232
      32272727373737FFFFFFFFFFFF6262626B6B6B6A6A6A65656562626260606056
      56564E4E4E4A4A4A4747474545454242424040403D3D3D3A3A3A393939373737
      3737373737373434342D2D2D3A3A3AFFFFFFFFFFFF6868687070706A6A6A6464
      645E5E5E5A5A5A5B5B5B6060606161615C5C5C5959595555555353535353534F
      4F4F4848484242423B3B3B3838383838383333333D3D3DFFFFFFFFFFFF6F6F6F
      7373735454544747474848483E3E3E797979B9B9B9BFBFBFB1B1B1ADADADA8A8
      A8A4A4A4A1A1A19C9C9C9898988C8C8C6B6B6B4141413C3C3C383838404040FF
      FFFFFFFFFF7575757575754141412C2C2C303030202020909090FFFFFFFFFFFF
      F1F1F1ECECECEAEAEAD5D5D5B1B1B1B3B3B3CECECEC7C7C78D8D8D4848484040
      403D3D3D434343FFFFFFFFFFFF7A7A7A7A7A7A4444443030303434342525258E
      8E8EF7F7F7FAFAFAE7E7E7E3E3E3E6E6E6B9B9B95D5D5D707070BDBDBDC3C3C3
      8989894C4C4C444444414141464646FFFFFFFFFFFF7E7E7E7D7D7D4747473131
      313535352626268D8D8DF6F6F6FAFAFAE6E6E6E2E2E2E7E7E7B5B5B54A4A4A62
      6262BABABAC3C3C38B8B8B505050484848454545494949FFFFFFFFFFFF838383
      8282824848483131313434342727278E8E8EF5F5F5FAFAFAE6E6E6E2E2E2E6E6
      E6B6B6B6515151676767BABABAC2C2C28C8C8C5353534C4C4C4A4A4A4D4D4DFF
      FFFFFFFFFF8A8A8A8888884545452B2B2B2F2F2F212121919191FFFFFFFFFFFF
      F0F0F0ECECECEAEAEAD0D0D09B9B9BA2A2A2C9C9C9C6C6C69393935858585050
      504E4E4E797979FFFFFFFFFFFF8686868484845B5B5B4B4B4B4E4E4E45454585
      8585C5C5C5C7C7C7BABABAB6B6B6B3B3B3AEAEAEA5A5A5A2A2A2A3A3A39C9C9C
      8080805F5F5F5A5A5A797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 7
    OnClick = butSalvarClick
  end
  object butRemover: TBitBtn
    Left = 280
    Top = 354
    Width = 105
    Height = 41
    Caption = '&Remover'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFE0E0E0ABABABB8B8B8C6C6C6CECECECECECECACA
      CAC3C3C3BABABAB0B0B0AAAAAAE0E0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF919191EBEBEBFCFCFCF4F4F4
      ECECECE2E2E2DADADAD1D1D1CACACAC5C5C5C6C6C68B8B8BAEAEAEFEFEFEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCC0C0C0B3B3B3A8
      CEB23DB6633DBB6944C07497CAAC61C78B47C37842BE6F4DB770A2AEA6ACACAC
      959595B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6
      E6AEAEAEE0E0E04FB4683AB45C39B6613FBC6A91C3A35CC18241BE6E3DBA6740
      B3635CAE72D9D9D9A2A2A29F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBCBCBCCACACAC7D5CA44B15C69C280B0D9BCA6CFB3BACABFA6C3
      B06FBD8883BE954BB1672CA94ABCCBBFCACACA838383F9F9F9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF9F9F9A0A0A0D4D4D49CC6A330A74736AC50C7E3CD
      E3E9E4E2E2E2DADADAC9CFCBADC4B22DA94A27A5428ABE93D4D4D4858585BDBD
      BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFA8A8A8D5D5D596C59D2F
      A4412FA64543AF59E2E8E4E2E2E2DADADAD0D1D051AF6524A23D23A0398ABA91
      D5D5D59B9B9BA9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9B9B9
      B9D5D5D5C1D6C431A13F279F39A1D2A9EBEBEBE2E2E2D9D9D9D0D0D09ABDA038
      A2482F9F3EBBC3BCD5D5D5B3B3B3939393FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFABABABC8C8C8D8D8D8D1DDD2D0E3D2D5EBD8A5D2AA59B164DDE0DEB5CE
      B943A6513BA1488EB292A3BAA6C6C6C6D8D8D8C7C7C77E7E7EFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFF8F8F8A0A0A0D3D3D3DADADAE6E6E6F0F0F064B569108F1A
      11911D89BF8E8ABD8F12911E11901C309737BEC0BEC8C8C8D9D9D9D3D3D38888
      88F8F8F8FFFFFFFFFFFFFFFFFFFFFFFFECECECA5A5A5D6D6D6DCDCDCE6E6E6F2
      F2F2ACD6AE08880D0B8A111A902028962E0B8B120A8A1063A365ACBDACCCCCCC
      DADADAD6D6D69D9D9DECECECFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFB3B3B3D7D7
      D7DDDDDDE6E6E6F3F3F3FBFCFB4FA64F038304038305188C191A8C1B439A44BC
      BEBCC4C4C4CECECEDADADAD7D7D7B3B3B3DFDFDFFFFFFFFFFFFFFFFFFFFFFFFF
      D3D3D3BCBCBCDADADADDDDDDE5E5E5F4F4F4FCFCFCF0F2F0C9DCC9C6D6C6C3D1
      C3CACECAC8C8C8BFBFBFC5C5C5D1D1D1DBDBDBDADADABCBCBCD3D3D3FFFFFFFF
      FFFFFFFFFFFFFFFFC8C8C8C2C2C2DEDEDEDBDBDBE8E8E8E2EDE3ABD5B181C18D
      7BBC8959AC6D5AAB6F79B7897EB88C9BC2A4C8D3CAD8D8D8DBDBDBDEDEDEC2C2
      C2C8C8C8FFFFFFFFFFFFFFFFFFFFFFFFC1C1C1C9C9C9E9ECE98BBC9050A85A35
      9D455CAE695EAE6D5DAC6E50A4654EA36459A46C5AA36B57A068459856569D63
      94BD99E6EAE7C9C9C9C1C1C1FFFFFFFFFFFFFFFFFFFFFFFFC8C8C8C6D9C62F98
      364CA9545AAD6447A7556FB47A86B89089B3929EB2A395AA9B79A0836F9B7A56
      9665368F49549B5F5097582F8236BDCFBEC8C8C8FFFFFFFFFFFFFFFFFFFFFFFF
      D0D9D01C8F2151AA5769B66F9FC7A4D5DBD6DDDDDDD5D5D5CBCBCBC1C1C1B6B6
      B6ACACACA1A1A19898988F93906B8D7057975E4B935117731DC8D2C8FFFFFFFF
      FFFFFFFFFFFFFFFF76B3792B98318FC392E7E9E7DFDFDFE2E2E2E4E4E4DCDCDC
      D4D4D4CACACABFBFBFB5B5B5AAAAAAA1A1A199999995959593939382A7852F82
      34649A66FFFFFFFFFFFFFFFFFFFFFFFF439C4638953C5A935EEAEAEAE2E2E2E5
      E5E5E8E8E8E3E3E3DBDBDBD2D2D2C8C8C8BEBEBEB3B3B3A9A9A9A1A1A19B9B9B
      9797975A835E3E8242307C32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF428D450A64
      0F2A7931C2D1C4E6E6E6E9E9E9E6E6E6E0E0E0D8D8D8CFCFCFC5C5C5BABABAB0
      B0B0A7A7A78E9A90307139125C19356F37FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF4F8F42B772F0B68130E6E19227D30559B6184B68E99C0A2CFD7D1CCD0
      CC8CB49576A7824C915D267C38166E2614651F286A2EEFF3EFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66A16B10701B10741F127A2515802B
      1785301988341A8A371B8A371A8635197F3118772C176F275F9667FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F9F584
      B88C3F944F278A3B218A391988341A8A37248F3F2A8F4343975784B78FEFF5F0
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 8
  end
  object butEditar: TBitBtn
    Left = 406
    Top = 354
    Width = 105
    Height = 41
    Caption = '&Editar'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9EB
      DE248B3F1F883A98C8A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFEFEA5D2B4279E583AB37621974E62AD77FFFFFFE7F3EAFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFEFEFEA3D2B333AB6853CD9745BF85249A52359753
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFF7FCFAD9F1E635AE6D52CD9751
      CD9546C28829A15C349854FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6F3EA59AF772D9D57289E572AA25D33AB
      6939B4744AC68F48C58E48C58E45C18828A15F5DAD78FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBF5EE5EB17B28A05A3AB47547C388
      48C58C45C38A44C28944C28B40BE873FBD863FBC853DBB8441BE8728A3624EA6
      6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1F0E735A05D38B47447
      C58C42C1893EBC853DBB833CBA833BB98139B88038B77F38B67E37B57E36B47C
      34B27A37B57D199049FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F9F537A0
      5F3BB77A40BF8738B77F37B67E36B57D35B57C34B37B33B37A32B17931B07830
      AF772EAE752EAD752DAC7426A56B148943FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF7BBE922DA8663ABA8130B07831B1782FAF752BAA6F27A467219D5D209D
      5E209C5B29A97029A97027A76F28A86F1C995E12894397C9A9FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF27985233B2752AAB722AAB7223A1641B9651198E47
      27934F50A76F3C9E61148E4A23A46B22A36A21A26A1392541A8B458DC6A183BD
      97E1EFE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1891492BAC7223A56B1A965627
      935090C6A2F6FBF8FFFFFFFEFEFE9DCDAE108C481EA0671B9D640D8B4B298C4D
      FFFFFF70B489097D378AC29DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF138D461EA0
      6615935258AB75FFFFFFD3E7DA4297600978325EA7779BCBAB0C88441495580C
      854352A36EFFFFFF99CBA9198A4910884768B283FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF138A4313915242A063FEFEFEB5D7C01E85450D85490E8A4C36975CB5D8
      C01C864318834185BE98FFFFFFB6D9C223904F17925818915564B181FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF349858138642F3F9F592C5A30B7C39118F531C9861
      169155389A5EDFEEE4FFFFFFFFFFFFD0E7D853A770168C471C975C25A16A229C
      5E67B483FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9DAC576B98D68B1810C864218
      965C209E67229F681A965A1F8F4C4EA56D419F631C8D46158D461D975725A269
      27A56D2EAB7326A15E7BBE93FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF46A0
      67108B4A22A06728A66E27A56E28A76F25A2661F9959209A5B229D5F28A46A2C
      AA702FAD752FAD7533B27A37B3783AA464C5E2CEFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF1893522CAC742EAD752EAD752FAE7630AF7732B17933B27A33B3
      7A35B47C36B57D36B57D37B67E3BBA8240BF862DA76384C399FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF25A16139B98035B57D37B77F39B98039B980
      3ABA813BBB833CBC843DBD853EBE8541C18847C78E44C1862CA56078BE90FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF28995637B77A43C48B3F
      C08841C28941C28945C58D46C78E46C78D49CA904BCA9043C28432AE6B33A15D
      A2D1B2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9DC
      C4319E5B39B7794CCE954BCD944CCE9546C68A36B26F30AB6629A35B279E5638
      A25F99CDABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFA3D0B01B91453BB97951D49956D9A04ACB8E64C08CF1FB
      F7FDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4D0B0198F4136B37055D89E
      4BCC8F4EB174E0EFE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F8F4FEFEFEC2
      DFCA2F985132AE6B37B5734DAE73E1F0E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFDBECDF55A56A0A7D2874B685FDFEFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 9
  end
  object butDesistir: TBitBtn
    Left = 534
    Top = 354
    Width = 105
    Height = 41
    Caption = '&Desistir'
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFFD3D3F08687D94C51C8
      3039C43E4ECE3E4ECE3039C44C51C88687D9D3D3F0FDFDFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF46E6FD136
      44CD556EE27294F583A9FF82A7FE82A7FE83A9FF7294F5556EE23542CC6D6DD1
      DFDFF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB2B2
      E63D42C6536CE67293FA7396FB7090F96E8FF97090FA7090FA6E8FF97090F973
      96FB7192F9526BE43D42C6B9B9E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFAFAFE52D34C55874EF6483F8607FF55E7AF3526BE84253D83640CB3640
      CB4355D8526BE85F7BF46281F86483F85874EF3138C6B8B8E7FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFE3E3F6393DC55167ED546EF3556EF25671F3313FD13939BA
      AEAEE5D5D5F2D7D7F2B2B2E66767CC383FC8495FE75672F45670F45169ED393D
      C5E3E3F6FFFFFFFFFFFFFFFFFFF9F9FE6B6DD03D4DE04E64F15A73F14E65F04A
      60EF3E4FE24245C8D8D8F2FFFFFFFFFFFFFFFFFFFFFFFFD0D0EF5052C73B4BDE
      4D64F24D64F13D4DE06B6DD0F9F9FEFFFFFFFFFFFFD4D4F1262DC94255EF4D62
      EF7D98F75F77F23F52ED4456EF3949E52D30C0CBCBEEFFFFFFFFFFFFFFFFFFFF
      FFFFF2F2FB5152C83949E24355EF4356EF262DC9D4D4F1FFFFFFFFFFFF8686DA
      2D37D93A49EE4C60ED303AD0556BE65164F13848EC3A4AED313EE22C2DC0CECE
      F0FFFFFFFFFFFFFFFFFFFFFFFFD0D0F03035C83848EA3B4BEE2D37D98686DAFF
      FFFFFFFFFF474BCE2F3AE7313FEC2D37E13B3BC43B3FCB495AE64051ED2F3AEA
      313EED2B36E12D30C6CDCEF1FFFFFFFFFFFFFFFFFFFFFFFF6768D12C37E1313D
      EC2F3AE7474BCEFFFFFFFFFFFF2026CB2B34ED2A33E9252BD7B0B2E9D8D8F430
      36CC3642E4303AEA2831E82A33EA262EE23035CCCFD0F3FFFFFFFFFFFFFFFFFF
      B3B5EB262CD72A33E92B34ED2026CBFFFFFFFFFFFF2127D4252AE8242AE7272C
      D6D7D8F6FFFFFFCDCFF33037D1272FE2242BE8242AE6242AE82227E22B32D0CE
      D0F4FFFFFFFFFFFFD8D9F6272CD6242AE7252AE82127D4FFFFFFFFFFFF2027D7
      1E23E71E23E6262DD9D8DAF7FFFFFFFFFFFFCED0F42D34D61E23E21E23E61E23
      E61E23E61E23E03138D5CFD1F6FFFFFFD7D9F7262DD91E23E61E23E72027D7FF
      FFFFFFFFFF212AD91A1AE61A1BE62026DEB5B9F2FFFFFFFFFFFFFFFFFFD0D2F6
      333CDB1A1DE21A1AE51A1BE51A1BE51A1EE13139DADADCF9B3B7F21F26DE1A1B
      E5181AE6212AD9FFFFFFFFFFFF4B56E31A1CE41A1AE5171AE16F78E8FFFFFFFF
      FFFFFFFFFFFFFFFFCFD2F7313CDF171BE11616E21617E21617E4181AE23E48E1
      4652E1181AE11617E4171AE44B56E3FFFFFFFFFFFF8C93EF1B22E22224E61616
      E2303AE3D4D7FAFFFFFFFFFFFFFFFFFFFFFFFFD0D3F8323FE3161AE21414E214
      14E21414E2171AE21B23E11414E21A1AE51E26E28C93EFFFFFFFFFFFFFD7DBFA
      1E28E52A2FE72226E61517E25C68ECF3F4FEFFFFFFFFFFFFFFFFFFFFFFFFCFD3
      F93441E8161AE21414E21414E21414E21414E2171AE2262DE6242FE5D7DAFAFF
      FFFFFFFFFFFAFAFF747FF11E26E63B49EA2327E6161AE45B69F0D4D8FCFFFFFF
      FFFFFFFFFFFFFFFFFFDBDEFB4855EC171BE51414E21414E2171AE4313BE82A35
      E8737EF1FAFAFFFFFFFFFFFFFFFFFFFFE6E8FD3E4EF02A31E84D60ED2B33E716
      1AE53340EC7480F5B8BEFADADEFDD9DDFDB4BBF94A5BF11D27E81414E21C1FE5
      404DEA3845EA4150F0E6E8FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6BEFB2B39
      EF3440EA5F75EF495CED2227E61A1FE62028E82530ED2430ED1D25E81A1DE61B
      1EE53641E9566CED4051ED3445F0BEC4FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB9C0FC4051F4313EED5F75EE7B99F4637CF04B5FED3947E93743
      E9404EEB566CED728EF2657EF04154EE4254F5BFC6FCFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2E5FE7884FB2B3DF24054F05E75F1
      7C99F38AA9F788A8F5809DF46681F24D65F33147F37884FBE2E5FEFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFD8
      DCFF8E98FC5566FB354BF83346F43346F4364CF8576AFB8F9BFCD7DCFFFEFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 10
    OnClick = butDesistirClick
  end
  object dataSolicitacao: TDateTimePicker
    Left = 29
    Top = 215
    Width = 131
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    TabOrder = 11
  end
  object horaSolicitacao: TDateTimePicker
    Left = 166
    Top = 215
    Width = 91
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    Kind = dtkTime
    TabOrder = 12
  end
  object dataOrdemFinalizacao: TDateTimePicker
    Left = 27
    Top = 258
    Width = 133
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    TabOrder = 13
  end
  object horaOrdemFinalizacao: TDateTimePicker
    Left = 166
    Top = 258
    Width = 89
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    Kind = dtkTime
    TabOrder = 14
  end
  object dataCortePrevisto: TDateTimePicker
    Left = 429
    Top = 215
    Width = 131
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    TabOrder = 15
  end
  object horaCortePrevisto: TDateTimePicker
    Left = 568
    Top = 215
    Width = 91
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    Kind = dtkTime
    TabOrder = 16
  end
  object dataFinalCortePrevisto: TDateTimePicker
    Left = 429
    Top = 256
    Width = 131
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    TabOrder = 17
  end
  object horaFinalCortePrevisto: TDateTimePicker
    Left = 568
    Top = 256
    Width = 91
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    Kind = dtkTime
    TabOrder = 18
  end
  object dataRealCortado: TDateTimePicker
    Left = 853
    Top = 215
    Width = 131
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    TabOrder = 19
  end
  object horaRealCortado: TDateTimePicker
    Left = 990
    Top = 215
    Width = 91
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    Kind = dtkTime
    TabOrder = 20
  end
  object dataFinalRealCortado: TDateTimePicker
    Left = 853
    Top = 258
    Width = 131
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    TabOrder = 21
  end
  object horaFinalRealCortado: TDateTimePicker
    Left = 990
    Top = 258
    Width = 91
    Height = 21
    Date = 44942.000000000000000000
    Time = 0.308124120369029700
    Kind = dtkTime
    TabOrder = 22
  end
  object editObservacao: TEdit
    Left = 29
    Top = 304
    Width = 1052
    Height = 21
    TabOrder = 23
  end
  object butEscolherCores: TBitBtn
    Left = 902
    Top = 74
    Width = 139
    Height = 25
    Caption = 'Escolher Cores (F8)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = acaoCoresExecute
  end
  object ActionListIniCorte: TActionList
    Left = 640
    Top = 32
    object acaoCores: TAction
      Category = 'Cores'
      Caption = 'Escolher Cores(F6)'
      ShortCut = 119
      OnExecute = acaoCoresExecute
    end
  end
end
