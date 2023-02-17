unit UnitHistoricOrdem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TformHistoricOrdem = class(TForm)
    treeHistoricOrdem: TTreeView;
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
begin
    if(treeHistoricOrdem.Items.Count=0) then  {Testa se existe um Nó Principal}
    begin
        with treeHistoricOrdem.Items.AddFirst(nil, formPrincipal.gridOrdem.Fields[0].Value) do
        begin
            Selected := true;
        end;
        with treeHistoricOrdem.Items.AddChildFirst(treeHistoricOrdem.Selected, 'ESTILISTA: '+ formPrincipal.gridOrdem.Fields[3].Value + '    ' +
        'REFERÊNCIA: ' + formPrincipal.gridOrdem.Fields[8].Value) do
        begin
            Selected := false;
        end;
        with dmOrdemCorte.qyOrdemCorte do
        begin
            Close;
            SQL.Clear;
            treeHistoricOrdem.Items.AddChild(treeHistoricOrdem.Selected, 'Select oc_dtgerada from ordem_corte where oc_id = :ordemdecorte');
            ParamByName('ordemdecorte').AsString := formPrincipal.gridOrdem.Fields[0].Value;
            //Selected := false;
        end;
        with treeHistoricOrdem.Items.AddChild(treeHistoricOrdem.Selected, 'TESTE DE NÓ') do
        begin
            Selected := false;
        end;
    end;
end;

end.
