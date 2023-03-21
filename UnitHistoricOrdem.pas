unit UnitHistoricOrdem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TformHistoricOrdem = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formHistoricOrdem: TformHistoricOrdem;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitIniciarCorte, UnitPrincipal, UnitProdutoAcabado;

procedure TformHistoricOrdem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

procedure TformHistoricOrdem.FormShow(Sender: TObject);

var
    treeHistoricOrdem: TTreeView;
    no, noprev: TTreeNode;
    noPai: TTreeNode;
    I: Integer;
begin
    treeHistoricOrdem := TTreeView.Create(Self);
    treeHistoricOrdem.Parent := formHistoricOrdem;
    treeHistoricOrdem.Align := alClient;
    noPai := treeHistoricOrdem.Items.Add(nil, 'ORDEM DE CORTE: ' + formPrincipal.gridOrdem.Fields[0].Value);
    begin
      noPai.Selected := false;
    end;
    no := treeHistoricOrdem.Items.AddChildFirst(noPai, 'ESTILISTA: ' + formPrincipal.gridOrdem.Fields[3].Value + '        REFERÊNCIA: '
    + formPrincipal.gridOrdem.Fields[8].Value);
    no := treeHistoricOrdem.Items.AddChild(noPai, 'DATA INICIO: ' + DateToStr(formPrincipal.gridOrdem.Fields[10].Value));
    no := treeHistoricOrdem.Items.AddChild(noPai, dmOrdemCorte.cdsOrdemHistorico.FieldByName('oc_dtgerada').AsString);
    no := treeHistoricOrdem.Items.AddChild(noPai, dmOrdemCorte.cdsOrdemHistorico.FieldByName('oc_hrgerada').AsString);
    noprev := treeHistoricOrdem.Items.AddChildFirst(no, dmOrdemCorte.cdsOrdemHistorico.FieldByName('oc_id').AsString);
end;

end.
