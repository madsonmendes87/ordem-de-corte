unit UnitConfirmacaoAvancoProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TformConfirmacaoAvancoProducao = class(TForm)
    dtReposicao: TDateTimePicker;
    labDataReposicao: TLabel;
    gridProduto: TDBGrid;
    gridProdutoReposicao: TDBGrid;
    butDown: TBitBtn;
    butUP: TBitBtn;
    butSalvarFinalPrev: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butDownClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure butUPClick(Sender: TObject);
    procedure butSalvarFinalPrevClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConfirmacaoAvancoProducao: TformConfirmacaoAvancoProducao;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitPrincipal, UnitIniciarCorte;


procedure TformConfirmacaoAvancoProducao.butDownClick(Sender: TObject);
begin
    dmOrdemCorte.cdsProdReposicao.Append;
    dmOrdemCorte.cdsProdReposicao.FieldByName('idProduto').AsInteger := gridProduto.Fields[0].Value;
    dmOrdemCorte.cdsProdReposicao.FieldByName('Produto').AsString := gridProduto.Fields[1].Value;
    dmOrdemCorte.cdsProdReposicao.FieldByName('Cor').AsString := gridProduto.Fields[2].Value;
    dmOrdemCorte.cdsProdReposicao.FieldByName('Tamanho').AsString := gridProduto.Fields[3].Value;
    dmOrdemCorte.cdsProdReposicao.FieldByName('Data Reposicao').AsDateTime := dtReposicao.Date;
    dmOrdemCorte.cdsProdReposicao.FieldByName('codCor').AsInteger := gridProduto.Fields[7].Value;
    dmOrdemCorte.cdsProdReposicao.FieldByName('codTamanho').AsInteger := gridProduto.Fields[8].Value;
    dmOrdemCorte.cdsProdReposicao.Post;
    dmOrdemCorte.cdsProdSemEstoque.Delete;
    if dmOrdemCorte.cdsProdSemEstoque.IsEmpty then
      butDown.Enabled := false;
      butUP.Enabled := true;
end;

procedure TformConfirmacaoAvancoProducao.butSalvarFinalPrevClick(
  Sender: TObject);
begin
    if not dmOrdemCorte.cdsProdSemEstoque.IsEmpty then
    begin
       Application.MessageBox('Complete o processo de informa��o da reposi��o do estoque!','Aten��o',MB_OK + MB_ICONWARNING);
       exit;
    end
    else
      dmOrdemCorte.tbConfAvancoProducao.Open();
      dmOrdemCorte.tbConfAvancoProducao.Append;
      dmOrdemCorte.tbConfAvancoProducao.FieldByName('capr_idusuario').Value := 16;
      dmOrdemCorte.tbConfAvancoProducao.FieldByName('capr_idfichatecnica').Value := formIniciarCorte.editFicha.Text;
      dmOrdemCorte.tbConfAvancoProducao.FieldByName('capr_idfaseconfirmacao').Value := 1;
      dmOrdemCorte.tbConfAvancoProducao.FieldByName('capr_dthrcadastro').Value := now;
      dmOrdemCorte.tbConfAvancoProducao.Post;
      with dmOrdemCorte.qyOldValue do
      begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT * FROM confimacao_avanco_producao_referencia_itens');
          SQL.Add('ORDER BY capri_id DESC');
          Open;
      end;
      dmOrdemCorte.cdsProdReposicao.First;
      while not dmOrdemCorte.cdsProdReposicao.eof do
      begin
          dmOrdemCorte.tbAvancoProducaoItens.Open();
          dmOrdemCorte.tbAvancoProducaoItens.Append;
          dmOrdemCorte.tbAvancoProducaoItens.FieldByName('capri_idconfirmacaoavanco').Value := dmOrdemCorte.qyOldValue.FieldByName('capri_idconfirmacaoavanco').OldValue +1;
          dmOrdemCorte.tbAvancoProducaoItens.FieldByName('capri_idproduto').Value := gridProdutoReposicao.Fields[0].Value;
          dmOrdemCorte.tbAvancoProducaoItens.FieldByName('capri_idgradecor').Value := gridProdutoReposicao.Fields[5].Value;
          dmOrdemCorte.tbAvancoProducaoItens.FieldByName('capri_idgradetamanho').Value := gridProdutoReposicao.Fields[6].Value;
          dmOrdemCorte.tbAvancoProducaoItens.FieldByName('capri_datareposicao').Value := now;
          dmOrdemCorte.tbAvancoProducaoItens.Post;
          dmOrdemCorte.cdsProdReposicao.Next;
      end;
      Application.Messagebox('Salvo com sucesso','Ordem de Corte',MB_OK + MB_ICONWARNING);
      Close;
      exit;
