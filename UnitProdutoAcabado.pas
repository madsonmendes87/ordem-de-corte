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
    butLimpaTiProduto: TButton;
    labMosColPacabado: TLabel;
    procedure butProdutoPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridProdutoAcabadoDblClick(Sender: TObject);
    procedure butLimpaTiProdutoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure labMosColPacabadoClick(Sender: TObject);
    procedure editSearchPAKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  formProdutoAcabado: TformProdutoAcabado;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitPrincipal, UnitIniciarCorte, UnitDMHistoricOrdem,
  UnitHistoricOrdem, UnitOrdemCorteCores, unitDMPrincipal,
  unitDMProdAcabado;


procedure TformProdutoAcabado.butLimpaTiProdutoClick(Sender: TObject);
begin
     dbLCBoxColecao.KeyValue :=Null;
end;

procedure TformProdutoAcabado.butProdutoPesquisarClick(Sender: TObject);
var key: Char;
begin
      begin
        With dmProdAcabado.qyProdutoAcabado do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('  pa.cad_id, pa.cad_idreferencia, pa.cad_descricao, ft.fi_id as ficha_id,');
            SQL.Add('    CAST(CASE WHEN ft.fi_complementar=TRUE THEN ''SIM'' ELSE ''N�O'' END AS character varying(5)) strComplementar,');
            SQL.Add('    CAST(CASE WHEN ft.fi_aproveitamento=TRUE THEN ''SIM'' ELSE ''N�O'' END AS character varying(5)) strAproveitamento');
            SQL.Add('  FROM produto_acabado AS pa JOIN ficha_tecnica AS ft ON ft.fi_idprodutoacabado = pa.cad_id');
            SQL.Add('  WHERE pa.cad_situacao=''A''');
            SQL.Add(' AND ft.fi_situacao in (''F'', ''Z'')');
            if comboFiltro.Text = 'REFERENCIA' then
            begin
                SQL.Add('AND pa.cad_idreferencia = :referencia');
                ParamByName('referencia').AsString := editSearchPA.Text;
            end;
            if comboFiltro.Text = 'NUMERO DA FICHA' then
            begin
                SQL.Add('AND ft.fi_id = :fichatecnica');
                ParamByName('fichatecnica').AsInteger := strtointdef(editSearchPA.Text,0);
            end;
            if comboFiltro.Text = 'DESCRICAO REFERENCIA' then
            begin
                SQL.Add('AND pa.cad_descricao = :descricao');
                ParamByName('descricao').AsString := editSearchPA.Text;
            end;
            if dbLCBoxColecao.KeyValue <> Null then
            begin
                SQL.Add('AND pa.cad_idcolecao = :colecao');
                ParamByName('colecao').AsInteger := dbLCBoxColecao.KeyValue;
            end;
            if dtCadastro.Checked = true then
            begin
                SQL.Add('AND pa.cad_dtcadastro = :dtcadastro');
                ParamByName('dtcadastro').AsDate := dtCadastro.Date;
            end;
            SQL.Add('ORDER BY ft.fi_id DESC LIMIT 15');
            Open;
        end;
    end;
end;

procedure TformProdutoAcabado.editSearchPAKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
      butProdutoPesquisarClick(Sender);
end;

procedure TformProdutoAcabado.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     dmProdAcabado.tbProdutoAcabado.Active := false;
end;

procedure TformProdutoAcabado.FormCreate(Sender: TObject);
begin
     dtCadastro.Date := now;
     dtCadastro.Checked := false;
end;

procedure TformProdutoAcabado.FormShow(Sender: TObject);
begin
    dmProdAcabado.qyProdutoAcabado.Active :=false;
    formPrincipal.boxColecao;

end;

procedure TformProdutoAcabado.gridProdutoAcabadoDblClick(Sender: TObject);
begin
    formIniciarCorte.editCodigo.Text := gridProdutoAcabado.Fields[0].Value;
    formIniciarCorte.editReferencia.Text := gridProdutoAcabado.Fields[1].Value;
    formIniciarCorte.editFicha.Text := gridProdutoAcabado.Fields[3].Value;
    formIniciarCorte.editDescReferencia.Text := gridProdutoAcabado.Fields[2].Value;
    formIniciarCorte.labNaoComp.Caption := gridProdutoAcabado.Fields[4].Value;
    formIniciarCorte.labNaoAprov.Caption := gridProdutoAcabado.Fields[5].Value;
    formIniciarCorte.labNormal.Caption := 'NORMAL';
    With dmProdAcabado.qyFichaTecnica do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT fi_situacao FROM ficha_tecnica');
        SQL.Add('WHERE fi_idprodutoacabado = :prodAcabado');
        ParamByName('prodAcabado').AsInteger := strtoint(gridProdutoAcabado.Fields[0].Value);
        Open;
    end;
    if dmProdAcabado.qyFichaTecnica.FieldByName('fi_situacao').Value = 'F' then
        formIniciarCorte.labTipoCorte.Caption := 'Prototipo'
    else
        formIniciarCorte.labTipoCorte.Caption := 'Grande Escala';
    formProdutoAcabado.Close;
end;


procedure TformProdutoAcabado.labMosColPacabadoClick(Sender: TObject);
begin
    With dmPrincipal.qyBoxColecao do
    begin
        Close;
        SQl.Clear;
        SQl.add('SELECT co_id,');
        SQl.add('CAST(CONCAT(co_descricao,'' de '', to_char(co_anocolecao, ''YYYY''))AS character varying(25))AS nome');
        SQl.add('FROM colecao');
        SQl.add('ORDER BY co_anocolecao');
        Open;
    end;
end;

end.
