unit UnitHistoricOrdem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls;

type
  TformHistoricOrdem = class(TForm)
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

var
    treeHistoricOrdem: TTreeView;
    no, noPrev, noTroca: TTreeNode;
    noPai: TTreeNode;
    I: Integer;
begin
    treeHistoricOrdem := TTreeView.Create(Self);
    treeHistoricOrdem.Parent := formHistoricOrdem;
    treeHistoricOrdem.Align := alClient;
    with dmOrdemCorte.qyOrdemHistorico do
    begin
          Close;
          SQL.Text := 'select oc_dtgerada, oc_hrgerada, us_nome from ordem_corte, usuario';
          SQL.Add('where oc_usugerou = us_id and oc_id = :ordemcorte');
          ParamByName('ordemcorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyPrevisto do
    begin
          Close;
          SQL.Text := 'select oci_dtlanc, oci_hrlanc, oci_codusulanc, us_nome, oci_situacao_id, descricao from ordem_corte_itens_previsto, usuario, ordem_corte_itens_situacao';
          SQL.Add('where oci_codusulanc = us_id and oci_situacao_id = id and oci_idocorte = :ocorte');
          ParamByName('ocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyTroca do
    begin
          Close;
          SQL.Text := 'select pti_idusuariosolicitacao, pti_dtsolicitacao, pti_idusuarioconfirmacao, us_nome from producao_troca_item, usuario';
          SQL.Add('where pti_idusuariosolicitacao = us_id and pti_idusuarioconfirmacao = us_id and pti_idfichatecnica = :ficha');
          ParamByName('ficha').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[4].Value);
          Open;
    end;
    noPai := treeHistoricOrdem.Items.Add(nil, 'ORDEM DE CORTE: ' + intTostr(formPrincipal.gridOrdem.Fields[0].Value));
    begin
      noPai.Selected := false;
    end;
    no := treeHistoricOrdem.Items.AddChildFirst(noPai, 'ESTILISTA: ' + formPrincipal.gridOrdem.Fields[3].Value + '        REFER�NCIA: '
    + formPrincipal.gridOrdem.Fields[8].Value);
    no := treeHistoricOrdem.Items.AddChild(noPai, 'DATA INICIO: ' + datetostr(dmOrdemCorte.qyOrdemHistorico.FieldByName('oc_dtgerada').Value)
    + '  ' + timetostr(dmOrdemCorte.qyOrdemHistorico.FieldByName('oc_hrgerada').Value) + '        USU�RIO INICIOU: ' +
    dmOrdemCorte.qyOrdemHistorico.FieldByName('us_nome').Value);
    no := treeHistoricOrdem.Items.AddChild(noPai, 'CORTE PREVISTO');
    noPrev := treeHistoricOrdem.Items.AddChildFirst(no, 'DATA INICIO: ' + datetostr(dmOrdemCorte.qyPrevisto.FieldByName('oci_dtlanc').Value)
    + '  ' + timetostr(dmOrdemCorte.qyPrevisto.FieldByName('oci_hrlanc').Value) + '        USU�RIO INICIOU: ' +
    dmOrdemCorte.qyPrevisto.FieldByName('us_nome').Value + '        SITUA��O: ' + dmOrdemCorte.qyPrevisto.FieldByName('descricao').Value);
    if dmOrdemCorte.qyTroca.recordcount > 0 then
    begin
        noPrev := treeHistoricOrdem.Items.AddChild(no, 'TROCA DE PRODUTO');
        noTroca := treeHistoricOrdem.Items.AddChildFirst(noPrev, 'DATA SOLICITA��O: ' + DateTimeToStr(dmOrdemCorte.qyTroca.FieldByName('pti_dtsolicitacao').Value)
        + '        USU�RIO GEROU: ' + dmOrdemCorte.qyTroca.FieldByName('us_nome').Value + '        USU�RIO CONFIRMOU: ' + dmOrdemCorte.qyTroca.FieldByName('us_nome').Value);
    end;
end;

end.
