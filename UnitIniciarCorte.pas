unit UnitIniciarCorte;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TformIniciarCorte = class(TForm)
    panelIniciarCorte: TPanel;
    butSairInicioCorte: TSpeedButton;
    labNumOrd: TLabel;
    labNumeroOrd: TLabel;
    labCodigo: TLabel;
    editCodigo: TEdit;
    labF2: TLabel;
    labReferencia: TLabel;
    editReferencia: TEdit;
    labFicha: TLabel;
    editFicha: TEdit;
    labDescricao: TLabel;
    editDescReferencia: TEdit;
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
    acaoAbrirProdAcab: TAction;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label1: TLabel;
    DataSource1: TDataSource;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit16: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    labTipoCorte: TLabel;
    butNovo: TBitBtn;
    butSalvar: TBitBtn;
    butRemover: TBitBtn;
    butEditar: TBitBtn;
    butDesistir: TBitBtn;
    Label18: TLabel;
    Label20: TLabel;
    DBEdit27: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit20: TDBEdit;
    procedure butSairInicioCorteClick(Sender: TObject);
    procedure acaoCoresExecute(Sender: TObject);
    procedure acaoAbrirProdAcabExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formIniciarCorte: TformIniciarCorte;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule;


procedure TformIniciarCorte.acaoAbrirProdAcabExecute(Sender: TObject);
begin
    formProdutoAcabado.ShowModal;
end;

procedure TformIniciarCorte.acaoCoresExecute(Sender: TObject);
begin
    ShowMessage('Teste de escolher cores');
end;

procedure TformIniciarCorte.butSairInicioCorteClick(Sender: TObject);
begin
    formIniciarCorte.Close;
    formPrincipal.butVerCorte.Enabled := true;
    formPrincipal.butCortePrevisto.Enabled := true;
    formPrincipal.butHistoricOrdem.Enabled := true;
end;



procedure TformIniciarCorte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Release;
    formIniciarCorte := nil;
end;

end.
