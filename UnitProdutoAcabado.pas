unit UnitProdutoAcabado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TformProdutoAcabado = class(TForm)
    comboFiltro: TComboBox;
    labFiltrarPor: TLabel;
    labDadosConsulta: TLabel;
    editSearch: TEdit;
    labTipo: TLabel;
    comboTipo: TComboBox;
    labColecao: TLabel;
    comboColecao: TComboBox;
    butProdutoPesquisar: TSpeedButton;
    gridProdutoAcabado: TDBGrid;
    procedure butProdutoPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formProdutoAcabado: TformProdutoAcabado;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitPrincipal, UnitIniciarCorte;

procedure TformProdutoAcabado.butProdutoPesquisarClick(Sender: TObject);
begin
    begin
        With dmOrdemCorte do
        begin
            qyProdutoAcabado.Close;
            qyProdutoAcabado.SQL.Clear;
            qyProdutoAcabado.SQL.Add('SELECT');
            qyProdutoAcabado.SQL.Add('  pa.cad_id, ft.fi_complementar as isComplementar, ft.fi_aproveitamento as isAproveitamento,');
            qyProdutoAcabado.SQL.Add('  pa.cad_idreferencia, pa.cad_descricao, ft.fi_id as ficha_id,');
            qyProdutoAcabado.SQL.Add('    (Cast(CASE WHEN ft.fi_complementar=TRUE THEN ''SIM'' ELSE ''N�O'' END)) strComplementar,');
            qyProdutoAcabado.SQL.Add('    (Cast(CASE WHEN ft.fi_aproveitamento=TRUE THEN ''SIM'' ELSE ''N�O'' END)) strAproveitamento');
            qyProdutoAcabado.SQL.Add('  from produto_acabado as pa join ficha_tecnica as ft on ft.fi_idprodutoacabado = pa.cad_id');
            qyProdutoAcabado.SQL.Add('  where pa.cad_situacao=''A''');
            qyProdutoAcabado.SQL.Add('  order By ft.fi_id desc');
            qyProdutoAcabado.Open;

        end;
    end;
end;
procedure TformProdutoAcabado.FormShow(Sender: TObject);
begin
    dmOrdemCorte.qyProdutoAcabado.Active := true;
end;

end.
