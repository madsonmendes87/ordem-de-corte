object forMudancArtigo: TforMudancArtigo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Mudan'#231'a de Artigo'
  ClientHeight = 361
  ClientWidth = 692
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  TextHeight = 15
  object labMotivo: TLabel
    Left = 0
    Top = 279
    Width = 194
    Height = 15
    Caption = 'Informe aqui o motivo da mudan'#231'a'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object butEscolher: TSpeedButton
    Left = 0
    Top = 335
    Width = 81
    Height = 22
    Cursor = crHandPoint
    Caption = 'Escolher'
    Flat = True
    Glyph.Data = {
      42090000424D4209000000000000420000002800000018000000180000000100
      20000300000000090000130B0000130B000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0E1D922FFD4D4060000
      000000000000000000000000000000000000D7C7BB89D7C6BBD0000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0E2D412EFE0D7F6EEE0D87D0000
      0000000000000000000000000000D7C7BB8FD8C7BCFFD8C7BC8A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0E1D767EFE1D8FFEEE0D7CA0000
      00000000000000000000D7C6BC87D8C7BCFFD7C7BB8FFFFFFF01000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFE0D7C2EFE1D8FFEEE0D7FDF3DD
      D21700000000D7C6BC87D8C7BCFFD7C7BB8FFFFFFF0100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEDDD41EEEE0D7FDEFE1D8FFEFE1D8FFEEE0
      D85DD7C6BC87D8C7BCFFD7C7BB8FFFFFFF010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EEE1D679EFE1D8FFEFE1D8FFEFE1D8FFEADB
      D2D5D8C7BCFFD7C7BB8FFFFFFF01000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EFE0D8D4EFE1D8FFEFE1D8FFEFE1D8FFEEE0
      D7FFE8DAD1DBEFE0D965EEDDD41E000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF920652FF92047AFFFF
      00010000000000000000EEDED92FEFE1D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE1
      D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE1D7D5EEE1D88ADFDFDF08000000000000
      00000000000000000000000000000000000000000000FF92046EFF9305FFFF93
      0598FFFF000100000000EEE1D88BEFE1D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE1
      D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE0D8F4EFE0D821000000000000
      0000000000000000000000000000000000000000000000000000FF930585FF93
      05FFFF91064DFFFFFF02EFE0D7E3EFE1D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE1
      D8FFEFE1D8FFEFE1D8FFEEE1D8CCEEE1D76FF2E6DA1500000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF92
      0342FF8B000BEFE0D842EFE1D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE1D8FFEFE1
      D7D5EFE1D780F0E1DA2300000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF920594FF9305BBFF9305BBFF92
      056500000000EEE1D79BEFE1D8FFEFE1D8FFEFE0D7E4EEE1D88BEEDED92F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF920594FF9305BBFF9305BBFF92
      056500000000EEE0D66CEEE1D79CEFE0D842FFFFFF0200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF94
      034AFF89000D0000000000000000FF89000DFF94034AFFFF0001000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF93058EFF93
      05FFFF92034BFF920565FF920565FF92034BFF9305FFFF920592FFFF00010000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF930470FF9305FFFF93
      058E00000000FF9205BFFF9205BF00000000FF93058EFF9305FFFF93047B0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF920342FF9304700000
      000000000000FF9205BFFF9205BF0000000000000000FF930474FF9306530000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF920596FF930595000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
    OnClick = butEscolherClick
    OnMouseMove = butEscolherMouseMove
  end
  object butSalvar: TSpeedButton
    Left = 600
    Top = 336
    Width = 96
    Height = 22
    Cursor = crHandPoint
    Caption = 'Salvar'
    Flat = True
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
    OnClick = butSalvarClick
    OnMouseMove = butSalvarMouseMove
  end
  object labNovoArtigo: TLabel
    Left = 0
    Top = 223
    Width = 66
    Height = 15
    Caption = 'Novo artigo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labIdTam: TLabel
    Left = 288
    Top = 343
    Width = 48
    Height = 15
    Caption = 'labIdTam'
    Visible = False
  end
  object labIdCor: TLabel
    Left = 224
    Top = 343
    Width = 45
    Height = 15
    Caption = 'labIdCor'
    Visible = False
  end
  object gridMudancArtigo: TDBGrid
    Left = 0
    Top = 0
    Width = 692
    Height = 217
    Align = alTop
    DataSource = dmOrdemCorte.dsMudancArtigo
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = gridMudancArtigoDrawColumnCell
  end
  object editMotivo: TEdit
    Left = 0
    Top = 300
    Width = 696
    Height = 23
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object editCodigo: TEdit
    Left = 0
    Top = 244
    Width = 97
    Height = 23
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object editProduto: TEdit
    Left = 103
    Top = 244
    Width = 313
    Height = 23
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object editCor: TEdit
    Left = 422
    Top = 244
    Width = 147
    Height = 23
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
  end
  object ediTamanho: TEdit
    Left = 575
    Top = 244
    Width = 121
    Height = 23
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
  end
end
