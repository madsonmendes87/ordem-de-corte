unit UnitIniciarCorte;

interface

uses
  System.RegularExpressions, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls;

type
  TformIniciarCorte = class(TForm)
    panelIniciarCorte: TPanel;
    butSairInicioCorte: TSpeedButton;
    labNumOrd: TLabel;
    labNumeroOrd: TLabel;
    labCodigo: TLabel;
    editCodigo: TEdit;
    labF2: TLabel;
    labReferencia: TLabel;
    editReferencia: TEdit;
    labFicha: TLabel;
    editFicha: TEdit;
    labDescricao: TLabel;
    editDescReferencia: TEdit;
    labSituacao: TLabel;
    labNormal: TLabel;
    labComplementar: TLabel;
    labNaoComp: TLabel;
    labAproveitamento: TLabel;
    labNaoAprov: TLabel;
    labOrdCorte: TLabel;
    labCortePrevisto: TLabel;
    labRealCortado: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    labTipoCorte: TLabel;
    butNovo: TBitBtn;
    butSalvar: TBitBtn;
    butCancelarOrdem: TBitBtn;
    butEditar: TBitBtn;
    butDesistir: TBitBtn;
    Label18: TLabel;
    Label20: TLabel;
    dataSolicitacao: TDateTimePicker;
    horaSolicitacao: TDateTimePicker;
    dataOrdemFinalizacao: TDateTimePicker;
    horaOrdemFinalizacao: TDateTimePicker;
    dataCortePrevisto: TDateTimePicker;
    horaCortePrevisto: TDateTimePicker;
    dataFinalCortePrevisto: TDateTimePicker;
    horaFinalCortePrevisto: TDateTimePicker;
    dataRealCortado: TDateTimePicker;
    horaRealCortado: TDateTimePicker;
    dataFinalRealCortado: TDateTimePicker;
    horaFinalRealCortado: TDateTimePicker;
    editObservacao: TEdit;
    ActionListIniCorte: TActionList;
    acaoCores: TAction;
    butEscolherCores: TBitBtn;
    labTipoProducao: TLabel;
    labHifen: TLabel;
    labOrd: TLabel;
    butAlterar: TBitBtn;
    procedure butSairInicioCorteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure butDesistirClick(Sender: TObject);
    procedure butEscolherCoresClick(Sender: TObject);
    procedure acaoCoresExecute(Sender: TObject);
    procedure butSalvarClick(Sender: TObject);
    procedure butCancelarOrdemClick(Sender: TObject);
    procedure butEditarClick(Sender: TObject);
    procedure butAlterarClick(Sender: TObject);
  private
    { Private declarations }
    procedure tratarDataHora;
  public
    { Public declarations }
    procedure abrirProdutoAcabado;
  end;

var
  formIniciarCorte: TformIniciarCorte;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule, UnitHistoricOrdem,
  UnitOrdemCorteCores, UnitConfirmacaoAvancoProducao;



procedure TformIniciarCorte.abrirProdutoAcabado;
begin
     application.CreateForm(TformOrdemCorteCores, formOrdemCorteCores);
     formOrdemCorteCores.ShowModal;
end;

procedure TformIniciarCorte.acaoCoresExecute(Sender: TObject);

