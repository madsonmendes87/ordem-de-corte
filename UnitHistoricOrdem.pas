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
    if(treeHistoricOrdem.Items.Count=0) then  {Testa se existe um N� Principal}
    begin
        with treeHistoricOrdem.Items.AddFirst(nil, formPrincipal.gridOrdem.Fields[0].Value) do
        begin
            Selected := true;
        end;
        with treeHistoricOrdem.Items.AddChildFirst(treeHistoricOrdem.Selected, 'ESTILISTA: '+ formPrincipal.gridOrdem.Fields[3].Value + '    ' +
        'REFER�NCIA: ' + formPrincipal.gridOrdem.Fields[8].Value) do
        begin
            Selected := false;
        end;
        with treeHistoricOrdem.Items.AddChild(treeHistoricOrdem.Selected, 'DATA INICIO: '+ dateToStr(formPrincipal.gridOrdem.Fields[10].Value) + ' ' +
        dmOrdemCorte.tbOrdemCorte.FieldByName('oc_hrgerada').AsString) do
        begin
            Selected := false;
        end;
        with treeHistoricOrdem.Items.AddChild(treeHistoricOrdem.Selected, 'TESTE DE N�') do
        begin
            Selected := false;
        end;
    end;
end;

end.
