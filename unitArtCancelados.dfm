object formArtCancelados: TformArtCancelados
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ARTIGOS CANCELADOS'
  ClientHeight = 440
  ClientWidth = 807
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object gridArtCancelados: TDBGrid
    Left = 0
    Top = 0
    Width = 809
    Height = 441
    DataSource = dsArtCancelados
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object qyArtCancelados: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 592
    Top = 48
  end
  object dsArtCancelados: TDataSource
    DataSet = qyArtCancelados
    Left = 704
    Top = 40
  end
end
