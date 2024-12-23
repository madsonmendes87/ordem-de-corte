unit unitInfoReferencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TformInfoReferencia = class(TForm)
    qyInfoReferencia: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formInfoReferencia: TformInfoReferencia;

implementation

{$R *.dfm}

uses unitDMPrevisto, UnitPrevisto, UnitDatamodule;

procedure TformInfoReferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action :=CaFree;
end;

procedure TformInfoReferencia.FormShow(Sender: TObject);

var
    treeInfoReferencia: TTreeView;
    noOrdemCorte, noReferencia, noPrototipo, noSeqCorte, noTecido, noCor, noComposicao, noRestricaoLavado: TTreeNode;

begin
    treeInfoReferencia                    :=TTreeView.Create(Self);
    treeInfoReferencia.Parent             :=formInfoReferencia;
    treeInfoReferencia.Align              :=alClient;
    treeInfoReferencia.Color              :=clBtnFace;
    treeInfoReferencia.Font.Size          :=11;
    treeInfoReferencia.Font.Name          :='Arial';
    //treeInfoReferencia.Font.Style         :=[fsBold];

    with qyInfoReferencia do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   pa.cad_idreferencia,');
        SQL.Add('   oc.oc_id,');
        SQL.Add('   oc.oc_prototipo,');
        SQL.Add('   oc.oc_ordem,');
        SQL.Add('   cp.cp_id,');
        SQL.Add('   cp.cp_descricao,');
        SQL.Add('   gc.grc_id,');
        SQL.Add('   (gc.grc_codexterno ||'' - ''|| gc.grc_nome) AS grc_nome,');
        SQL.Add('   cm.cm_descricao,');
        SQL.Add('   rl.rlav_descricao,');
        SQL.Add('   (oci.oci_idcortecido + 1) AS oci_idcortecido');
        SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
        SQL.Add('   JOIN ordem_corte AS oc ON oc.oc_id = oci.oci_idocorte');
        SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_id = oc.oc_idfichatecnica');
        SQL.Add('   JOIN produto_acabado AS pa ON pa.cad_id = ft.fi_idprodutoacabado');
        SQL.Add('   AND oc.oc_idcodprodutoacabado = pa.cad_id');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
        SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = oci.oci_idgradecor');
        SQL.Add('   LEFT JOIN composicao_material AS cm ON cm.cm_id = cp.cp_idcomposicao');
        SQL.Add('   LEFT JOIN restricao_lavagem AS rl ON rl.rlav_id = cp.cp_idrestlavagem');
        SQL.Add('   WHERE oc_situacao<>''2''');
        SQL.Add('   AND oci.oci_tecido=TRUE');
        SQL.Add('   AND oci.oci_tipo=''P''');
        SQL.Add('   AND pa.cad_id = :prodAcabado');
        SQL.Add('   ORDER  BY  oc.oc_id ASC, oci_idcortecido ASC , oc.oc_ordem ASC');

        ParamByName('prodAcabado').AsInteger    :=strtoint(formPrevisto.labCodProdAcabado.Caption);
        Open;
    end;


    qyInfoReferencia.First;

    while not qyInfoReferencia.Eof do
    begin
        noReferencia            :=treeInfoReferencia.Items.Add(nil, 'REFER�NCIA: '+ qyInfoReferencia.FieldByName('cad_idreferencia').Value);
        noOrdemCorte            :=treeInfoReferencia.Items.AddChild(noReferencia, 'ORDEM DE CORTE: '+ intTostr(qyInfoReferencia.FieldByName('oc_id').Value));

        if qyInfoReferencia.FieldByName('oc_prototipo').Value = true then
            noPrototipo         :=treeInfoReferencia.Items.AddChild(noReferencia, 'TIPO PRODU��O: Prot�tipo')
        else
            noPrototipo         :=treeInfoReferencia.Items.AddChild(noReferencia, 'TIPO PRODU��O: Grande Escala');

        noSeqCorte              :=treeInfoReferencia.Items.AddChild(noReferencia, 'ORDEM NUMERO: '+intTostr(qyInfoReferencia.FieldByName('oc_ordem').Value));
        noTecido                :=treeInfoReferencia.Items.AddChild(noReferencia, 'TECIDO: '+qyInfoReferencia.FieldByName('cp_descricao').Value);
        noCor                   :=treeInfoReferencia.Items.AddChild(noReferencia, 'COR: '+qyInfoReferencia.FieldByName('grc_nome').Value);
        noComposicao            :=treeInfoReferencia.Items.AddChild(noReferencia, 'COMPOSI��O: '+qyInfoReferencia.FieldByName('cm_descricao').Value);
        noRestricaoLavado       :=treeInfoReferencia.Items.AddChild(noReferencia, 'RES LAVADO: '+qyInfoReferencia.FieldByName('rlav_descricao').Value);

        qyInfoReferencia.Next;
    end;
end;

end.
