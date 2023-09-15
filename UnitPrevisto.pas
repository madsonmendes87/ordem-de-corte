unit UnitPrevisto;

interface

uses
  System.RegularExpressions, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls;

type
  TformPrevisto = class(TForm)
    Panel1: TPanel;
    butSairPrevisto: TSpeedButton;
    radioCorte: TRadioGroup;
    labControleCorte: TLabel;
    labNumCorte: TLabel;
    labHifen: TLabel;
    labOrdem: TLabel;
    radioProdAcabado: TRadioGroup;
    radioEstadoGuia: TRadioGroup;
    labControleProdAcabado: TLabel;
    labReferencia: TLabel;
    labDescricao: TLabel;
    labCodProdAcabado: TLabel;
    labNumReferencia: TLabel;
    labNomeDescricao: TLabel;
    labSituacao: TLabel;
    labStatuSituacao: TLabel;
    procedure butSairPrevistoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrevisto: TformPrevisto;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule, UnitHistoricOrdem,
  UnitOrdemCorteCores, UnitConfirmacaoAvancoProducao, UnitVerificaVersao;

procedure TformPrevisto.butSairPrevistoClick(Sender: TObject);
begin
    formPrevisto.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible := true;
end;

end.
