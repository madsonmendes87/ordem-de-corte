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

uses UnitDatamodule, UnitIniciarCorte, UnitPrincipal, UnitProdutoAcabado,
  UnitDMHistoricOrdem, unitArtCancelados, UnitConfirmacaoAvancoProducao,
  UnitLogin, UnitMudancArtigo, UnitOrdemCorteCores, UnitPrevisto,
  UnitSelecionArtigos, UnitVerificaVersao;

procedure TformHistoricOrdem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action :=CaFree;
end;

procedure TformHistoricOrdem.FormShow(Sender: TObject);

var
    treeHistoricOrdem: TTreeView;
    no, noPai, noPrev, noTroca, noEmpenho, noRealCortado: TTreeNode;
begin
    treeHistoricOrdem         :=TTreeView.Create(Self);
    treeHistoricOrdem.Parent  :=formHistoricOrdem;
    treeHistoricOrdem.Align   :=alClient;
    with dmHistoricOrdem.qyOrdemHistorico do
    begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT oc_dtgerada, oc_hrgerada, us_nome FROM ordem_corte, usuario');
          SQL.Add('   WHERE oc_usugerou = us_id and oc_id = :ordemcorte');

          ParamByName('ordemcorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmHistoricOrdem.qyPrevisto do
    begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT oci_dtlanc, oci_hrlanc, oci_codusulanc, oci_dtfinalizada, us_nome, oci_situacao_id, descricao');
          SQL.Add('   FROM ordem_corte_itens_previsto, usuario, ordem_corte_itens_situacao');
          SQL.Add('   WHERE oci_codusulanc = us_id AND oci_situacao_id = id AND oci_idocorte = :ocorte');

          ParamByName('ocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyTroca do
    begin
          Close;
          SQL.Text := 'SELECT pti.*,  (ug.us_nome) AS ugnome, (uc.us_nome) AS ucnome FROM ordem_corte AS oc';
          SQL.Add(' JOIN ordem_corte_itens_previsto AS oci ON oci.oci_idocorte = oc.oc_id');
          SQL.Add(' JOIN producao_troca_item AS pti ON pti.pti_iditemcorteprevisto = oci.oci_id');
          SQL.Add(' JOIN usuario AS ug ON ug.us_id = pti.pti_idusuariosolicitacao');
          SQL.Add(' LEFT JOIN usuario AS uc ON uc.us_id = pti.pti_idusuarioconfirmacao');
          SQL.Add(' WHERE oci.oci_idocorte=:corte AND pti.pti_status<>''R''');
          SQL.Add(' ORDER BY pti.pti_dtsolicitacao ASC');
          SQL.Add(' LIMIT 1');

          ParamByName('corte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyEmpenho do
    begin
          Close;
          SQL.Text := 'SELECT emp_dtlanc, emp_hrlanc, emp_dtsaidaent, us_nome FROM controle_empenho, usuario';
          SQL.Add('WHERE emp_idusulanc = us_id AND emp_hrlanc <> ''00:00:00-03:00'' AND emp_idordemcorte = :ordem');
          ParamByName('ordem').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyRealCortado do
    begin
          Close;
          SQL.Text := 'SELECT oci_dtlanc, oci_hrlanc, oci_codusulanc, us_nome, oci_situacao_id, descricao FROM ordem_corte_itens_real, usuario, ordem_corte_itens_situacao';
          SQL.Add('WHERE oci_codusulanc = us_id AND oci_situacao_id = id AND oci_idocorte = :ocorte');
          ParamByName('ocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyEmpenhoReal do
    begin
          Close;
          SQL.Text := 'SELECT emp_dtsaidaent, emp_hrsaidaent, emp_idususaidaent, us_nome FROM controle_empenho, usuario';
          SQL.Add('WHERE emp_idususaidaent = us_id AND emp_idordemcorte = :ordem');
          ParamByName('ordem').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    with dmOrdemCorte.qyRealFinal do
    begin
          Close;
          SQL.Text := 'SELECT oci_dtfinalizada, oci_hrfinalizada, oci_idusualterou, oci_idusualterou, oci_idusualterou, oci_idusufinalizou, oci_dtultalteracao, us_nome, oci_situacao_id, descricao from ordem_corte_itens_real, usuario, ordem_corte_itens_situacao';
          SQL.Add('WHERE oci_idusufinalizou = us_id AND oci_situacao_id = id AND oci_idocorte = :ocorte');
          ParamByName('ocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
          Open;
    end;
    noPai := treeHistoricOrdem.Items.Add(nil, 'ORDEM DE CORTE: ' + intTostr(formPrincipal.gridOrdem.Fields[0].Value));
    begin
      noPai.Selected := false;
    end;
    no := treeHistoricOrdem.Items.AddChildFirst(noPai, 'ESTILISTA: ' + formPrincipal.gridOrdem.Fields[4].Value + '        REFERÊNCIA: '
    + formPrincipal.gridOrdem.Fields[9].Value);
    no := treeHistoricOrdem.Items.AddChild(noPai, 'DATA INICIO: ' + datetostr(dmHistoricOrdem.qyOrdemHistorico.FieldByName('oc_dtgerada').Value)
    + '  ' + timetostr(dmHistoricOrdem.qyOrdemHistorico.FieldByName('oc_hrgerada').Value) + '        USUÁRIO INICIOU: ' +
    dmHistoricOrdem.qyOrdemHistorico.FieldByName('us_nome').Value);
    no := treeHistoricOrdem.Items.AddChild(noPai, 'CORTE PREVISTO');
    noPrev := treeHistoricOrdem.Items.AddChildFirst(no, 'DATA INICIO: ' + datetostr(dmHistoricOrdem.qyPrevisto.FieldByName('oci_dtlanc').Value)
    + '  ' + timetostr(dmHistoricOrdem.qyPrevisto.FieldByName('oci_hrlanc').Value) + '        USUÁRIO INICIOU: ' +
    dmHistoricOrdem.qyPrevisto.FieldByName('us_nome').Value + '        SITUAÇÃO: ' + dmHistoricOrdem.qyPrevisto.FieldByName('descricao').Value);
    if dmOrdemCorte.qyTroca.recordcount > 0 then
    begin
        noPrev := treeHistoricOrdem.Items.AddChild(no, 'TROCA DE PRODUTO');
        noTroca := treeHistoricOrdem.Items.AddChildFirst(noPrev, 'DATA SOLICITAÇÃO: ' + DateTimeToStr(dmOrdemCorte.qyTroca.FieldByName('pti_dtsolicitacao').Value)
        + '        USUÁRIO GEROU: ' + dmOrdemCorte.qyTroca.FieldByName('ugnome').Value + '        USUÁRIO CONFIRMOU: ' + dmOrdemCorte.qyTroca.FieldByName('ucnome').Value);
    end;
    if dmOrdemCorte.qyEmpenho.recordcount > 0 then
    begin
        noPrev := treeHistoricOrdem.Items.AddChild(no, 'PEDIDO DE EMPENHO');
        noEmpenho := treeHistoricOrdem.Items.AddChildFirst(noPrev, 'DATA PEDIDO: ' + datetostr(dmOrdemCorte.qyEmpenho.FieldByName('emp_dtlanc').Value)
        + '  ' + timetostr(dmOrdemCorte.qyEmpenho.FieldByName('emp_hrlanc').Value) + '        USUÁRIO: ' + dmOrdemCorte.qyEmpenho.FieldByName('us_nome').Value);
    end;
    if dmHistoricOrdem.qyPrevisto.FieldByName('oci_situacao_id').Value = '4' then
    begin
        noPrev := treeHistoricOrdem.Items.AddChild(no, 'FINALIZADO EM: ' + datetostr(dmHistoricOrdem.qyPrevisto.FieldByName('oci_dtfinalizada').Value)
       + '        USUÁRIO FINALIZOU: ' + dmHistoricOrdem.qyPrevisto.FieldByName('us_nome').Value);
    end;
    if dmOrdemCorte.qyRealCortado.recordcount > 0 then
    begin
        no := treeHistoricOrdem.Items.AddChild(noPai, 'REAL CORTADO');
        noRealCortado := treeHistoricOrdem.Items.AddChildFirst(no, 'DATA INICIO: ' + datetostr(dmOrdemCorte.qyRealCortado.FieldByName('oci_dtlanc').Value)
        + '  ' + timetostr(dmOrdemCorte.qyRealCortado.FieldByName('oci_hrlanc').Value) + '        USUÁRIO INICIOU: ' +
    dmOrdemCorte.qyRealCortado.FieldByName('us_nome').Value + '        SITUAÇÃO: ' + dmOrdemCorte.qyRealCortado.FieldByName('descricao').Value);
    end;
    if dmOrdemCorte.qyEmpenhoReal.recordcount > 0 then
    begin
        noRealCortado := treeHistoricOrdem.Items.AddChild(no, 'EMPENHO PARA CORTE');
        noEmpenho := treeHistoricOrdem.Items.AddChildFirst(noRealCortado, 'DATA ENVIO: ' + datetostr(dmOrdemCorte.qyEmpenhoReal.FieldByName('emp_dtsaidaent').Value)
        + '  ' + timetostr(dmOrdemCorte.qyEmpenhoReal.FieldByName('emp_hrsaidaent').Value) + '        USUÁRIO: ' + dmOrdemCorte.qyEmpenhoReal.FieldByName('us_nome').Value);
    end;
    if dmOrdemCorte.qyRealFinal.FieldByName('oci_idusualterou').Value <> NULL then
    begin
        noRealCortado := treeHistoricOrdem.Items.AddChild(no, 'DATA CORTE: ' + datetostr(dmOrdemCorte.qyRealFinal.FieldByName('oci_dtultalteracao').Value)
        + '        USUÁRIO CORTOU: ' + dmOrdemCorte.qyRealCortado.FieldByName('us_nome').Value);
    end;
    if dmOrdemCorte.qyRealFinal.FieldByName('oci_situacao_id').Value = '4' then
    begin
        noRealCortado := treeHistoricOrdem.Items.AddChild(no, 'FINALIZADO EM: ' + datetostr(dmOrdemCorte.qyRealFinal.FieldByName('oci_dtfinalizada').Value)
       + '  ' + timetostr(dmOrdemCorte.qyRealFinal.FieldByName('oci_hrfinalizada').Value) + '        USUÁRIO FINALIZOU: '
       + dmOrdemCorte.qyRealFinal.FieldByName('us_nome').Value);
    end;
end;

end.
