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
    qyCodProdAcabado: TFDQuery;
    qyObservacoes: TFDQuery;
    qyIdFicha: TFDQuery;
    procedure butOrdemPesquisarClick(Sender: TObject);
    procedure editSearchKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure gridRefRealCortadoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses UnitDatamodule, unitRealCortado;

procedure TformRefRealCortado.butOrdemPesquisarClick(Sender: TObject);
begin
    with qyRefRealCortado do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   oc.oc_id,');
        SQL.Add('   CAST(lpad(cast(oc.oc_ordem AS varchar), 3, ''0'') AS character varying(5))AS NumerodoCorte,');
        SQL.Add('   CAST(CASE WHEN oc.oc_prototipo=true THEN ''PROTOTIPO'' ELSE ''PRODUÇÃO'' END AS character varying(15)) AS tipo,');
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

end;

procedure TformRefRealCortado.editSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
        butOrdemPesquisarClick(sender);

end;

procedure TformRefRealCortado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//    FreeAndNil(formRefRealCortado);
//    qyRefRealCortado.Active  :=false;
end;

procedure TformRefRealCortado.FormShow(Sender: TObject);
begin
    gridView;
end;

procedure TformRefRealCortado.gridRefRealCortadoDblClick(Sender: TObject);
begin
    with qyIdFicha do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   pa.cad_id,');
        SQL.Add('   pa.cad_idreferencia,');
        SQL.Add('   ft.fi_id');
        SQL.Add('   FROM produto_acabado AS pa JOIN ficha_tecnica AS ft ON ft.fi_idprodutoacabado = pa.cad_id');
        SQL.Add('   WHERE pa.cad_idreferencia = :refer');

        ParamByName('refer').AsString  :=gridRefRealCortado.Fields[3].Value;
        Open;
    end;

    with qyObservacoes do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   pro.obs_confirmado,');
        SQL.Add('   pro.obs_id,');
        SQL.Add('   pa.cad_idreferencia,');
        SQL.Add('   pro.obs_observacao,');
        SQL.Add('   u_l.us_nome AS usuario_lancou,');
        SQL.Add('   u_c.us_nome AS usuario_confimou,');
        SQL.Add('   fp.fa_id,');
        SQL.Add('   fp.fa_nome');
        SQL.Add('   FROM producao_referencia_observacao AS pro');
        SQL.Add('   JOIN usuario AS u_l ON u_l.us_id=pro.obs_idusulancou');
        SQL.Add('   JOIN fase_producao AS fp ON fp.fa_id=pro.obs_idfaseproducao');
        SQL.Add('   LEFT JOIN usuario AS u_c ON u_c.us_id=pro.obs_idusuconfirmou');
        SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_id = pro.obs_idfichatecnica');
        SQL.Add('   JOIN ordem_corte AS oc ON oc.oc_idfichatecnica = ft.fi_id');
        SQL.Add('   JOIN produto_acabado AS pa ON pa.cad_id=ft.fi_idprodutoacabado');
        SQL.Add('   WHERE oc.oc_idfichatecnica = :ficha');
        SQL.Add('   AND pro.obs_deprototipo=FALSE');
        SQL.Add('   AND pro.obs_idfaseproducao=''1''');
        SQL.Add('   AND pro.obs_confirmado=FALSE');
        SQL.Add('   GROUP BY');
        SQL.Add('           pa.cad_idreferencia,');
        SQL.Add('           pro.obs_confirmado,');
        SQL.Add('           pro.obs_id,');
        SQL.Add('           pro.obs_observacao,');
        SQL.Add('           u_l.us_nome,');
        SQL.Add('           u_c.us_nome,');
        SQL.Add('           fp.fa_id,');
        SQL.Add('           fp.fa_nome');
        SQL.Add('   ORDER BY obs_id ASC');

        ParamByName('ficha').AsInteger :=qyIdFicha.FieldByName('fi_id').Value;
        Open;
    end;

    if qyObservacoes.RecordCount > 0 then
    begin
        Application.MessageBox('HÁ OBSERVAÇÕES A SEREM VISUALIZADAS E CONFIRMADAS', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        //Abrir formObservacoes
    end
    else
    begin
        formRealCortado.labNumCorte.Caption :=intTostr(gridRefRealCortado.Fields[0].Value) +'-00'+ intTostr(gridRefRealCortado.Fields[1].Value);
        formRealCortado.labNumReferencia.Caption  :=gridRefRealCortado.Fields[3].Value;
        formRealCortado.labNomeDescricao.Caption  :=gridRefRealCortado.Fields[4].Value;
        with qyCodProdAcabado do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT cad_id FROM produto_acabado');
            SQL.Add('   WHERE cad_idreferencia = :referencia');

            ParamByName('referencia').AsString  :=gridRefRealCortado.Fields[3].Value;
            Open;
        end;
        formRealCortado.labCodProdAcabado.Caption :=qyCodProdAcabado.FieldByName('cad_id').Value;
        formRefRealCortado.Close;
    end;
end;

procedure TformRefRealCortado.gridView;
begin
    gridRefRealCortado.Columns[0].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[0].Title.Caption         :='Nº Corte';
    gridRefRealCortado.Columns[0].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[1].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[1].Title.Caption         :='Ordem';
    gridRefRealCortado.Columns[1].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[2].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[2].Title.Caption         :='Tipo';
    gridRefRealCortado.Columns[2].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[3].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[3].Title.Caption         :='Refeência';
    gridRefRealCortado.Columns[3].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[4].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[4].Title.Caption         :='Produto Acabado';
    gridRefRealCortado.Columns[4].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[5].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[5].Title.Caption         :='Data Gerada';
    gridRefRealCortado.Columns[5].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[6].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[6].Title.Caption         :='Situação';
    gridRefRealCortado.Columns[6].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[7].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[7].Title.Caption         :='Solicitação';
    gridRefRealCortado.Columns[7].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[8].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[8].Title.Caption         :='Prazo do Corte';
    gridRefRealCortado.Columns[8].Title.Font.Style      :=[fsBold];
    gridRefRealCortado.Columns[9].Title.Alignment       :=taCenter;
    gridRefRealCortado.Columns[9].Title.Caption         :='Observação';
    gridRefRealCortado.Columns[9].Title.Font.Style      :=[fsBold];

end;

end.
