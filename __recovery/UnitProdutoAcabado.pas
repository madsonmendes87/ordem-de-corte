unit UnitProdutoAcabado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.AppEvnts;

type
  TformProdutoAcabado = class(TForm)
    comboFiltro: TComboBox;
    labFiltrarPor: TLabel;
    labDadosConsulta: TLabel;
    editSearchPA: TEdit;
    labColecao: TLabel;
    butProdutoPesquisar: TSpeedButton;
    gridProdutoAcabado: TDBGrid;
    dtCadastro: TDateTimePicker;
    Label1: TLabel;
    dbLCBoxColecao: TDBLookupComboBox;
    butLimpaColecao: TButton;
    procedure butProdutoPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridProdutoAcabadoDblClick(Sender: TObject);
    procedure butLimpaColecaoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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


procedure TformProdutoAcabado.butLimpaColecaoClick(Sender: TObject);
begin
     dbLCBoxColecao.KeyValue := Null;
end;

procedure TformProdutoAcabado.butProdutoPesquisarClick(Sender: TObject);
var key: Char;
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
            qyProdutoAcabado.SQL.Add(' and ft.fi_situacao in (''F'', ''Z'')');
            if comboFiltro.Text = 'REFERENCIA' then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_idreferencia = :referencia');
                qyProdutoAcabado.ParamByName('referencia').AsString := editSearchPA.Text;
            end;
            if comboFiltro.Text = 'NUMERO DA FICHA' then
            begin
                qyProdutoAcabado.SQL.Add('and ft.fi_id = :fichatecnica');
                qyProdutoAcabado.ParamByName('fichatecnica').AsInteger := strtointdef(editSearchPA.Text,0);
            end;
            if comboFiltro.Text = 'DESCRICAO REFERENCIA' then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_descricao = :descricao');
                qyProdutoAcabado.ParamByName('descricao').AsString := editSearchPA.Text;
            end;
            if DBLCBoxColecao.KeyValue <> Null then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_idcolecao = :colecao');
                qyProdutoAcabado.ParamByName('colecao').AsInteger := DBLCBoxColecao.KeyValue;
            end;
            if DTCadastro.Checked = true then
            begin
                qyProdutoAcabado.SQL.Add('and pa.cad_dtcadastro = :dtcadastro');
                qyProdutoAcabado.ParamByName('dtcadastro').AsDate := DTCadastro.Date;
            end;
            qyProdutoAcabado.SQL.Add('order by ft.fi_id desc limit 15');
            qyProdutoAcabado.Open;
        end;
    end;
end;

procedure TformProdutoAcabado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin

     dmOrdemCorte.qyBoxColecao.active   := false;
     dmOrdemCorte.tbProdutoAcabado.Active := false;

end;

procedure TformProdutoAcabado.FormCreate(Sender: TObject);
begin
     dtCadastro.Date := now;
     dtCadastro.Checked := false;
end;

procedure TformProdutoAcabado.FormShow(Sender: TObject);
begin
    dmOrdemCorte.qyProdutoAcabado.Active := false;

    formPrincipal.BoxColecao;

end;

procedure TformProdutoAcabado.gridProdutoAcabadoDblClick(Sender: TObject);
begin
    formIniciarCorte.editCodigo.Text := gridProdutoAcabado.Fields[0].Value;
    formIniciarCorte.editReferencia.Text := gridProdutoAcabado.Fields[1].Value;
    formIniciarCorte.editFicha.Text := gridProdutoAcabado.Fields[3].Value;
    formIniciarCorte.editDescReferencia.Text := gridProdutoAcabado.Fields[2].Value;
    formProdutoAcabado.Close;
end;


end.