end;

procedure TformConfirmacaoAvancoProducao.butUPClick(Sender: TObject);
begin
    dmOrdemCorte.cdsProdSemEstoque.Append;
    dmOrdemCorte.cdsProdSemEstoque.FieldByName('idProduto').AsInteger := gridProdutoReposicao.Fields[0].Value;
    dmOrdemCorte.cdsProdSemEstoque.FieldByName('Produto').AsString := gridProdutoReposicao.Fields[1].Value;
    dmOrdemCorte.cdsProdSemEstoque.FieldByName('Cor').AsString := gridProdutoReposicao.Fields[2].Value;
    dmOrdemCorte.cdsProdSemEstoque.FieldByName('Tamanho').AsString := gridProdutoReposicao.Fields[3].Value;
    dmOrdemCorte.cdsProdSemEstoque.FieldByName('codCor').AsInteger := gridProdutoReposicao.Fields[5].Value;
    dmOrdemCorte.cdsProdSemEstoque.FieldByName('codTamanho').AsString := gridProdutoReposicao.Fields[6].Value;
    dmOrdemCorte.cdsProdSemEstoque.Post;
    dmOrdemCorte.cdsProdReposicao.Delete;
    if dmOrdemCorte.cdsProdReposicao.IsEmpty then
      butUP.Enabled := false;
      butDown.Enabled := true;
end;

procedure TformConfirmacaoAvancoProducao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmOrdemCorte.cdsProdSemEstoque.EmptyDataSet;
    dmOrdemCorte.cdsProdReposicao.EmptyDataSet;
end;

procedure TformConfirmacaoAvancoProducao.FormCreate(Sender: TObject);
begin
    dtReposicao.Date:=now;
end;

procedure TformConfirmacaoAvancoProducao.FormResize(Sender: TObject);
begin
    formPrincipal.dimensionarGrid(gridProdutoReposicao);
end;

procedure TformConfirmacaoAvancoProducao.FormShow(Sender: TObject);
begin
    gridProduto.Columns[0].Title.Alignment:=taCenter;
    gridProduto.Columns[0].Title.Caption:='Codigo';
    gridProduto.Columns[1].Title.Alignment:=taCenter;
    gridProduto.Columns[2].Title.Alignment:=taCenter;
    gridProduto.Columns[3].Title.Alignment:=taCenter;
    gridProduto.Columns[4].Title.Alignment:=taCenter;
    gridProduto.Columns[5].Title.Alignment:=taCenter;
    gridProduto.Columns[6].Title.Alignment:=taCenter;
    gridProduto.Columns[7].Title.Alignment:=taCenter;
    gridProduto.Columns[8].Title.Alignment:=taCenter;
    gridProdutoReposicao.Columns[0].Title.Alignment:=taCenter;
    gridProdutoReposicao.Columns[0].Title.Caption:='Codigo';
    gridProdutoReposicao.Columns[1].Title.Alignment:=taCenter;
    gridProdutoReposicao.Columns[2].Title.Alignment:=taCenter;
    gridProdutoReposicao.Columns[3].Title.Alignment:=taCenter;
    gridProdutoReposicao.Columns[4].Title.Alignment:=taCenter;
    gridProdutoReposicao.Columns[5].Title.Alignment:=taCenter;
    gridProdutoReposicao.Columns[6].Title.Alignment:=taCenter;
    if dmOrdemCorte.cdsProdReposicao.IsEmpty then
      butUP.Enabled := false;
end;

end.
