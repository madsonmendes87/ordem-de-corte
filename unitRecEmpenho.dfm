object formRecEmpenho: TformRecEmpenho
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Receber Empenho'
  ClientHeight = 441
  ClientWidth = 1159
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object butSairRecEmpenho: TSpeedButton
    Left = 1128
    Top = 23
    Width = 23
    Height = 22
    Caption = 'X'
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = butSairRecEmpenhoClick
  end
  object labTipo: TLabel
    Left = 8
    Top = 31
    Width = 27
    Height = 15
    Caption = 'TIPO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labRef: TLabel
    Left = 176
    Top = 31
    Width = 20
    Height = 15
    Caption = 'REF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object panelCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1159
    Height = 25
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSilver
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object comboTipo: TComboBox
    Left = 8
    Top = 52
    Width = 145
    Height = 23
    TabOrder = 1
    Text = 'PRODUCAO'
    Items.Strings = (
      'PRODUCAO'
      'PROTOTIPO')
  end
  object editRef: TEdit
    Left = 176
    Top = 52
    Width = 121
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 2
    OnChange = editRefChange
    OnClick = editRefClick
  end
  object chkMarcarReferencia: TCheckBox
    Left = 321
    Top = 55
    Width = 152
    Height = 17
    Caption = 'Marcar Por Refer'#234'ncia'
    TabOrder = 3
    OnClick = chkMarcarReferenciaClick
  end
  object panelEscolher: TPanel
    Left = 490
    Top = 50
    Width = 113
    Height = 22
    Color = clNavy
    ParentBackground = False
    TabOrder = 4
    object butReceber: TSpeedButton
      Left = 1
      Top = 1
      Width = 111
      Height = 20
      Cursor = crHandPoint
      Hint = 'F1'
      Align = alClient
      Caption = 'RECEBER'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = butReceberClick
      ExplicitLeft = 56
      ExplicitTop = 0
      ExplicitWidth = 57
      ExplicitHeight = 22
    end
  end
  object gridRecEmpenho: TDBGrid
    Left = 8
    Top = 88
    Width = 1137
    Height = 346
    DataSource = dsRecEmpenho
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = gridRecEmpenhoDrawColumnCell
    OnKeyPress = gridRecEmpenhoKeyPress
  end
  object qyRecEmpenho: TFDQuery
    Connection = dmOrdemCorte.Conexao
    SQL.Strings = (
      'SELECT'
      #9'ce.emp_id,'
      #9'ce.emp_idestoque,'
      #9'ce.emp_codprocesso,'
      #9'ce.emp_idempenhoanterior,'
      #9'pa.cad_idreferencia,'
      #9'pa.cad_descricao,'
      #9'cp.cp_descricao,'
      
        #9'CAST(COALESCE(gc.grc_codexterno, '#39#39') ||'#39'    '#39' || TRIM(gc.grc_no' +
        'me) || '#39' ('#39' || TRIM(gc.grc_sigla) || '#39')'#39' AS character varying(18' +
        ')) AS grc_nome,'
      
        #9'CAST(TRIM(gt.grt_nome) || '#39' ('#39' || TRIM(gt.grt_sigla) || '#39')'#39' AS ' +
        'character varying(10)) AS grt_nome,'
      #9'e.es_numrolo,'
      #9'e.es_metragemrolo,'
      #9'ce.emp_consumo,'
      #9'cp.cp_un,'
      #9'fp.fa_nome,'
      #9'(false) AS selected_item,'
      '        ce.emp_eprototipo,'
      '        ce.emp_custo,'
      '        fp.fa_id'
      #9'FROM controle_empenho AS ce'
      #9'JOIN estoque AS e ON e.es_id = ce.emp_idestoque'
      #9'JOIN ficha_tecnica AS ft ON ft.fi_id = ce.emp_codprocesso'
      
        #9'JOIN ordem_corte AS oc ON oc.oc_id = ce.emp_idordemcorte AND oc' +
        '.oc_idfichatecnica=ft.fi_id'
      
        #9'JOIN produto_acabado AS pa ON pa.cad_id = ft.fi_idprodutoacabad' +
        'o'
      #9'JOIN cadastro_produto as cp ON cp.cp_id = e.es_codproduto'
      #9'JOIN grade_cor AS gc ON gc.grc_id = e.es_idgradecor'
      #9'JOIN grade_tamanho AS gt ON gt.grt_id = e.es_idgradetam'
      #9'JOIN fase_producao AS fp ON fp.fa_id = ce.emp_idfaseent'
      #9'WHERE'
      #9'1=1'
      #9'AND ce.emp_mod='#39'1'#39
      #9'AND ce.emp_tipo='#39'E'#39
      #9'AND ce.emp_situacao='#39'N'#39
      #9'ORDER BY'
      #9'ce.emp_codprocesso,'
      #9'oc.oc_ordem,'
      #9'cp.cp_descricao,'
      #9'gc.grc_nome,'
      #9'gt.grt_nome,'
      #9'ce.emp_consumo')
    Left = 872
    Top = 32
  end
  object dsRecEmpenho: TDataSource
    DataSet = cdsRecEmpenho
    Left = 976
    Top = 32
  end
  object qyReferencia: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 776
    Top = 32
  end
  object cdsRecEmpenho: TClientDataSet
    PersistDataPacket.Data = {
      D60100009619E0BD010000001800000012000000000003000000D60106656D70
      5F696404000100000000000D656D705F69646573746F71756504000100000000
      000F656D705F636F6470726F636573736F040001000000000015656D705F6964
      656D70656E686F616E746572696F7204000100000000000A7265666572656E63
      69610100490000000100055749445448020002000A000D64657363726963616F
      5F72656601004900000001000557494454480200020028000770726F6475746F
      010049000000010005574944544802000200280003636F720100490000000100
      0557494454480200020014000774616D616E686F010049000000010005574944
      544802000200140004726F6C6F01004900000001000557494454480200020014
      00086D6574726167656D080004000000000007636F6E73756D6F080004000000
      000007756E696461646501004900000001000557494454480200020003000466
      61736501004900000001000557494454480200020014000D73656C6563746564
      5F6974656D01004900000001000557494454480200020014000A6570726F746F
      7469706F010049000000010005574944544802000200140009656D705F637573
      746F08000400000000000566615F696404000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'emp_id'
        DataType = ftInteger
      end
      item
        Name = 'emp_idestoque'
        DataType = ftInteger
      end
      item
        Name = 'emp_codprocesso'
        DataType = ftInteger
      end
      item
        Name = 'emp_idempenhoanterior'
        DataType = ftInteger
      end
      item
        Name = 'referencia'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'descricao_ref'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'produto'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cor'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'tamanho'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'rolo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'metragem'
        DataType = ftFloat
      end
      item
        Name = 'consumo'
        DataType = ftFloat
      end
      item
        Name = 'unidade'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'fase'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'selected_item'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'eprototipo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'emp_custo'
        DataType = ftFloat
      end
      item
        Name = 'fa_id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1072
    Top = 32
    object cdsRecEmpenhoemp_id: TIntegerField
      FieldName = 'emp_id'
    end
    object cdsRecEmpenhoemp_idestoque: TIntegerField
      FieldName = 'emp_idestoque'
    end
    object cdsRecEmpenhoemp_codprocesso: TIntegerField
      FieldName = 'emp_codprocesso'
    end
    object cdsRecEmpenhoemp_idempenhoanterior: TIntegerField
      FieldName = 'emp_idempenhoanterior'
    end
    object cdsRecEmpenhoreferencia: TStringField
      FieldName = 'referencia'
      Size = 10
    end
    object cdsRecEmpenhodescricao_ref: TStringField
      DisplayWidth = 50
      FieldName = 'descricao_ref'
      Size = 40
    end
    object cdsRecEmpenhoproduto: TStringField
      DisplayWidth = 50
      FieldName = 'produto'
      Size = 40
    end
    object cdsRecEmpenhocor: TStringField
      DisplayWidth = 20
      FieldName = 'cor'
    end
    object cdsRecEmpenhotamanho: TStringField
      DisplayWidth = 20
      FieldName = 'tamanho'
    end
    object cdsRecEmpenhorolo: TStringField
      FieldName = 'rolo'
    end
    object cdsRecEmpenhometragem: TFloatField
      FieldName = 'metragem'
      DisplayFormat = ',#0.0000'
    end
    object cdsRecEmpenhoconsumo: TFloatField
      FieldName = 'consumo'
      DisplayFormat = ',#0.0000'
    end
    object cdsRecEmpenhounidade: TStringField
      FieldName = 'unidade'
      Size = 3
    end
    object cdsRecEmpenhofase: TStringField
      FieldName = 'fase'
    end
    object cdsRecEmpenhoselected_item: TStringField
      FieldName = 'selected_item'
    end
    object cdsRecEmpenhoeprototipo: TStringField
      FieldName = 'eprototipo'
    end
    object cdsRecEmpenhoemp_custo: TFloatField
      FieldName = 'emp_custo'
    end
    object cdsRecEmpenhofa_id: TIntegerField
      FieldName = 'fa_id'
    end
  end
  object botaoReceber: TActionList
    Left = 680
    Top = 40
    object atalhoReceber: TAction
      Category = 'receber'
      Caption = 'atalhoReceber'
      ShortCut = 112
      OnExecute = atalhoReceberExecute
    end
  end
  object qyUsuario: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 608
    Top = 40
  end
  object qyEmpCorte: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 608
    Top = 128
  end
  object qyContEmpenho: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 704
    Top = 128
  end
  object qyEstProducao: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 800
    Top = 128
  end
end
