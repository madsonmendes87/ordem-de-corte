object formInfoReferencia: TformInfoReferencia
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Informa'#231#245'es Referencia'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object qyInfoReferencia: TFDQuery
    Connection = dmOrdemCorte.Conexao
    Left = 552
    Top = 16
  end
end
