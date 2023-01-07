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
    procedure gridViewProdutoAcabado;
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
            qyProdutoAcabado.SQL.Add('  pa.cad_id, pa.cad_idreferencia, pa.cad_descricao, ft.fi_id as ficha_id,');
            qyProdutoAcabado.SQL.Add('    Cast(CASE WHEN ft.fi_complementar=TRUE THEN ''SIM'' ELSE ''N�O'' END as character varying(5)) strComplementar,');
            qyProdutoAcabado.SQL.Add('    Cast(CASE WHEN ft.fi_aproveitamento=TRUE THEN ''SIM'' ELSE ''N�O'' END as character varying(5)) strAproveitamento');
            qyProdutoAcabado.SQL.Add('  from produto_acabado as pa join ficha_tecnica as ft on ft.fi_idprodutoacabado = pa.cad_id');
            qyProdutoAcabado.SQL.Add('  where pa.cad_situacao=''A''');
            qyProdutoAcabado.SQL.Add('  order By ft.fi_id desc limit 15');
            qyProdutoAcabado.Open;
        end;
        gridViewProdutoAcabado;
    end;
end;

procedure TformProdutoAcabado.FormShow(Sender: TObject);
begin
    dmOrdemCorte.qyProdutoAcabado.Active := true;
    gridViewProdutoAcabado;
end;

procedure TformProdutoAcabado.gridViewProdutoAcabado;
begin
    gridProdutoAcabado.Columns[0].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[0].Title.Caption:='C�DIGO';
    gridProdutoAcabado.Columns[0].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[1].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[1].Title.Caption:='REFER�NCIA';
    gridProdutoAcabado.Columns[1].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[2].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[2].Title.Caption:='DESCRI��O';
    gridProdutoAcabado.Columns[2].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[3].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[3].Title.Caption:='FICHA T�CNICA';
    gridProdutoAcabado.Columns[3].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[4].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[4].Title.Caption:='COMPLEMENTAR';
    gridProdutoAcabado.Columns[4].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[5].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[5].Title.Caption:='APROVEITAMENTO';
    gridProdutoAcabado.Columns[5].Title.Font.Style:=[fsBold];
end;

end.
