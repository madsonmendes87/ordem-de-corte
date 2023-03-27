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
    if(formPrincipal.gridOrdem.Fields[7].Value = 'Prot�tipo') then
    begin
        with dmOrdemCorte.qyOrdemHistorico do
        begin
            Close;
            SQL.Text := 'select oc_dtgerada from ordem_corte';
            SQL.Add('where oc_idfichatecnica = :ficha and oc_prototipo = true');
            ParamByName('ficha').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[4].Value);
            Open;
        end;
    end
    else
        with dmOrdemCorte.qyOrdemHistorico do
        begin
            Close;
            SQL.Text := 'select oc_dtgerada from ordem_corte';
            SQL.Add('where oc_idfichatecnica = :ficha and oc_prototipo = false');
            ParamByName('ficha').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[4].Value);
            Open;
        end;
    noPai := treeHistoricOrdem.Items.Add(nil, 'ORDEM DE CORTE: ' + formPrincipal.gridOrdem.Fields[0].Value);
    begin
      noPai.Selected := false;
    end;
    no := treeHistoricOrdem.Items.AddChildFirst(noPai, 'ESTILISTA: ' + formPrincipal.gridOrdem.Fields[3].Value + '        REFER�NCIA: '
    + formPrincipal.gridOrdem.Fields[8].Value);
    no := treeHistoricOrdem.Items.AddChild(noPai, 'DATA INICIO: ' + datetostr(dmOrdemCorte.qyOrdemHistorico.FieldByName('oc_dtgerada').Value));
    no := treeHistoricOrdem.Items.AddChild(noPai, 'CORTE PREVISTO');
    noprev := treeHistoricOrdem.Items.AddChildFirst(no, dmOrdemCorte.cdsOrdemHistorico.FieldByName('oc_id').AsString);
end;

end.
