unit UnitIniciarCorte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TformIniciarCorte = class(TForm)
    panelIniciarCorte: TPanel;
    butSairInicioCorte: TSpeedButton;
    labNumOrd: TLabel;
    labNumeroOrd: TLabel;
    labTipoCorte: TLabel;
    comboTipoCorte: TComboBox;
    labPrototipo: TLabel;
    labNumProt: TLabel;
    labCodigo: TLabel;
    editCodigo: TEdit;
    labF2: TLabel;
    labReferencia: TLabel;
    Edit1: TEdit;
    labFicha: TLabel;
    editFicha: TEdit;
    labDescricao: TLabel;
    editReferencia: TEdit;
    ActionList1: TActionList;
    acaoCores: TAction;
    butEscolherCores: TButton;
    labSituacao: TLabel;
    labNormal: TLabel;
    labComplementar: TLabel;
    labNaoComp: TLabel;
    labAproveitamento: TLabel;
    labNaoAprov: TLabel;
    labOrdCorte: TLabel;
    labCortePrevisto: TLabel;
    labRealCortado: TLabel;
    procedure butSairInicioCorteClick(Sender: TObject);
    procedure acaoCoresExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formIniciarCorte: TformIniciarCorte;

implementation

{$R *.dfm}


procedure TformIniciarCorte.acaoCoresExecute(Sender: TObject);
begin
    ShowMessage('Escolher cores');
end;

procedure TformIniciarCorte.butSairInicioCorteClick(Sender: TObject);
begin
    formIniciarCorte.Close;
end;

end.
