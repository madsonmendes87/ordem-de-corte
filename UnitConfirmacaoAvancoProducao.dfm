object formConfirmacaoAvancoProducao: TformConfirmacaoAvancoProducao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Confirma'#231#227'o de Avan'#231'o da Produ'#231#227'o'
  ClientHeight = 443
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 13
  object labDataReposicao: TLabel
    Left = 8
    Top = 5
    Width = 102
    Height = 13
    Caption = 'Data da reposi'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtReposicao: TDateTimePicker
    Left = 8
    Top = 24
    Width = 102
    Height = 21
    Date = 45153.000000000000000000
    Time = 0.352286319444829100
    TabOrder = 0
  end
  object gridProduto: TDBGrid
    Left = 8
    Top = 51
    Width = 866
    Height = 142
    Color = clCream
    DataSource = dmOrdemCorte.dsProdutoAvancoProd
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object gridProdutoReposicao: TDBGrid
    Left = 8
    Top = 245
    Width = 866
    Height = 142
    DataSource = dmOrdemCorte.dsProdReposicao
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object butDown: TBitBtn
    Left = 344
    Top = 199
    Width = 65
    Height = 40
    Glyph.Data = {
      360C0000424D360C000000000000360000002800000020000000200000000100
      180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFDFDFCD0B171CEAD68FCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFEFEFEDFCDA8D5A33BD6A43BDDC99DFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFEFE9DED0A142DAA53BDAA53BD1A23FEEE6D7FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC
      FBD2AD64DAA53CDAA53CDAA53CDAA53CD1AA5DFBFAF8FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDDC8
      9CDAA63DDBA63DDCA73CDCA73CDBA63DDAA63DDCC494FEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4D4D4A4
      40DCA73DDCA73DDDA83DDDA83DDCA73DDCA73DD5A43FECE2CFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9F6D2AB5BDDA8
      3EDDA83EDDA83EDDA83EDDA83EDDA83EDDA83EDDA83ED2AA57F9F7F4FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDBC28FDCA940DDA8
      3FDEA93FDEA93FDEA93FDEA93FDEA93FDEA93FDDA83FDDA940DAC08BFEFEFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9DEC9D8A641DEA940DEAA
      3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDEA940D7A640E9DEC6FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5F1D3A955DFAA40DFAA41E0AB
      40E0AB40E0AB40E0AB40E0AB40E0AB40E0AB40E0AB40DFAA41DFAA40D4A954F7
      F5F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED9BC84DFAB41E0AB41E0AB41E0AB
      41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41DFAB41D9
      BC81FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE7D9BEDBA941E0AB42E1AC42E1AC42E1AC
      42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E0AB42DB
      A941E8DABEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF4F1EBD6A950E1AC43E1AC42E2AD43E2AD43E2AD
      43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E1AC42E1
      AC43D6A950F5F2EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFEFEFED8B878E1AD43E2AD44E3AE43E3AE43E3AE43E3AE
      43E3AE43E3AE43E3AE43E3AE43E3AE43E3AE43E3AE43E3AE43E3AE43E3AE43E2
      AD44E1AD43D8B879FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEE4D3B2DEAC44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE
      44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3
      AE44E3AE44DEAC44E6D5B4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF1ECE2D8AA4DE3AE45E3AF45E4AF45E4AF45E4AF45E4AF45E4AF
      45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4
      AF45E3AF45E3AE45D9AB4EF3EFE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD9B978E4B047E4B046E4B046E4AF46E4AF46E5B046E5B046E5B0
      46E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B047E5
      B047E5B147E4B046E4B047DBBB7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF1E4CBECD7ADECD7ACECD7ACEFD9ABE5B147E5B046E5B046E5B0
      46E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B047EC
      C77CF2DAACF1DAABF2DAACF4E5C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFBFAF9E4B048E6B147E6B147E6B1
      47E6B147E6B147E6B147E6B147E6B147E6B147E6B147E6B147E6B147E6B248F2
      D9A9FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE4B149E7B248E7B248E7B2
      48E7B248E7B248E7B248E7B248E7B248E7B248E7B248E7B248E7B248E7B349F1
      D9A9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE5B24AE8B349E8B349E8B3
      49E8B349E8B349E8B349E8B349E8B349E8B349E8B349E8B349E8B349E7B34AF2
      DAA9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE6B34BE8B34AE8B34AE8B3
      4AE8B34AE8B34AE8B34AE8B34AE8B34AE8B34AE8B34AE8B34AE8B34AE8B44AF2
      DAAAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE6B34CE9B44AE9B44AE9B4
      4AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44AE9B54BF2
      DAAAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE7B44CEAB54BEAB54BEAB5
      4BEAB54BEAB54BEAB54BEAB54BEAB54BEAB54BEAB54BEAB54BEAB54BE9B54CF3
      DBAAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE8B54DEAB54CEAB54CEAB5
      4CEAB54CEAB54CEAB54CEAB54CEAB54CEAB54CEAB54CEAB54CEAB54CEAB64DF3
      DBABFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE8B54EEBB64DEBB64DEBB6
      4DEBB64DEBB64DEBB64DEBB64DEBB64DEBB64DEBB64DEBB64DEBB64DEBB74DF3
      DBABFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE9B64FECB74EECB74EECB7
      4EECB74EECB74EECB74EECB74EECB74EECB74EECB74EECB74EECB74EECB84EF4
      DCABFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAEAB750EDB84EEDB84EEDB8
      4EEDB84EEDB84EEDB84EEDB84EEDB84EEDB84EEDB84EEDB84EEDB84EECB84FF4
      DCABFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAEBB850EDB84FEDB84FEDB8
      4FEDB84FEDB84FEDB84FEDB84FEDB84FEDB84FEDB84FEDB84FEDB84FEDB950F4
      DCACFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAEBB851EEB950EEB950EEB9
      50EEB950EEB950EEB950EEB950EEB950EEB950EEB950EEB950EEB950EEBA51F5
      DCACFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFBECB952EFBA51EFBA52EFBA
      51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA52EEBA51F5
      DDAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF3D18CEFBB53EFBA52EFBA
      51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA51EFBA52F1C061F8
      EEDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 3
    OnClick = butDownClick
  end
  object butUP: TBitBtn
    Left = 415
    Top = 199
    Width = 65
    Height = 40
    Glyph.Data = {
      360C0000424D360C000000000000360000002800000020000000200000000100
      180000000000000C0000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED2B57BC7993AC6983AC698
      39C69839C69839C69839C69839C69839C69839C69839C69839C6983AC99F4BED
      E5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFBD5A33CDAA53BDAA53BDAA5
      3ADAA53ADAA53ADAA53ADAA53ADAA53ADAA53ADAA53ADAA53ADAA53BDAA63CE7
      D0A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAD9A63DDBA63BDBA63BDBA6
      3BDBA63BDBA63BDBA63BDBA63BDBA63CDBA63CDBA63CDBA63CDBA63CDBA73DEC
      D4A3FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAD9A63DDCA73CDCA73CDCA7
      3CDCA73CDCA73CDCA73CDCA73CDCA73CDCA73CDCA73CDCA73CDCA73CDCA83EEC
      D4A3FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADAA73EDDA83DDDA83DDDA8
      3DDDA83DDDA83DDDA83DDDA83DDDA83DDDA83DDDA83DDDA83DDDA83DDCA83FED
      D5A4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADBA83FDDA83EDDA83EDDA8
      3EDDA83EDDA83EDDA83EDDA83EDDA83EDDA83EDDA83EDDA83EDDA83EDDA940ED
      D5A4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADBA840DEA93FDEA93FDEA9
      3FDEA93FDEA93FDEA93FDEA93FDEA93FDEA93FDEA93FDEA93FDEA93FDEAA40ED
      D5A4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADCA941DFAA3FDFAA3FDFAA
      3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDFAA3FDFAB41EE
      D5A4FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADDAA41DFAA40DFAA40DFAA
      40DFAA40DFAA40DFAA40DFAA40DFAA40E0AB40E0AB40E0AB40E0AB40DFAB41EE
      D6A5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADDAA42E0AB41E0AB41E0AB
      41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41E0AB41E0AC42EE
      D6A5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADEAB43E1AC42E1AC42E1AC
      42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E1AC42E1AD42EF
      D6A6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFADFAC44E2AD42E2AD42E2AD
      42E2AD42E2AD42E2AD42E2AD42E2AD42E2AD42E2AD42E2AD42E2AD42E1AD43EF
      D7A6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE0AD44E2AD43E2AD43E2AD
      43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E2AD43E2AE44EF
      D7A6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFBFAF9E1AD45E3AE44E3AE44E3AE
      44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E3AE44E2AE44F0
      D8A7FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE5DCC8D8C9AAD7C8A8D7C8A8DFCDA8E2AF45E4AF45E4AF45E4AF
      45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E4AF45E3AE45E1
      BF7ADCCAA7DBCAA7DBCAA7E6DBC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE1BE79DEAC46DFAC45DFAC45DFAB45E4AF46E4AF46E4AF46E4AF
      46E4AF46E4AF46E4AF46E4AF46E4AF46E4AF46E4AF46E4AF46E4AF46E4AF46E1
      AD45DFAD45DFAD45DFAD46E3C17BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF6F0E3E5B24FE4AF47E4AF46E4AF46E4AF46E5B046E5B046E5B0
      46E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B046E5B046E4
      AF46E4AF46E4AF47E5B452F8F2E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEF2DEB4E5B147E6B148E6B147E6B147E6B147E6B147E6B1
      47E6B147E6B147E6B147E6B147E6B147E6B147E6B147E6B147E6B147E6B147E6
      B147E6B148E5B147F3DFB7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFEFEFEECC87EE6B248E7B249E7B248E7B248E7B248E7B2
      48E7B248E7B248E7B248E7B248E7B248E7B248E7B248E7B248E7B248E7B248E7
      B249E6B248ECC87FFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF8F4ECE8B858E7B249E7B249E7B249E7B249E7B2
      49E7B249E7B249E7B249E7B249E7B249E7B249E7B249E7B249E7B249E7B249E7
      B249E8B858F9F5ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4E3C2E7B34AE8B34AE8B349E8B349E8B3
      49E8B349E8B349E8B349E8B349E8B349E8B349E8B349E8B349E8B349E8B34AE7
      B34AF5E4C1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEFCD8BE8B44AE9B44BE9B44AE9B4
      4AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44AE9B44BE8B44AEF
      CD89FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF7F2EBBC60E9B44BE9B44CE9B4
      4BE9B44BE9B44BE9B44BE9B44BE9B44BE9B44BE9B44BE9B44CE9B44BEBBC5FFA
      F7F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E8CDE9B54EEAB54CEAB5
      4CEAB54CEAB54CEAB54CEAB54CEAB54CEAB54CEAB54CEAB54CE9B54DF6E8CBFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF2D499EAB64DEBB6
      4DEBB64CEBB64CEBB64CEBB64CEBB64CEBB64CEBB64DEAB64DF1D294FEFEFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAF7EDC169EBB6
      4DECB74EECB74DECB74DECB74DECB74DECB74EEBB64EEDC066FBF9F5FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6ECD8ECB9
      52ECB74FECB74EECB74EECB74EECB74EECB74FECB850F7EBD3FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF4DA
      A6ECB84FEDB84FEDB84FEDB84FEDB850ECB84FF4D7A0FEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
      FBEFC774EDB850EEB950EEB950EDB850EFC46FFCFBF9FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFF7F0E1EEBB57EEB951EEB951EEBB55F8EFDBFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFEFEFEF6E0B3EEBA51EEBA51F6DCA9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFEFDFDF3CE84F3CB7DFDFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    TabOrder = 4
    OnClick = butUPClick
  end
  object butSalvarFinalPrev: TBitBtn
    Left = 712
    Top = 391
    Width = 162
    Height = 45
    Caption = 'Salvar e Iniciar Corte Previsto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = butSalvarFinalPrevClick
  end
end
