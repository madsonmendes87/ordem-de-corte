object formPrevisto: TformPrevisto
  Left = 0
  Top = 0
  Anchors = []
  BorderIcons = [biSystemMenu]
  Caption = 'Corte Previsto'
  ClientHeight = 405
  ClientWidth = 1190
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  OnMouseMove = FormMouseMove
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
    Width = 6
    Height = 21
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semilight'
    Font.Style = []
    ParentFont = False
  end
  object butEditGrade: TSpeedButton
    Left = -1
    Top = 103
    Width = 186
    Height = 26
    Caption = 'Editar Grade do Tecido'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
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
    ParentFont = False
    OnMouseMove = butEditGradeMouseMove
  end
  object butArtigos: TSpeedButton
    Left = 200
    Top = 103
    Width = 97
    Height = 26
    Caption = 'Artigos'
    Flat = True
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAD4FBA7
      BAFBABBFFF9FB6FF94AEFF4064EC4064EC94AEFF9FB6FFABBFFFA9BBFBC8D3FB
      FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7C8FF527B
      FF0E40F1002CDD0033ED003DFF003DFF003DFF002CDE002CDE003DFF003DFF00
      3DFF0035EF002CDD0D3EF0527BFFB8C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF124BFF003DFF0037F4002CDD0033EC003DFF003DFF003DFF002DDF002D
      DF003DFF003DFF003DFF0034ED002CDD0037F3003DFF134BFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF3665FF003DFF0039F7002CDD0033EA003DFF003DFF
      003DFF002DDF002EE0003DFF003DFF003DFF0034EC002CDD0038F6003DFF3A68
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6085FF003DFF003BFB002CDD00
      32E8003DFF003DFF003DFF002EE0002EE0003DFF003DFF003DFF0032EA002CDD
      003AF9003DFF6488FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90ABFF003D
      FF003DFF002EE00030E5003DFF003DFF003DFF002EE1002EE1003DFF003DFF00
      3DFF0031E6002DDE003DFE003DFF95AEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC1D0FF003DFF003DFF0031E7002EE1003DFF003DFF003DFF002FE2002F
      E2003DFF003DFF003DFF002FE30030E6003DFF003DFFC7D4FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFF1F4FF023FFF003DFF0035EE002CDE003DFF003DFF
      003DFF002FE3002FE3003DFF003DFF003DFF002DDF0034ED003DFF033EFFF5F7
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF265AFF003DFF0039F600
      2CDD003BFC003DFF003DFF0030E60030E6003DFF003DFF003CFE002CDD0038F4
      003DFF2B5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6288
      FF003DFF003CFE002DDF0039F6003DFF003DFF0031E80031E8003DFF003DFF00
      3AF8002DDE003CFD003DFF698DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFA3B9FF003DFF003DFF0032E80036F1003DFF003DFF0032EA0032
      EA003DFF003DFF0036F20030E7003DFF003DFFACC0FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFE6ECFF023FFF003DFF0037F30033EB003DFF
      003DFF0034EC0033EC003DFF003DFF0034ED0036F2003DFF043FFFEDF1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3D6BFF003DFF00
      3CFD0031E6003DFF003DFF0034EE0034EE003DFF003DFF0031E7003BFC003DFF
      4672FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF94AEFF003DFF003DFF0032E9003DFE003DFF0036F20036F2003DFF003DFF00
      32E9003DFF003DFF9DB4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF0F4FF1048FF003DFF0038F60039F7003DFF0038F50038
      F5003DFF003AF90038F4003DFF134BFFF2F5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D9CFF003DFF003DFF0037F4
      003DFF003AF8003AF8003DFF0038F4003DFE003DFF85A2FFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F4FF21
      55FF003DFF003AF9003DFF003BFC003BFC003DFF003AF9003DFF2558FFF3F6FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFDDE5FF3F62ED3D62EC3F62ED3E62EB3E62EB3F62ED3D62EC3F
      62EDDEE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF002CDD002CDD002CDD002CDD002C
      DD002CDD002CDD002CDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF889DEF889DEF
      889DEF889DEF889DEF889DEF889DEF889DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    PopupMenu = popupArtigos
    OnClick = butArtigosClick
    OnMouseMove = butArtigosMouseMove
  end
  object butEmpenho: TSpeedButton
    Left = 320
    Top = 103
    Width = 121
    Height = 26
    Caption = 'Empenho'
    Flat = True
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF3FFF3AAFFF2A2FF
      F2A2FFF2A2FFF2A2FFF2A2FFF2A2FFF2A2FFF2A2FFF2A2FFF2A2FFF2A2FFF2A2
      FFF3AAFFFDF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
      ACFFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FF
      E650FFE650FFE650FFE650FFF3ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF2A7FFE650FFE650FFE650FFE650FFE650FFE650D7C86DDECF
      74F6DF53FFE650FFE650FFE650FFE650FFE650FFF2A7FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650FFE650FFE650FFE650FFE650
      FFE650DFCF74CFE6EC3BC6DBD5D65EFFE650FFE650FFE650FFE650FFF2A7FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650FFE650FF
      E650FFE650FFE650FFE650F6DF533BC6DC00BEED1DBFD7D5D65EFFE650FFE650
      FFE650FFF2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
      A7FFE650FFE650FFE650FFE650FFE650FFE650FFE650D6D75D1FC0D600BEED1C
      C0D9D2D760FFE650FFE650FFF2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF2A7FFE650E6CB3FE6CB3FE6CB3FC5A728C5A728C5A728C5A7
      28A6A23D18B8D100BEED1CC0D9D2D760FFE650FFF2A7FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650E8CD40E8CD40E8CD40CDAF2D
      CDAF2DCDAF2DCDAF2DCDAF2DACA9411BBDD500BEED1BC0D9D2D760FFF2A7FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650FFE650FF
      E650FFE650FFE650FFE650FFE650FFE650FFE650FFE650D5D65E1EC0D600BEED
      1BC0D9D6E5ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
      A7FFE650D0B22FD0B22FD0B22F93700593700593700593700593700593700593
      70057A732112B3CF06BFEBC0D8C8FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF2A7FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE6
      50FFE650FFE650FFE650FFE650D4D65FBDD2B0DADADADDDCE3ECEAF9FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650E6CB3FE6CB3FE6CB3FC5A728
      C5A728C5A728C5A728C5A728C5A728E6CB3FFFE650FFE650EFDA5DDCD7CB7568
      CDD4CFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650E8CD40E8
      CD40E8CD40CDAF2DCDAF2DCDAF2DCDAF2DCDAF2DCDAF2DE8CD40FFE650FFE650
      FFE650E9DDAAD4CFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
      A7FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FF
      E650FFE650FFE650FFE650FFF2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF2A7FFE650D0B22FD0B22FD0B22F9370059370059370059370
      05937005937005937005937005D0B22FFFE650FFF2A7FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650FFE650FFE650FFE650FFE650
      FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFF2A7FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2A7FFE650FFE650FF
      E650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650
      FFE650FFF2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
      A7FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE650FF
      E650FFE650FFE650FFE650FFF2A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF3ACFFE650FFE650FFE650FFE650FFE650FFE650FFE650FFE6
      50FFE650FFE650FFE650FFE650FFE650FFE650FFF3ADFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDF2FFF4AFFFF3ADFFF3ADFFF3ADFFF3AD
      FFF3ADFFF3ADFFF3ADFFF3ADFFF3ADFFF3ADFFF3ADFFF3ADFFF4AFFFFDF3FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    PopupMenu = popupEmpenho
    OnClick = butEmpenhoClick
    OnMouseMove = butEmpenhoMouseMove
  end
  object butAcao: TSpeedButton
    Left = 455
    Top = 103
    Width = 98
    Height = 26
    Caption = 'A'#231#227'o'
    Flat = True
    Glyph.Data = {
      F6060000424DF606000000000000360000002800000018000000180000000100
      180000000000C0060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFDBF5FF7DDBFFBCEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFCCEEFF5CCBFF53C8FFB8E8FF40C1FF64CCFFA4E2FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFEFF9FFB0E1FFABDFFFABDFFFABDFFFABDFFFABDFFFABDF
      FFABDFFFABDFFFBFE7FFFFFFFF72CAFFC2E8FFDCF2FFFFFFFFEEF8FFD5EFFF4F
      BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75C3FFA6D9FFADDBFFADDBFFADDBFF
      ADDBFFADDBFFADDBFFADDBFFADDBFFC1E4FFDDF0FF5CB8FFD0EBFFA5D8FF50B2
      FF79C5FFF6FBFF53B5FFC0E4FFFFFFFFFFFFFFFFFFFFFFFFFF68B5FF67B4FF6B
      B6FF6BB6FF6BB6FF6BB6FF6BB6FF6BB6FF6BB6FF6BB6FF90C9FF9BCEFFA4D2FF
      FDFEFF5AA9FFB7AAFF5EA7FFF0F8FFD4EAFF68B4FFFFFFFFFFFFFFFFFFFFFFFF
      FF6BADFFFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFDEEDFF61A9FFD1E6FFABCBFF5897FF7FB1FFF6FAFF5AA4FFC2DEFFFFFFFF
      FFFFFFFFFFFFFFFFFF6EA6FFFFFFFFFFFFFFFFFFFFE2EDFFC5DBFFFFFFFFE2ED
      FFC5DBFFFFFFFFE2EDFFC5DBFF7EB0FFC7DCFFDFEBFFFFFFFFEFF5FFD8E7FF5C
      9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF719EFFFFFFFFFFFFFFFFFFFFD0DFFF
      A0BEFFFFFFFFCFDEFF9FBEFFFFFFFFD0DFFFA0BEFFD2E0FF709DFF6898FFC1D5
      FF578CFF77A2FFB0C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7497FFFFFFFFFF
      FFFFFFFFFFD1DCFFA2B9FFE8EEFF698DFF6C91FFC6D4FFD1DCFFA2B9FFFFFFFF
      FFFFFFE1E8FF91ADFFC6D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF778FFFFFFFFFFFFFFFFFFFFFD2DAFFA4B4FFC3CEFFA6B6FFD3DBFF97A9FFD2
      DAFFA4B4FFFFFFFFFFFFFFFFFFFFADBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF7A88FFFFFFFFFFFFFFFFFFFFB2B9FF8994FFF2F4FF818D
      FF6D7BFFE4E7FFD3D7FFA7AFFFFFFFFFFFFFFFFFFFFF7A88FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D80FFFFFFFFFFFFFFD6D7FF888AFF
      A7A9FFA8AAFFD4D5FFA9ABFFFFFFFFC2C3FF9699FFFEFEFFFFFFFFFFFFFF7D80
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF807AFFFFFFFFFF
      FFFFD6D4FF8A83FFA9A4FFADA8FFD5D2FFABA6FFDEDCFF8078FF9791FFB3AFFF
      FFFFFFFFFFFF807AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF8371FFFFFFFFFFFFFFFFFFFFB7ACFF9282FFFCFBFFD6D0FFADA1FFD1CAFF99
      8BFFBDB3FFA89BFFFFFFFFFFFFFF8371FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFF886BFFFFFFFFFFFFFFFFFFFFD7CDFFAF9CFFFFFFFFD7CD
      FFAF9CFFFEFEFFAA95FF8A6FFFF6F4FFFFFFFFFFFFFF886BFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B62FFFFFFFFFFFFFFFFFFFFEFEAFF
      E0D5FFFFFFFFEFEAFFE0D5FFFFFFFFEFEAFFE0D5FFFFFFFFFFFFFFFFFFFF8B62
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9161FFE6DAFFEB
      E2FFEBE2FFEBE2FFEBE2FFEBE2FFEBE2FFEBE2FFEBE2FFEBE2FFEBE2FFEBE2FF
      EBE2FFEBE2FF8752FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFDFCEFFA776FFA776FFA776FFA776FFA776FFA776FFA776FFA776FFA776FFA7
      76FFA776FFA776FFA776FFA776FFCBAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    PopupMenu = popupAcao
    OnClick = butAcaoClick
    OnMouseMove = butAcaoMouseMove
  end
  object panelCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1190
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
    Width = 162
    Height = 66
    Caption = 'Estado da Guia'
    TabOrder = 3
  end
  object popupArtigos: TPopupMenu
    Left = 840
    Top = 104
    object rocar1: TMenuItem
      Caption = 'Trocar(somente na ordem de corte)'
    end
    object Liberar1: TMenuItem
      Caption = '-'
    end
    object Retirar1: TMenuItem
      Caption = 'Liberar'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Verartigoscancelados1: TMenuItem
      Caption = 'Retirar'
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Verartigoscancelados2: TMenuItem
      Caption = 'Ver artigos cancelados'
    end
  end
  object popupEmpenho: TPopupMenu
    Left = 840
    Top = 160
    object Empenhar1: TMenuItem
      Caption = 'Empenhar'
    end
    object Informao1: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = 'Informa'#231#227'o'
    end
    object RetirarEmpenho1: TMenuItem
      Caption = '-'
    end
    object RetirarEmpenho2: TMenuItem
      Caption = 'Retirar Empenho'
    end
  end
  object popupAcao: TPopupMenu
    Left = 840
    Top = 224
    object Finalizar1: TMenuItem
      Caption = 'Finalizar'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Reabrir1: TMenuItem
      Caption = 'Reabrir'
    end
  end
end