begin
    With dmOrdemCorte.qyOrdemIniciarCorte do
    begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT oc_situacao FROM ordem_corte');
         SQL.Add('WHERE oc_id = :ordem');
         ParamByName('ordem').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
         Open;
    end;
    if editCodigo.Text = ''  then
    begin
        Application.MessageBox('Selecione o produto', 'Ordem de Corte', mb_iconexclamation + mb_ok + mb_taskmodal);
        exit;
    end;
    if labTipoCorte.Caption = 'Prototipo' then
    begin
        Application.MessageBox('Este corte � prototipo e a cor de corte j� foi definida na ficha tecnica, por este motivo a funcionalidade requerida foi vedada',
        'Ordem de Corte', mb_iconexclamation + mb_ok + mb_taskmodal);
        exit;
    end;
    if dmOrdemCorte.qyOrdemIniciarCorte.FieldByName('oc_situacao').Value = 3 then
    begin
        Application.MessageBox('Ordem de corte finalizada, por esse motivo � vedado qualquer modifica��o na ordem de corte', 'Ordem de Corte', mb_iconexclamation +
        mb_ok + mb_taskmodal);
        exit;
    end;
    With dmOrdemCorte.qyPrevisto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT oci_situacao_id FROM ordem_corte_itens_previsto');
        SQL.Add('WHERE oci_idocorte = :numerocorte');
        ParamByName('numerocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
    end;
    dmOrdemCorte.qyPrevisto.First;
    while not dmOrdemCorte.qyPrevisto.Eof do
    begin
        if dmOrdemCorte.qyPrevisto.FieldByName('oci_situacao_id').Value = 3 then
        begin
            Application.MessageBox('Corte sob empenho, por este motivo n�o � possivel mudar cores. Para fazer um nova cor inicie um outra ordem de corte para esta referencia',
            'Ordem de Corte', mb_iconexclamation + mb_ok + mb_taskmodal);
            exit;
        end;
        dmOrdemCorte.qyPrevisto.Next;
    end;
        abrirProdutoAcabado;
end;

procedure TformIniciarCorte.butAlterarClick(Sender: TObject);
begin
    with dmOrdemCorte.qyDadosCorteById do
    begin
        Close;
        SQL.Clear;
        SQL.Add('UPDATE ordem_corte SET oc_dtprevisaofinalizacao = :dtfinalizacaocorte, oc_hrprevisaofinalizacao = :hrfinalizacaocorte,');
        SQL.Add('   oc_idcodprodutoacabado = :prodAcabado, oc_observacao = :observacao, oc_datapreviniciocorteprevisto = :dtinicioprevisto,');
        SQL.Add('   oc_horapreviniciocorteprevisto = :hrinicioprevisto, oc_dataprevfimcorteprevisto = :dtfimprevisto, oc_horaprevfimcorteprevisto = :hrfimprevisto,');
        SQL.Add('   oc_datapreviniciorealcortado = :dtinicioreal, oc_horapreviniciorealcortado = :hrinicioreal, oc_dataprevfimrealcortado = :dtfimreal,');
        SQL.Add('   oc_horaprevfimrealcortado = :hrfimreal, oc_dtalterada = :dtalterada, oc_hralterada = :hralterada, oc_idusualterou = :usuario WHERE oc_id = :ordemcorte');
        ParamByName('ordemcorte').AsInteger := strtoint(labNumeroOrd.Caption);
        ParamByname('dtfinalizacaocorte').AsDate := dataOrdemFinalizacao.Date;
        ParamByName('hrfinalizacaocorte').AsTime := horaOrdemFinalizacao.Time;
        ParamByName('prodAcabado').Value := strtoint(editCodigo.Text);
        ParamByName('observacao').Value := editObservacao.Text;
        ParamByName('dtinicioprevisto').AsDate := dataCortePrevisto.Date;
        ParamByName('hrinicioprevisto').AsTime := horaCortePrevisto.Time;
        ParamByName('dtfimprevisto').AsDate := dataFinalCortePrevisto.Date;
        ParamByName('hrfimprevisto').AsTime := horaFinalCortePrevisto.Time;
        ParamByName('dtinicioreal').AsDate := dataRealCortado.Date;
        ParamByName('hrinicioreal').AsTime := horaRealCortado.Time;
        ParamByName('dtfimreal').AsDate := dataFinalRealCortado.Date;
        ParamByName('hrfimreal').AsTime := horaFinalRealCortado.Time;
        ParamByName('dtalterada').AsDate := now;
        ParamByName('hralterada').AsTime := now;
        ParamByName('usuario').Value := 16;
        ExecSQL;
        tratarDataHora;
        Application.MessageBox('Ordem alterada com sucesso!', 'Ordem de Corte', mb_ok + mb_iconexclamation);
        butSairInicioCorteClick(Sender);
    end;
end;

procedure TformIniciarCorte.butDesistirClick(Sender: TObject);
begin
    dmOrdemCorte.tbOrdemdeCorte.Cancel;
    butDesistir.Enabled := false;
    butSalvar.Enabled := false;
    butCancelarOrdem.Enabled := false;
    butNovo.Enabled := true;
    butAlterar.Enabled := false;
end;

procedure TformIniciarCorte.butEditarClick(Sender: TObject);
begin
    if labNormal.Caption = 'FINALIZADA' then
        Application.MessageBox('N�o � permitido editar corte j� finalizado!', 'Ordem de Corte', mb_ok + mb_iconhand)
    else
        dmOrdemCorte.tbOrdemdeCorte.Edit;
        editCodigo.SetFocus;
        butNovo.Enabled := false;
        butDesistir.Enabled := true;
        butSalvar.Enabled := false;
        butAlterar.Visible := true;
        butCancelarOrdem.Enabled := true;
        butEditar.Enabled := false;
        butEscolherCores.Enabled := true;
end;

procedure TformIniciarCorte.butEscolherCoresClick(Sender: TObject);
begin
      acaoCoresExecute(Sender);
end;

procedure TformIniciarCorte.butNovoClick(Sender: TObject);
begin
    dmOrdemCorte.tbOrdemdeCorte.Open();
    dmOrdemCorte.tbOrdemdeCorte.Append;
    editCodigo.SetFocus;
    dataSolicitacao.Date := now;
    horaSolicitacao.Time := now;
    dataOrdemFinalizacao.Date := now;
    horaOrdemFinalizacao.Time := now;
    dataCortePrevisto.Date := now;
    horaCortePrevisto.Time := now;
    dataFinalCortePrevisto.Date := now;
    horaFinalCortePrevisto.Time := now;
    dataRealCortado.Date := now;
    horaRealCortado.Time := now;
    dataFinalRealCortado.Date := now;
    horaFinalRealCortado.Time := now;
    butNovo.Enabled := false;
    butSalvar.Enabled := true;
    butDesistir.Enabled := true;
    butAlterar.Visible := false;
end;

procedure TformIniciarCorte.butCancelarOrdemClick(Sender: TObject);
begin
    with application do
    begin
        if MessageBox('Deseja cancelar esta ordem de corte?', 'Ordem Corte', mb_iconquestion + mb_yesno + mb_applmodal) = IDYES then
            with dmOrdemCorte.qyDadosCorteById do
            begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE ordem_corte SET oc_situacao = 2, oc_dtcancelada = :datacancel, oc_hrcancelada = :horacancel, oc_usuidcancelada = 16');
                SQL.Add('WHERE oc_id = :ordemcorte');
                ParamByName('ordemcorte').AsInteger := strtoint(labNumeroOrd.Caption);
                ParamByName('datacancel').Value := now;
                ParamByName('horacancel').Value := now;
                ExecSQL;
                Application.MessageBox('Ordem cancelada com sucesso!', 'Ordem de Corte', mb_ok + mb_iconexclamation);
                butSairInicioCorteClick(Sender);
            end;
    end;
end;

procedure TformIniciarCorte.butSairInicioCorteClick(Sender: TObject);
begin
    formIniciarCorte.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible := true;
end;

procedure TformIniciarCorte.butSalvarClick(Sender: TObject);
var
        totalConsumo : real;
        processo : boolean;

begin
    {-----------VERIFICA SE HOUVE CANCELAMENTO PRA REFERENCIA ANTERIOR SEM EMPENHO DEVOLVIDO-----------}
    with dmOrdemCorte.qyOrdemDeCorte do
    begin
        Close;
        SQL.Text := 'SELECT * FROM controle_empenho';
        SQL.Add('WHERE emp_codprocesso = :fichatec');
        SQL.Add('AND emp_mod = ''0''');
        SQL.Add('AND emp_tipo = ''E''');
        SQL.Add('AND emp_situacao = ''N''');
        ParamByName('fichatec').AsInteger := strtoint(editFicha.Text);
        Open;
    end;
    if dmOrdemCorte.qyOrdemDeCorte.RecordCount > 0 then
    begin
        Application.MessageBox('Houve um cancelamento de ordem de corte anterior para essa refer�ncia com empenhos devolvidos para almoxarifado!',
        'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        Application.MessageBox('Solicite ao almoxarifado que processe o recebimento da devolu��o dos empenhos!', 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        exit;
    end;

    {-----------VERIFICA SE A GRADE EST� INCORRETA-----------}
    with dmOrdemCorte.qyGradeModificada do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   COUNT(oftr.oftr_id) AS oftr_id');
        SQL.Add('   FROM ordem_fabricacao_tamanhoreal AS oftr');
        SQL.Add('   JOIN ordem_producao AS op ON op.op_id = oftr.oftr_idordproducao');
        SQL.Add('   JOIN ordem_corte AS oc ON oc.oc_id = op.op_idordemcorte');
        SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_id = oc.oc_idfichatecnica');
        SQL.Add('   WHERE ft.fi_id = :fichatecnica AND ft.fi_situacao<>''C'' AND oc.oc_prototipo = :eprot');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        if labTipoCorte.Caption = 'Prototipo' then
           ParamByName('eprot').AsBoolean := true
        else
            ParamByName('eprot').AsBoolean := false;
        Open;
    end;

    if dmOrdemCorte.qyGradeModificada.FieldByName('oftr_id').Value > 0 then
    begin
        with dmOrdemCorte.qyGradeFicha do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   DISTINCT');
            SQL.Add('   (oftr.oftr_tam1) AS fti_tam1,');
            SQL.Add('   (oftr.oftr_tam2) AS fti_tam2,');
            SQL.Add('   (oftr.oftr_tam3) AS fti_tam3,');
            SQL.Add('   (oftr.oftr_tam4) AS fti_tam4,');
            SQL.Add('   (oftr.oftr_tam5) AS fti_tam5,');
            SQL.Add('   (oftr.oftr_tam6) AS fti_tam6,');
            SQL.Add('   (oftr.oftr_tam7) AS fti_tam7,');
            SQL.Add('   (oftr.oftr_tam8) AS fti_tam8,');
            SQL.Add('   (oftr.oftr_tam9) AS fti_tam9,');
            SQL.Add('   (oftr.oftr_tam10) AS fti_tam10,');
            SQL.Add('   (oftr.oftr_tam11) AS fti_tam11,');
            SQL.Add('   (oftr.oftr_tam12) AS fti_tam12,');
            SQL.Add('   (oftr.oftr_tam13) AS fti_tam13,');
            SQL.Add('   (oftr.oftr_tam14) AS fti_tam14,');
            SQL.Add('   (oftr.oftr_tam15) AS fti_tam15');
            SQL.Add('   FROM ordem_fabricacao_tamanhoreal AS oftr');
            SQL.Add('   JOIN ordem_producao AS op ON op.op_id = oftr.oftr_idordproducao');
            SQL.Add('   JOIN ordem_corte AS oc ON oc.oc_id = op.op_idordemcorte');
            SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_id = oc.oc_idfichatecnica');
            SQL.Add('   WHERE ft.fi_id = :fichatecnica AND ft.fi_situacao<>''C''');
            ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
            Open;
        end;
    end
    else
    begin
        with dmOrdemCorte.qyGradeFicha do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   DISTINCT');
            SQL.Add('   COALESCE(fti_tam1, '' '') AS fti_tam1,');
            SQL.Add('   COALESCE(fti_tam2, '' '') AS fti_tam2,');
            SQL.Add('   COALESCE(fti_tam3, '' '') AS fti_tam3,');
            SQL.Add('   COALESCE(fti_tam4, '' '') AS fti_tam4,');
            SQL.Add('   COALESCE(fti_tam5, '' '') AS fti_tam5,');
            SQL.Add('   COALESCE(fti_tam6, '' '') AS fti_tam6,');
            SQL.Add('   COALESCE(fti_tam7, '' '') AS fti_tam7,');
            SQL.Add('   COALESCE(fti_tam8, '' '') AS fti_tam8,');
            SQL.Add('   COALESCE(fti_tam9, '' '') AS fti_tam9,');
            SQL.Add('   COALESCE(fti_tam10, '' '') AS fti_tam10,');
            SQL.Add('   COALESCE(fti_tam11, '' '') AS fti_tam11,');
            SQL.Add('   COALESCE(fti_tam12, '' '') AS fti_tam12,');
            SQL.Add('   COALESCE(fti_tam13, '' '') AS fti_tam13,');
            SQL.Add('   COALESCE(fti_tam14, '' '') AS fti_tam14,');
            SQL.Add('   COALESCE(fti_tam15, '' '') AS fti_tam15');
            SQL.Add('   FROM ficha_tecnica_itens AS fti');
            SQL.Add('   WHERE fti_idfichatec = :fichatecnica AND fti_status<>''C''');
            ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
            Open;
        end;
    end;
    with dmOrdemCorte.qyFichaId do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   *');
        SQL.Add('   FROM ficha_tecnica');
        SQL.Add('   WHERE fi_id = :fichatecnica');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
    end;
    if dmOrdemCorte.qyGradeFicha.RecordCount > 1 then
    begin
        Application.MessageBox(PChar('Grade incorreta na Ficha Tecnica: '+ intTostr(dmOrdemCorte.qyFichaId.FieldByName('fi_id').Value)), 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        exit;
    end;

    {-----------VERIFICA SE FICHA TECNICA ESTA SEM GRADE-----------}
    with dmOrdemCorte.qyFichaSemGrade do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   (fti.fti_id) AS itemId,');
        SQL.Add('   (ftq.fti_id) gradeId');
        SQL.Add('   FROM ficha_tecnica_itens AS fti');
        SQL.Add('   LEFT JOIN ficha_tecnica_qtdtamanho AS ftq ON fti.fti_cortecidoidgrade = ftq.fti_cortecidoidgrade');
        SQL.Add('   AND ftq.fti_idfichatec = fti.fti_idfichatec');
        SQL.Add('   WHERE fti.fti_idfichatec = :fichatecnica');
        SQL.Add('   AND fti.fti_tipo=''P''');
        SQL.Add('   AND fti.fti_tecido=''A''');
        SQL.Add('   AND fti.fti_status<>''C''');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
    end;
    if dmOrdemCorte.qyFichaSemGrade.FieldByName('gradeId').Value = null then
    begin
        Application.MessageBox('Ficha tecnica sem grade informada!', 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        exit;
    end;

    {-----------VERIFICA SE A LINHA 120 EST� INFORMA EM REFERENCIA DE SARJA OU JEANS (N�O PODE LINHA 120 NESSA SITUA��O)-----------}
    with dmOrdemCorte.qyLinha120 do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT (TRUE) AS existe FROM ficha_tecnica_itens AS fti');
        SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_id = fti.fti_idfichatec');
        SQL.Add('   JOIN produto_acabado AS pa ON pa.cad_id = ft.fi_idprodutoacabado');
        SQL.Add('   JOIN tipo_tecido AS tt ON tt.tec_id = pa.cad_idtipotecido');
        SQL.Add('   WHERE (');
        SQL.Add('           (SELECT conf_idsubgrupotecjeans_cadprod FROM configuracao LIMIT 1)=tt.tec_id OR');
        SQL.Add('           (SELECT conf_idsubgrupotecsarja_cadprod FROM configuracao LIMIT 1)=tt.tec_id');
        SQL.Add('          )');
        SQL.Add('   AND fti.fti_status<>''C''');
        SQL.Add('   AND fti.fti_idproduto = 2296');
        SQL.Add('   AND fti.fti_idgradetam = 439');
        SQL.Add('   AND EXISTS (');
        SQL.Add('                 SELECT * FROM ficha_tecnica_itensfase AS ftf WHERE ftf.ftf_iditemfichatecnica=fti.fti_id');
        SQL.Add('                 AND ftf.ftf_idfaseproducao=10');
        SQL.Add('               )');
        SQL.Add('   AND fti.fti_idfichatec = :fichatecnica');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if dmOrdemCorte.qyLinha120.FieldByName('existe').Value = true then
        begin
            Application.MessageBox('Ordem de corte n�o pode ser criada porque existe linha 120 lan�ada na costura!','Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
            Application.MessageBox('Linha T�tulo 120 n�o � comum ser usado na fase de costura quando o segmento do tecido for JEANS ou SARJA.','Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
            with application do
            begin
                if MessageBox('Deseja mesmo assim continuar o procedimento?', 'Ordem Corte', mb_iconquestion + mb_yesno + mb_applmodal) = IDNO then
                exit;
            end;
        end
    end;

    {-----------VERIFICA SE EXISTE ARTIGO DA REFERENCIA SEM FASE INFORMADA NA FICHA TECNICA-----------}
    with dmOrdemCorte.qyFaseInformada do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_itens WHERE');
        SQL.Add('   fti_idfichatec = :fichatecnica AND fti_status = ''N''');
        SQL.Add('   AND fti_tecido = ''N'' AND fti_id NOT IN(');
        SQL.Add('   SELECT ftf_iditemfichatecnica FROM ficha_tecnica_itensfase)');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if dmOrdemCorte.qyFaseInformada.RecordCount > 0 then
        begin
            Application.MessageBox('Existe artigo na ficha tecnica sem fase informada!', 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
            exit;
        end;
    end;

    {-----------VERIFICA SE O TAMANHO E COR DO PROTOTIPO CONDIZ COM A GRADE E COR DA REFERENCIA-----------}
    with dmOrdemCorte.qyFichaPrototipo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_prototipo WHERE');
        SQL.Add('   fp_idfichatec = :fichatecnica');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if labTipoCorte.Caption = 'Prototipo' then
            if dmOrdemCorte.qyFichaPrototipo.RecordCount = 0 then
            begin
                Application.MessageBox('O prot�tipo n�o foi informado na ficha tecnica, por favor re-abra a ficha tecnica e informe o tamanho e cor do prot�tipo',
                'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
                exit;
            end;
    end;
    with dmOrdemCorte.qyCorGradeProt do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   *');
        SQL.Add('   FROM ficha_tecnica_itens, ficha_tecnica_prototipo');
        SQL.Add('   WHERE fti_idfichatec = :fichatecnica');
        SQL.Add('   AND fp_idfichatec = :fichatecnica');
        SQL.Add('   AND fti_status=''N''');
        SQL.Add('   AND fti_tipo=''P''');
        SQL.Add('   AND fti_cortecidoidgrade = fp_cortecido');
        SQL.Add('   AND');
        SQL.Add('         (');
        SQL.Add('             fti_tam1=fp_tamanho OR fti_tam2=fp_tamanho OR fti_tam3=fp_tamanho OR fti_tam4=fp_tamanho OR fti_tam5=fp_tamanho OR');
        SQL.Add('             fti_tam6 =fp_tamanho OR fti_tam7=fp_tamanho OR fti_tam8=fp_tamanho OR fti_tam9=fp_tamanho OR fti_tam10=fp_tamanho OR');
        SQL.Add('             fti_tam11=fp_tamanho OR fti_tam12=fp_tamanho OR fti_tam13=fp_tamanho OR fti_tam14=fp_tamanho OR fti_tam15=fp_tamanho');
        SQL.Add('         )');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if labTipoCorte.Caption = 'Prototipo' then
            if dmOrdemCorte.qyCorGradeProt.RecordCount = 0 then
            begin
                Application.MessageBox('O tamanho do prototipo est� fora da grade e/ou a cor diferente da programada, por favor ajuste a informa��o do prototipo na ficha tecnica',
                'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
                exit;
            end;
    end;

    {-----------VERIFICA SE EXISTE MAIS DE UMA TECIDO PRINCIPAL PARA MESMA COR INSERIDO NA FICHA TECNICA-----------}
    with dmOrdemCorte.qyTecidoPrincipal do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT fti_cortecidoidgrade, count(fti_id) as qtdPrincipal FROM ficha_tecnica_itens');
        SQL.Add('   WHERE fti_idfichatec = :fichatecnica AND');
        SQL.Add('   fti_tipo =''P'' AND');
        SQL.Add('   fti_status=''N''');
        SQL.Add('   GROUP BY fti_cortecidoidgrade');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if dmOrdemCorte.qyTecidoPrincipal.FieldByName('qtdPrincipal').Value > 1 then
        begin
            Application.MessageBox('H� mais de um tecido principal na ficha tecnica, por favor realize o ajuste!', 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
            exit;
        end;
    end;

    {-----------VERIFICA SE A COR DE REFERENCIA EST� DIFERENTE DA COR DO ARTIGO-----------}
    with dmOrdemCorte.qyRefArtigoCor do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_itens AS fti');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id=fti.fti_idproduto');
        SQL.Add('   WHERE');
        SQL.Add('   fti.fti_idfichatec = :fichatecnica');
        SQL.Add('   AND fti.fti_status = ''N''');
        SQL.Add('   AND fti_tecido = ''A''');
        SQL.Add('   AND fti_tipo = ''P''');
        SQL.Add('   AND fti_cortecidoidgrade = fti_idgradecor');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if dmOrdemCorte.qyRefArtigoCor.RecordCount = 0 then
        begin
            Application.MessageBox('Cor de refer�ncia diferente da cor do tecido principal!', 'Ordem de Corte', mb_ok + mb_iconhand);
            exit;
        end;
     end;

     {-----------VERIFICA SE EXISTE ALGUM ITEM COM ESTOQUE INFERIOR (PRODU��O)-----------}
     if labTipoCorte.Caption = 'Grande Escala' then
         with dmOrdemCorte.qyAviamentosPorFicha do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('    cp.cp_id,');
            SQL.Add('    gc.grc_id,');
            SQL.Add('    gt.grt_id,');
            SQL.Add('    cp.cp_descricao,');
            SQL.Add('    (COALESCE(gc.grc_codexterno, '''') ||'' - '' || TRIM(gc.grc_nome)) AS grc_nome,');
            SQL.Add('    gt.grt_nome,');
            SQL.Add('    fti.*');
            SQL.Add('    FROM ficha_tecnica_itens AS fti');
            SQL.Add('    JOIN cadastro_produto AS cp ON cp.cp_id = fti.fti_idproduto');
            SQL.Add('    JOIN grade_cor AS gc on gc.grc_id = fti.fti_idgradecor');
            SQL.Add('    JOIN grade_cor AS gc_pa on gc_pa.grc_id = fti.fti_cortecidoidgrade');
            SQL.Add('    JOIN grade_tamanho AS gt on gt.grt_id = fti.fti_idgradetam');
            SQL.Add('    WHERE');
            SQL.Add('    fti.fti_idfichatec = :fichatecnica');
            SQL.Add('    AND fti.fti_status = ''N''');
            SQL.Add('    AND fti.fti_tecido = ''N''');
            ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
            Open;
            dmOrdemCorte.qyAviamentosPorFicha.First;
            while not dmOrdemCorte.qyAviamentosPorFicha.Eof do
            begin
                with dmOrdemCorte.qyEstoqueSemReservaProt do
                 begin
                     Close;
                     SQL.Clear;
                     SQL.Add('SELECT DISTINCT');
                     SQL.Add('    e.es_id,');
                     SQL.Add('    e.es_codloja,');
                     SQL.Add('    e.es_codproduto,');
                     SQL.Add('    e.es_idgradecor,');
                     SQL.Add('    e.es_idgradetam,');
                     SQL.Add('    cp.cp_descricao,');
                     SQL.Add('    gc.grc_nome,');
                     SQL.Add('    gt.grt_nome,');
                     SQL.Add('    e.es_metragemrolo,');
                     SQL.Add('    COALESCE(e.es_custoatual, 0) AS es_custoatual,');
                     SQL.Add('    e.es_numrolo,');
                     SQL.Add('        (');
                     SQL.Add('            (');
                     SQL.Add('                COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
                     SQL.Add('                COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
                     SQL.Add('            ) -');
                     SQL.Add('            (');
                     SQL.Add('                COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
                     SQL.Add('            ) -');
                     SQL.Add('            (');
                     SQL.Add('                COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
                     SQL.Add('            )');
                     SQL.Add('       ) AS disponivel,');
                     SQL.Add('       (');
                     SQL.Add('            (');
                     SQL.Add('                COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
                     SQL.Add('                COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
                     SQL.Add('            ) -');
                     SQL.Add('            (');
                     SQL.Add('                COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
                     SQL.Add('            )');
                     SQL.Add('       ) AS fisico');
                     SQL.Add('       FROM estoque AS e');
                     SQL.Add('       JOIN cadastro_produto As cp On e.es_codproduto = cp.cp_id');
                     SQL.Add('       JOIN grade_cor As gc On gc.grc_id = e.es_idgradecor');
                     SQL.Add('       JOIN grade_tamanho As gt On gt.grt_id = e.es_idgradetam');
                     SQL.Add('       WHERE gc.grc_id = :gradecor');
                     SQL.Add('       AND gt.grt_id = :gradetamanho');
                     SQL.Add('       AND cp.cp_id = :cadastroproduto');
                     SQL.Add('       AND');
                     SQL.Add('            (');
                     SQL.Add('                (');
                     SQL.Add('                    COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
                     SQL.Add('                    COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
                     SQL.Add('                ) -');
                     SQL.Add('                (');
                     SQL.Add('                    COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
                     SQL.Add('                )');
                     SQL.Add('            ) > 0');
                     SQL.Add('      ORDER BY disponivel ASC');
                     ParamByName('gradecor').AsInteger := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grc_id').Value;
                     ParamByName('gradetamanho').AsInteger := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grt_id').Value;
                     ParamByName('cadastroproduto').AsInteger := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('cp_id').Value;
                     Open;
                     totalConsumo := 0;
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade1').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade1').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr1').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade2').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade2').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr2').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade3').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade3').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr3').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade4').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade4').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr4').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade5').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade5').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr5').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade6').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade6').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr6').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade7').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade7').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr7').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade8').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade8').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr8').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade9').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade9').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr9').Value));
                     if dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade10').Value > 0 then
                          totalConsumo := totalConsumo + ((dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade10').Value) * (dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlr10').Value));

                     if dmOrdemCorte.qyEstoqueSemReservaProt.RecordCount = 0 then
                     begin
                          dmOrdemCorte.cdsProdSemEstoque.Append;
                          dmOrdemCorte.cdsProdSemEstoque.FieldByName('idProduto').AsInteger := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('cp_id').AsInteger;
                          dmOrdemCorte.cdsProdSemEstoque.FieldByName('Produto').AsString := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('cp_descricao').AsString;
                          dmOrdemCorte.cdsProdSemEstoque.FieldByName('Cor').AsString := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grc_nome').AsString;
                          dmOrdemCorte.cdsProdSemEstoque.FieldByName('Tamanho').AsString := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grt_nome').AsString;
                          dmOrdemCorte.cdsProdSemEstoque.FieldByName('Tipo').AsString := 'PRODUTO VIRTUAL';
                          dmOrdemCorte.cdsProdSemEstoque.FieldByName('Consumo').AsFloat := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlrtotal').Value;
                          dmOrdemCorte.cdsProdSemEstoque.FieldByName('Disponivel').AsFloat := 0;
                          dmOrdemCorte.cdsProdSemEstoque.Post;
//                        ShowMessage('PRODUTO VIRTUAL'+#13+#13+
//                                    'PRODUTO: ' + dmOrdemCorte.qyAviamentosPorFicha.FieldByName('cp_descricao').Value+#13+
//                                    'COR: ' + dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grc_nome').Value+#13+
//                                    'TAMANHO: ' + dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grt_nome').Value+#13+
//                                     '');
                          processo := false;
                     end
                     else
                        if totalConsumo > dmOrdemCorte.qyEstoqueSemReservaProt.FieldByName('disponivel').Value then
                        begin
                            dmOrdemCorte.cdsProdSemEstoque.Append;
                            dmOrdemCorte.cdsProdSemEstoque.FieldByName('idProduto').AsInteger := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('cp_id').AsInteger;
                            dmOrdemCorte.cdsProdSemEstoque.FieldByName('Produto').AsString := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('cp_descricao').AsString;
                            dmOrdemCorte.cdsProdSemEstoque.FieldByName('Cor').AsString := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grc_nome').AsString;
                            dmOrdemCorte.cdsProdSemEstoque.FieldByName('Tamanho').AsString := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grt_nome').AsString;
                            dmOrdemCorte.cdsProdSemEstoque.FieldByName('Tipo').AsString := 'SEM ESTOQUE';
                            dmOrdemCorte.cdsProdSemEstoque.FieldByName('Consumo').AsFloat := dmOrdemCorte.qyAviamentosPorFicha.FieldByName('fti_vlrtotal').Value;
                            dmOrdemCorte.cdsProdSemEstoque.FieldByName('Disponivel').AsFloat := dmOrdemCorte.qyEstoqueSemReservaProt.FieldByName('disponivel').Value;
                            dmOrdemCorte.cdsProdSemEstoque.Post;
//                           ShowMessage('PRODUTO SEM ESTOQUE'+#13+#13+
//                                      'PRODUTO: ' + dmOrdemCorte.qyAviamentosPorFicha.FieldByName('cp_descricao').Value+#13+
//                                      'COR: ' + dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grc_nome').Value+#13+
//                                      'TAMANHO: ' + dmOrdemCorte.qyAviamentosPorFicha.FieldByName('grt_nome').Value+#13+
//                                      '');
                            processo := false;
                        end;
                 end;
            dmOrdemCorte.qyAviamentosPorFicha.Next;
            end;
            if processo = false then
               begin
                    Application.MessageBox('Por este motivo(s) o corte n�o pode ser iniciado', 'Ordem de Corte', mb_ok + mb_iconhand);
                    with Application do
                    begin
                        if MessageBox('Clique em SIM se deseja permitir o avan�o da produ��o sem material, caso contr�rio clique em N�O', 'Ordem Corte', mb_iconquestion + mb_yesno + mb_applmodal) = IDYES then
                        begin
                            application.CreateForm(TformConfirmacaoAvancoProducao, formConfirmacaoAvancoProducao);
                            formConfirmacaoAvancoProducao.ShowModal;
                        end;
                        exit;
                    end;
               end;
         end;

     {-----------VERIFICA SE DATAS E HORARIOS EST�O CORRETOS-----------}
     tratarDataHora;

    {-----------VERIFICA SE EXISTE ORDEM JA ABERTA PARA REFERENCIA-----------}
    with dmOrdemCorte.qyCortePorTipoFichaId do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT *');
        SQL.Add('   FROM ordem_corte AS oc JOIN ficha_tecnica AS ft ON ft.fi_id = oc.oc_idfichatecnica');
        SQL.Add('   JOIN cadastro_empresa AS fab ON fab.em_id = ft.fi_idempresa');
        SQL.Add('   WHERE');
        SQL.Add('   oc.oc_idfichatecnica = :fichatecnica');
        SQL.Add('   AND oc.oc_prototipo = :eprototipo');
        SQL.Add('   AND oc.oc_situacao <> ''2''');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        if labTipoCorte.Caption = 'Prototipo' then
            ParamByName('eprototipo').AsBoolean := true
        else
            ParamByName('eprototipo').AsBoolean := false;
        Open;
        if dmOrdemCorte.qyCortePorTipoFichaId.RecordCount > 0 then
        begin
            if dmOrdemCorte.qyCortePorTipoFichaId.FieldByName('oc_prototipo').Value = true then
            begin
                Application.MessageBox('J� existe uma ordem de corte prot�tipo para essa referencia!', 'Ordem de Corte', mb_ok + mb_iconexclamation);
                exit;
            end
            else
                with application do
                begin
                     if MessageBox('J� existe uma ordem de corte grande escala para essa referencia'+#13+
                                    'Deseja mesmo assim continuar o procedimento?', 'Ordem Corte', mb_iconquestion + mb_yesno + mb_applmodal) = IDYES then
                          dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_ordem').Value := 2
                     else
                          exit;
                end;
        end
        else
            dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_ordem').Value := 1;
    end;

    {-----------VERIFICA SE TEM DOIS PROT�TIPOS-----------}
    with dmOrdemCorte.qyFichaPrototipo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_prototipo');
        SQL.Add('    WHERE fp_idfichatec = :fichatecnica');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if dmOrdemCorte.qyFichaPrototipo.RecordCount > 1 then
            with application do
            begin
                  if MessageBox('Foi programado dois prototipos para esta referencia.'+#13+
                                'Se a escolha de realizar dois prototipo estiver ERRADA,'+#13+
                                'ajuste na ficha tecnica, caso esteja CERTO clique em SIM', 'Ordem Corte', mb_iconquestion + mb_yesno + mb_applmodal) = IDNO then
                     exit;
            end;
    end;

    {-----------VERIFICA SE PODE ABRIR ORDEM GRANDE ESCALA-----------}
    with dmOrdemCorte.qyGEComOuSemProt do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_prototipo WHERE fp_idfichatec = :fichatecnica');
        SQL.Add('     AND EXISTS(');
        SQL.Add('         SELECT * FROM ordem_corte');
        SQL.Add('         WHERE oc_idfichatecnica=fp_idfichatec AND oc_prototipo = true');
        SQL.Add('      )');
        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;
        if labTipoCorte.Caption = 'Grande Escala' then
        begin
            if dmOrdemCorte.qyGEComOuSemProt.RecordCount > 0 then
            begin
                if dmOrdemCorte.qyGEComOuSemProt.FieldByName('fp_situacao').Value = 'N' then
                begin
                    Application.MessageBox('Prototipo em espera por aprova��o!', 'Ordem de Corte', mb_ok + mb_iconexclamation);
                    exit;
                end;
                if dmOrdemCorte.qyGEComOuSemProt.FieldByName('fp_situacao').Value = 'R' then
                begin
                    Application.MessageBox('Prot�tipo reprovado, por esse motivo produ��o n�o pode ser realizada', 'Ordem de Corte', mb_ok + mb_iconhand);
                    exit;
                end;
            end
            else
            begin
                with application do
                begin
                    if MessageBox('Refer�ncia sem prot�tipo!'+#13+
                    'Deseja mesmo assim abrir ordem de corte?', 'Ordem de Corte', mb_iconquestion + mb_yesno + mb_applmodal) = IDNO then
                    exit;
                end;
            end;
        end;
    end;

    {-----------VERIFICA SE H� INFORMA��ES DE CONSUMO DE FASE LAN�ADA GE-----------}
     with dmOrdemCorte.qyConsumoFaseGE do
     begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT cpi.cpi_idfase, cpi.cpi_nosequencial, fa.fa_nome FROM cadastro_processo_itens AS cpi');
        SQL.Add('     JOIN cadastro_processo AS cp ON cp.pce_id = cpi.cpi_idprocesso');
        SQL.Add('     JOIN produto_acabado AS pa ON pa.cad_idprocesso = cp.pce_id');
        SQL.Add('     JOIN fase_producao AS fa ON fa.fa_id = cpi.cpi_idfase');
        SQL.Add('     WHERE');
        SQL.Add('     pa.cad_id = :produtoacabado');
        SQL.Add('     AND cpi.cpi_idfase <> ''9''');
        SQL.Add('     AND cpi.cpi_idfase <> ''16''');
        SQL.Add('     ORDER BY cpi.cpi_nosequencial ASC');
        ParamByName('produtoacabado').AsInteger := strtoint(editCodigo.Text);
        Open;
     end;

    dmOrdemCorte.qyConsumoFaseGE.First;
    while not dmOrdemCorte.qyConsumoFaseGE.Eof do
    begin
         with dmOrdemCorte.qyFichaFaseGE do
         begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT *');
              SQL.Add('   FROM ficha_tecnica_itensfase');
              SQL.Add('   WHERE ftf_idfaseproducao = :idFase');
              SQL.add('   AND ftf_idfichatecnica = :fichatecnica');
              ParamByName('idFase').AsInteger := dmOrdemCorte.qyConsumoFaseGE.FieldByName('cpi_idfase').Value;
              ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
              Open;
              if labTipoCorte.Caption = 'Grande Escala' then
              begin
                  if dmOrdemCorte.qyFichaFaseGE.RecordCount = 0 then
                  begin
                      ShowMessage('SEM CONSUMO DE FASE LAN�ADA!' +#13+#13+
                                  'FASE: '+ dmOrdemCorte.qyConsumoFaseGE.FieldByName('fa_nome').Value);
                      exit;
                  end;
              end;
              dmOrdemCorte.qyConsumoFaseGE.Next;
         end;
    end;


    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_dtgerada').Value := now;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_hrgerada').Value := now;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_usugerou').Value := 16;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_dtsolicitacao').Value := dataSolicitacao.Date;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_horasolicitacao').Value := horaSolicitacao.Time;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_dtprevisaofinalizacao').Value := dataOrdemFinalizacao.Date;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_hrprevisaofinalizacao').Value := horaOrdemFinalizacao.Time;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_situacao').Value := 1;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_idcodprodutoacabado').Value := strtoint(editCodigo.Text);
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_observacao').Value := editObservacao.Text;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_idfichatecnica').Value := strtoint(editFicha.Text);
    if labTipoCorte.Caption = 'Prototipo' then
        dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_prototipo').Value := true
    else
        dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_prototipo').Value := false;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_idsetor').Value := 7;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_idsetorresponsavel').Value := 1;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_datapreviniciocorteprevisto').Value := dataCortePrevisto.Date;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_horapreviniciocorteprevisto').Value := horaCortePrevisto.Time;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_dataprevfimcorteprevisto').Value := dataFinalCortePrevisto.Date;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_horaprevfimcorteprevisto').Value := horaFinalCortePrevisto.Time;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_datapreviniciorealcortado').Value := dataRealCortado.Date;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_horapreviniciorealcortado').Value := horaRealCortado.Time;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_dataprevfimrealcortado').Value := dataFinalRealCortado.Date;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_horaprevfimrealcortado').Value := horaFinalRealCortado.Time;
    dmOrdemCorte.tbOrdemdeCorte.Post;
    butDesistir.Enabled := false;
    butSalvar.Enabled := false;
    butNovo.Enabled := true;
    butEscolherCores.Enabled := true;
    formPrincipal.butOrdemPesquisarClick(Sender);
    Application.MessageBox('Opera��o realizada com sucesso!', 'Ordem de Corte', mb_iconexclamation + mb_ok + mb_applmodal);
