unit UnitProdutoAcabado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TformProdutoAcabado = class(TForm)
    comboFiltro: TComboBox;
    labFiltrarPor: TLabel;
    labDadosConsulta: TLabel;
    editSearch: TEdit;
    labColecao: TLabel;
    comboColecao: TComboBox;
    butProdutoPesquisar: TSpeedButton;
    gridProdutoAcabado: TDBGrid;
    dateTimePicker1: TDateTimePicker;
    checkData: TCheckBox;
    procedure butProdutoPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
            qyProdutoAcabado.SQL.Add('    Cast(CASE WHEN ft.fi_complementar=TRUE THEN ''SIM'' ELSE ''NÃO'' END as character varying(5)) strComplementar,');
            qyProdutoAcabado.SQL.Add('    Cast(CASE WHEN ft.fi_aproveitamento=TRUE THEN ''SIM'' ELSE ''NÃO'' END as character varying(5)) strAproveitamento');
            qyProdutoAcabado.SQL.Add('  from produto_acabado as pa join ficha_tecnica as ft on ft.fi_idprodutoacabado = pa.cad_id');
            qyProdutoAcabado.SQL.Add('  where pa.cad_situacao=''A''');
            //qyProdutoAcabado.SQL.Add('  and ft.fi_situacao=''F'' or ft.fi_situacao=''Z''');
            if comboFiltro.Text = 'REFERENCIA' then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_idreferencia = :referencia');
                qyProdutoAcabado.ParamByName('referencia').AsString := editSearch.Text;
            end;
            if comboFiltro.Text = 'NUMERO DA FICHA' then
            begin
                qyProdutoAcabado.SQL.Add('and oc.oc_idfichatecnica = :fichatecnica');
                qyProdutoAcabado.ParamByName('fichatecnica').AsInteger := strtoint(editSearch.Text);
            end;
            if comboFiltro.Text = 'ORDEM DE CORTE' then
            begin
                qyProdutoAcabado.SQL.Add('and oc.oc_id = :ordemdecorte');
                qyProdutoAcabado.ParamByName('ordemdecorte').AsInteger := strtoint(editSearch.Text);
            end;
            if comboFiltro.Text = 'DESCRICAO REFERENCIA' then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_descricao = :descricao');
                qyProdutoAcabado.ParamByName('descricao').AsString := editSearch.Text;
            end;
            if comboColecao.ItemIndex <> -1 then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_idcolecao = :colecao');
                qyProdutoAcabado.ParamByName('colecao').AsString := comboColecao.Text;
            end;
            if checkData.Checked = true then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_dtcadastro = :dtcadastro');
                qyProdutoAcabado.ParamByName('dtcadastro').AsDate := dateTimePicker1.Date;
            end;

            qyProdutoAcabado.SQL.Add('order by ft.fi_id desc limit 15');
            qyProdutoAcabado.Open;
        end;
       // gridViewProdutoAcabado;
    end;
end;

procedure TformProdutoAcabado.FormCreate(Sender: TObject);
begin
   dateTimePicker1.Date := now;
end;

procedure TformProdutoAcabado.FormShow(Sender: TObject);
begin
    dmOrdemCorte.qyProdutoAcabado.Active := true;
    gridViewProdutoAcabado;
end;

procedure TformProdutoAcabado.gridViewProdutoAcabado;
begin
    gridProdutoAcabado.Columns[0].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[0].Title.Caption:='CÓDIGO';
    gridProdutoAcabado.Columns[0].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[1].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[1].Title.Caption:='REFERÊNCIA';
    gridProdutoAcabado.Columns[1].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[2].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[2].Title.Caption:='DESCRIÇÃO';
    gridProdutoAcabado.Columns[2].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[3].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[3].Title.Caption:='FICHA TÉCNICA';
    gridProdutoAcabado.Columns[3].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[4].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[4].Title.Caption:='COMPLEMENTAR';
    gridProdutoAcabado.Columns[4].Title.Font.Style:=[fsBold];
    gridProdutoAcabado.Columns[5].Title.Alignment:=taCenter;
    gridProdutoAcabado.Columns[5].Title.Caption:='APROVEITAMENTO';
    gridProdutoAcabado.Columns[5].Title.Font.Style:=[fsBold];
end;

end.
