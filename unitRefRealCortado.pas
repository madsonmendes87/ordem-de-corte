unit unitRefRealCortado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TformRefRealCortado = class(TForm)
    labTipoCorte: TLabel;
    comboTipoCorte: TComboBox;
    labRefeDescricao: TLabel;
    editSearch: TEdit;
    butOrdemPesquisar: TSpeedButton;
    gridRefRealCortado: TDBGrid;
    qyRefRealCortado: TFDQuery;
    dsRefRealCortado: TDataSource;
    procedure butOrdemPesquisarClick(Sender: TObject);
    procedure editSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure gridView;
  public
    { Public declarations }
  end;

var
  formRefRealCortado: TformRefRealCortado;

implementation

{$R *.dfm}

uses UnitDatamodule;

procedure TformRefRealCortado.butOrdemPesquisarClick(Sender: TObject);
begin
    with qyRefRealCortado do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   oc.oc_id,');
        SQL.Add('   CAST(lpad(cast(oc.oc_ordem AS varchar), 3, ''0'') AS character varying(5))AS NumerodoCorte,');
        SQL.Add('   CAST(CASE WHEN oc.oc_prototipo=true THEN ''PROTOTIPO'' ELSE ''PRODU��O'' END AS character varying(15)) AS tipo,');
        SQL.Add('   pa.cad_idreferencia as referencia,');
        SQL.Add('   pa.cad_descricao as produto_acabado,');
        SQL.Add('   oc.oc_dtgerada as data_gerada,');
        SQL.Add('   ocs.os_nome as situacao,');
        SQL.Add('   oc.oc_dtsolicitacao,');
        SQL.Add('   oc.oc_dtprevisaofinalizacao,');
        SQL.Add('   oc.oc_observacao');
        SQL.Add('   FROM ordem_corte AS oc');
        SQL.Add('   JOIN produto_acabado AS pa ON pa.cad_id = oc.oc_idcodprodutoacabado');
        SQL.Add('   JOIN ordem_corte_situacao AS ocs ON ocs.os_id = oc.oc_situacao');
        SQL.Add('   WHERE oc.oc_situacao<>''2''');
        if comboTipoCorte.Text = 'PROTOTIPO' then
        begin
            if editSearch.Text = '' then
            begin
                SQL.Add('AND oc.oc_prototipo = true');
            end
            else
            begin
                SQL.Add('AND oc.oc_prototipo = true');
                SQL.Add('AND pa.cad_idreferencia = :referencia');
                ParamByName('referencia').AsString  :=editSearch.Text;
            end;
        end;
        if comboTipoCorte.Text = 'PRODUCAO' then
        begin
            if editSearch.Text = '' then
            begin
                SQL.Add('AND oc.oc_prototipo = false');
            end
            else
            begin
                SQL.Add('AND oc.oc_prototipo = false');
                SQL.Add('AND pa.cad_idreferencia = :referencia');
                ParamByName('referencia').AsString  :=editSearch.Text;
            end;
        end;
        SQL.Add('   ORDER BY oc.oc_id DESC LIMIT 23');
        Open;
    end;

    gridView;

//    gridRefRealCortado.Columns[0].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[0].Title.Caption         :='N� Corte';
//    gridRefRealCortado.Columns[0].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[1].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[1].Title.Caption         :='Ordem';
//    gridRefRealCortado.Columns[1].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[2].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[2].Title.Caption         :='Tipo';
//    gridRefRealCortado.Columns[2].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[3].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[3].Title.Caption         :='Refe�ncia';
//    gridRefRealCortado.Columns[3].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[4].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[4].Title.Caption         :='Produto Acabado';
//    gridRefRealCortado.Columns[4].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[5].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[5].Title.Caption         :='Data Gerada';
//    gridRefRealCortado.Columns[5].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[6].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[6].Title.Caption         :='Situa��o';
//    gridRefRealCortado.Columns[6].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[7].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[7].Title.Caption         :='Solicita��o';
//    gridRefRealCortado.Columns[7].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[8].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[8].Title.Caption         :='Prazo do Corte';
//    gridRefRealCortado.Columns[8].Title.Font.Style      :=[fsBold];
//    gridRefRealCortado.Columns[9].Title.Alignment       :=taCenter;
//    gridRefRealCortado.Columns[9].Title.Caption         :='Observa��o';
//    gridRefRealCortado.Columns[9].Title.Font.Style      :=[fsBold];
end;

procedure TformRefRealCortado.editSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
        butOrdemPesquisarClick(sender);

end;

procedure TformRefRealCortado.FormShow(Sender: TObject);
begin
    gridView;
end;

procedure TformRefRealCortado.gridView;
begin
    gridRefRealCortado.Columns[0].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[0].Title.Caption         :='N� Corte';
    gridRefRealCortado.Columns[0].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[1].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[1].Title.Caption         :='Ordem';
    gridRefRealCortado.Columns[1].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[2].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[2].Title.Caption         :='Tipo';
    gridRefRealCortado.Columns[2].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[3].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[3].Title.Caption         :='Refe�ncia';
    gridRefRealCortado.Columns[3].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[4].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[4].Title.Caption         :='Produto Acabado';
    gridRefRealCortado.Columns[4].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[5].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[5].Title.Caption         :='Data Gerada';
    gridRefRealCortado.Columns[5].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[6].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[6].Title.Caption         :='Situa��o';
    gridRefRealCortado.Columns[6].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[7].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[7].Title.Caption         :='Solicita��o';
    gridRefRealCortado.Columns[7].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[8].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[8].Title.Caption         :='Prazo do Corte';
    gridRefRealCortado.Columns[8].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[9].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[9].Title.Caption         :='Observa��o';
    gridRefRealCortado.Columns[9].Title.Font.Style      :=[fsBold];

end;

end.