end;

procedure TformIniciarCorte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FreeAndNil(formIniciarCorte);
end;

procedure TformIniciarCorte.FormCreate(Sender: TObject);
begin
    butSalvar.Enabled := false;
    butCancelarOrdem.Enabled := false;
    butEditar.Enabled := false;
    butDesistir.Enabled := false;
    butAlterar.Visible := false;
    butEscolherCores.Enabled := false;
end;

procedure TformIniciarCorte.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 113 then
     begin
          try
             application.CreateForm(TformProdutoAcabado, formProdutoAcabado);
             formProdutoAcabado.ShowModal;
          finally
             FreeAndNil(formProdutoAcabado);
          end;
     end;
end;

procedure TformIniciarCorte.tratarDataHora;
begin
    if dataOrdemFinalizacao.Date < dataSolicitacao.Date then
    begin
        Application.MessageBox('Data de finaliza��o do corte n�o pode ser anterior a atual!', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if horaOrdemFinalizacao.Time < horaSolicitacao.Time then
    begin
        Application.MessageBox('Hor�rio de finaliza��o do corte n�o pode ser anterior a atual!','Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if dataCortePrevisto.Date < dataSolicitacao.Date then
    begin
         Application.MessageBox('Data de inicio do corte previsto n�o pode ser anterior a data de solicita��o do corte!', 'Ordem de Corte', mb_ok + mb_iconhand);
         abort;
    end;

    if horaCortePrevisto.Time < horaSolicitacao.Time then
    begin
        Application.MessageBox('Hor�rio de inicio do corte previsto n�o pode ser anterior ao hor�rio de solicita��o do corte!', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if dataFinalCortePrevisto.Date < dataCortePrevisto.Date then
    begin
        Application.MessageBox('Data de finaliza��o do corte previsto n�o pode ser anterior a data de inicio do corte previsto!', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if horaFinalCortePrevisto.Time < horaCortePrevisto.Time then
    begin
        Application.MessageBox('Hor�rio de finaliza��o do corte previsto n�o pode ser anterior ao hor�rio de inicio do corte previsto!', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if dataRealCortado.Date < dataFinalCortePrevisto.Date then
    begin
        Application.MessageBox('Data de inicio do real cortado n�o pode ser anterior a data de finaliza��o do corte previsto!', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if horaRealCortado.Time < horaFinalCortePrevisto.Time then
    begin
        Application.MessageBox('Hor�rio de inicio do real cortado n�o pode ser anterior ao hor�rio de finaliza��o do corte previsto!', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if dataFinalRealCortado.Date < dataRealCortado.Date then
    begin
        Application.MessageBox('Data de finaliza��o do real cortado n�o pode ser anterior a data de inicio do real cortado!', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;

    if horaFinalRealCortado.Time < horaRealCortado.Time then
    begin
        Application.MessageBox('Hor�rio de finaliza��o do corte real n�o pode ser anterior ao hor�rio de inicio do corte real', 'Ordem de Corte', mb_ok + mb_iconhand);
        abort;
    end;
end;

end.
