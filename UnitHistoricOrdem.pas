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
    no, noPai, noPrev, noTroca, noEmpenho, noRealCortado: TTreeNode;
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
          SQL.Text := 'select oci_dtlanc, oci_hrlanc, oci_codusulanc, oci_dtfinalizada, us_nome, oci_situacao_id, descricao from ordem_corte_itens_previsto, usuario, ordem_corte_itens_situacao';
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
    with dmOrdemCorte.qyEmpenho do
    begin
          Close;
          SQL.Text := 'select emp_dtlanc, emp_hrlanc, emp_dtsaidaent, us_nome from controle_empenho, usuario';
          SQL.Add('where emp_idusulanc = us_id and emp_hrlanc <> ''00:00:00-03:00'' and emp_idordemcorte = :ordem');
          ParamByName('ordem').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyRealCortado do
    begin
          Close;
          SQL.Text := 'select oci_dtlanc, oci_hrlanc, oci_codusulanc, us_nome, oci_situacao_id, descricao from ordem_corte_itens_real, usuario, ordem_corte_itens_situacao';
          SQL.Add('where oci_codusulanc = us_id and oci_situacao_id = id and oci_idocorte = :ocorte');
          ParamByName('ocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyEmpenhoReal do
    begin
          Close;
          SQL.Text := 'select emp_dtsaidaent, emp_hrsaidaent, emp_idususaidaent, us_nome from controle_empenho, usuario';
          SQL.Add('where emp_idususaidaent = us_id and emp_idordemcorte = :ordem');
          ParamByName('ordem').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyRealFinal do
    begin
          Close;
          SQL.Text := 'select oci_dtfinalizada, oci_hrfinalizada, oci_idusualterou, oci_idusualterou, oci_idusualterou, oci_idusufinalizou, oci_dtultalteracao, us_nome, oci_situacao_id, descricao from ordem_corte_itens_real, usuario, ordem_corte_itens_situacao';
          SQL.Add('where oci_idusufinalizou = us_id and oci_situacao_id = id and oci_idocorte = :ocorte');
          ParamByName('ocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
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
    if dmOrdemCorte.qyEmpenho.recordcount > 0 then
    begin
        noPrev := treeHistoricOrdem.Items.AddChild(no, 'PEDIDO DE EMPENHO');
        noEmpenho := treeHistoricOrdem.Items.AddChildFirst(noPrev, 'DATA PEDIDO: ' + datetostr(dmOrdemCorte.qyEmpenho.FieldByName('emp_dtlanc').Value)
        + '  ' + timetostr(dmOrdemCorte.qyEmpenho.FieldByName('emp_hrlanc').Value) + '        USU�RIO: ' + dmOrdemCorte.qyEmpenho.FieldByName('us_nome').Value);
    end;
    if dmOrdemCorte.qyPrevisto.FieldByName('oci_situacao_id').Value = '4' then
    begin
        noPrev := treeHistoricOrdem.Items.AddChild(no, 'FINALIZADO EM: ' + datetostr(dmOrdemCorte.qyPrevisto.FieldByName('oci_dtfinalizada').Value)
       + '        USU�RIO FINALIZOU: ' + dmOrdemCorte.qyPrevisto.FieldByName('us_nome').Value);
    end;
    if dmOrdemCorte.qyRealCortado.recordcount > 0 then
    begin
        no := treeHistoricOrdem.Items.AddChild(noPai, 'REAL CORTADO');
        noRealCortado := treeHistoricOrdem.Items.AddChildFirst(no, 'DATA INICIO: ' + datetostr(dmOrdemCorte.qyRealCortado.FieldByName('oci_dtlanc').Value)
        + '  ' + timetostr(dmOrdemCorte.qyRealCortado.FieldByName('oci_hrlanc').Value) + '        USU�RIO INICIOU: ' +
    dmOrdemCorte.qyRealCortado.FieldByName('us_nome').Value + '        SITUA��O: ' + dmOrdemCorte.qyRealCortado.FieldByName('descricao').Value);
    end;
    if dmOrdemCorte.qyEmpenhoReal.recordcount > 0 then
    begin
        noRealCortado := treeHistoricOrdem.Items.AddChild(no, 'EMPENHO PARA CORTE');
        noEmpenho := treeHistoricOrdem.Items.AddChildFirst(noRealCortado, 'DATA ENVIO: ' + datetostr(dmOrdemCorte.qyEmpenhoReal.FieldByName('emp_dtsaidaent').Value)
        + '  ' + timetostr(dmOrdemCorte.qyEmpenhoReal.FieldByName('emp_hrsaidaent').Value) + '        USU�RIO: ' + dmOrdemCorte.qyEmpenhoReal.FieldByName('us_nome').Value);
    end;
    if dmOrdemCorte.qyRealFinal.FieldByName('oci_idusualterou').Value <> NULL then
    begin
        noRealCortado := treeHistoricOrdem.Items.AddChild(no, 'DATA CORTE: ' + datetostr(dmOrdemCorte.qyRealFinal.FieldByName('oci_dtultalteracao').Value)
        + '        USU�RIO CORTOU: ' + dmOrdemCorte.qyRealCortado.FieldByName('us_nome').Value);
    end;
    if dmOrdemCorte.qyRealFinal.FieldByName('oci_situacao_id').Value = '4' then
    begin
        noRealCortado := treeHistoricOrdem.Items.AddChild(no, 'FINALIZADO EM: ' + datetostr(dmOrdemCorte.qyRealFinal.FieldByName('oci_dtfinalizada').Value)
       + '  ' + timetostr(dmOrdemCorte.qyRealFinal.FieldByName('oci_hrfinalizada').Value) + '        USU�RIO FINALIZOU: '
       + dmOrdemCorte.qyRealFinal.FieldByName('us_nome').Value);
    end;
end;

end.
