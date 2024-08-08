unit UnitIniciarCorte;

interface

uses
  System.RegularExpressions, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Def,FireDAC.Stan.Pool,FireDAC.Stan.Async,FireDAC.Phys,FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,FireDAC.VCLUI.Wait,FireDAC.Comp.UI,FireDAC.Comp.Client,
  FireDAC.Phys.MSAcc,FireDAC.Phys.MSAccDef,FireDAC.Stan.Param,
  FireDAC.DatS,FireDAC.DApt.Intf,FireDAC.DApt,FireDAC.Comp.DataSet;

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
        procedure abrirCores;
        procedure salvarCorte;
        procedure usuarioOutraOrdem;
        procedure iniciarPrevisto;
        procedure pegaIDOrdemCorte(cQy : TFDQuery);


  end;

var
  formIniciarCorte: TformIniciarCorte;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule, UnitHistoricOrdem,
  UnitOrdemCorteCores, UnitConfirmacaoAvancoProducao, UnitVerificaVersao,
  unitDMPrincipal, unitDMIniciarCorte, unitDMConfAvancoProducao;


{ESCOLHER CORES SERA RETIRADO DO PROJETO}
procedure TformIniciarCorte.abrirCores;
begin
     application.CreateForm(TformOrdemCorteCores, formOrdemCorteCores);
     formOrdemCorteCores.ShowModal;
end;

procedure TformIniciarCorte.acaoCoresExecute(Sender: TObject);

begin
    With dmIniciarCorte.qyOrdemIniciarCorte do
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
        Application.MessageBox('Selecione o produto', 'Ordem de Corte',MB_OK + MB_ICONINFORMATION);
        exit;
    end;
    if labTipoCorte.Caption = 'Prototipo' then
    begin
        Application.MessageBox('Este corte é prototipo e a cor de corte já foi definida na ficha tecnica, por este motivo a funcionalidade requerida foi vedada',
        'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        exit;
    end;
    if dmIniciarCorte.qyOrdemIniciarCorte.FieldByName('oc_situacao').Value = 3 then
    begin
        Application.MessageBox('Ordem de corte finalizada, por esse motivo é vedado qualquer modificação na ordem de corte', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        exit;
    end;
    With dmIniciarCorte.qyPrevisto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT oci_situacao_id FROM ordem_corte_itens_previsto');
        SQL.Add('WHERE oci_idocorte = :numerocorte');
        ParamByName('numerocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
    end;
    dmIniciarCorte.qyPrevisto.First;
    while not dmIniciarCorte.qyPrevisto.Eof do
    begin
        if dmIniciarCorte.qyPrevisto.FieldByName('oci_situacao_id').Value = 3 then
        begin
            Application.MessageBox('Corte sob empenho, por este motivo não é possivel mudar cores. Para fazer um nova cor inicie um outra ordem de corte para esta referencia',
            'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
            exit;
        end;
        dmIniciarCorte.qyPrevisto.Next;
    end;
        abrirCores;
end;

{-----------ALTERAÇÃO DO CORTE-----------}
procedure TformIniciarCorte.butAlterarClick(Sender: TObject);
begin

    try

        formPrincipal.IniciaTransacao;


        with dmIniciarCorte.qyDadosCorteById do
        begin
              Close;
              SQL.Clear;
              SQL.Add('UPDATE ordem_corte SET oc_dtprevisaofinalizacao = :dtfinalizacaocorte, oc_hrprevisaofinalizacao = :hrfinalizacaocorte,');
              SQL.Add('   oc_idcodprodutoacabado = :prodAcabado, oc_observacao = :observacao, oc_datapreviniciocorteprevisto = :dtinicioprevisto,');
              SQL.Add('   oc_horapreviniciocorteprevisto = :hrinicioprevisto, oc_dataprevfimcorteprevisto = :dtfimprevisto, oc_horaprevfimcorteprevisto = :hrfimprevisto,');
              SQL.Add('   oc_datapreviniciorealcortado = :dtinicioreal, oc_horapreviniciorealcortado = :hrinicioreal, oc_dataprevfimrealcortado = :dtfimreal,');
              SQL.Add('   oc_horaprevfimrealcortado = :hrfimreal, oc_dtalterada = :dtalterada, oc_hralterada = :hralterada, oc_idusualterou = :usuario WHERE oc_id = :ordemcorte');

              ParamByName('ordemcorte').AsInteger             :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
              ParamByname('dtfinalizacaocorte').AsDate        :=dataOrdemFinalizacao.Date;
              ParamByName('hrfinalizacaocorte').AsTime        :=horaOrdemFinalizacao.Time;
              ParamByName('prodAcabado').Value                :=strtoint(editCodigo.Text);
              ParamByName('observacao').Value                 :=editObservacao.Text;
              ParamByName('dtinicioprevisto').AsDate          :=dataCortePrevisto.Date;
              ParamByName('hrinicioprevisto').AsTime          :=horaCortePrevisto.Time;
              ParamByName('dtfimprevisto').AsDate             :=dataFinalCortePrevisto.Date;
              ParamByName('hrfimprevisto').AsTime             :=horaFinalCortePrevisto.Time;
              ParamByName('dtinicioreal').AsDate              :=dataRealCortado.Date;
              ParamByName('hrinicioreal').AsTime              :=horaRealCortado.Time;
              ParamByName('dtfimreal').AsDate                 :=dataFinalRealCortado.Date;
              ParamByName('hrfimreal').AsTime                 :=horaFinalRealCortado.Time;
              ParamByName('dtalterada').AsDate                :=now;
              ParamByName('hralterada').AsTime                :=now;
              ParamByName('usuario').AsInteger                :=strtoint(formPrincipal.labCodUsuario.Caption);
              ExecSQL;
              tratarDataHora;
              Application.MessageBox('Ordem alterada com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
              butSairInicioCorteClick(Sender);
        end;


        formPrincipal.ComitaTransacao;

    except
          on E: exception do
              begin
                   formPrincipal.DesfazTransacao;
                   Application.MessageBox(pchar('Erro ao alterar o corte! '+E.Message),'Erro', MB_ICONERROR);
                   Exit;
              end;
    end;

end;

procedure TformIniciarCorte.butDesistirClick(Sender: TObject);
begin
    dmIniciarCorte.tbOrdemdeCorte.Cancel;
    butDesistir.Enabled        :=false;
    butSalvar.Enabled          :=false;
    butCancelarOrdem.Enabled   :=false;
    butNovo.Enabled            :=true;
    butAlterar.Enabled         :=false;
end;

procedure TformIniciarCorte.butEditarClick(Sender: TObject);
begin
    if labNormal.Caption = 'FINALIZADA' then
    begin
        Application.MessageBox('Não é permitido editar corte já finalizado!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        exit;
    end
    else
        dmIniciarCorte.tbOrdemdeCorte.Edit;
        editCodigo.SetFocus;
        butNovo.Enabled             :=false;
        butDesistir.Enabled         :=true;
        butSalvar.Enabled           :=false;
        butAlterar.Visible          :=true;
        butCancelarOrdem.Enabled    :=true;
        butEditar.Enabled           :=false;
        butEscolherCores.Enabled    :=false;
end;

procedure TformIniciarCorte.butEscolherCoresClick(Sender: TObject);
begin
      acaoCoresExecute(Sender);
end;

procedure TformIniciarCorte.butNovoClick(Sender: TObject);
begin
    dmIniciarCorte.tbOrdemdeCorte.Open();
    dmIniciarCorte.tbOrdemdeCorte.Append;
    editCodigo.SetFocus;
    dataSolicitacao.Date            :=now;
    horaSolicitacao.Time            :=now;
    dataOrdemFinalizacao.Date       :=now;
    horaOrdemFinalizacao.Time       :=now;
    dataCortePrevisto.Date          :=now;
    horaCortePrevisto.Time          :=now;
    dataFinalCortePrevisto.Date     :=now;
    horaFinalCortePrevisto.Time     :=now;
    dataRealCortado.Date            :=now;
    horaRealCortado.Time            :=now;
    dataFinalRealCortado.Date       :=now;
    horaFinalRealCortado.Time       :=now;
    butNovo.Enabled                 :=false;
    butSalvar.Enabled               :=true;
    butDesistir.Enabled             :=true;
    butAlterar.Visible              :=false;
end;

{-----------CANCELAR O CORTE-----------}
procedure TformIniciarCorte.butCancelarOrdemClick(Sender: TObject);
begin
    with application do
    begin
        if MessageBox('Deseja cancelar esta ordem de corte?', 'Ordem Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
        begin
            try


            formPrincipal.IniciaTransacao;


            with dmIniciarCorte.qyDadosCorteById do
            begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE ordem_corte SET oc_situacao = 2, oc_dtcancelada = :datacancel, oc_hrcancelada = :horacancel, oc_usuidcancelada = :usuario');
                SQL.Add('WHERE oc_id = :ordemcorte');

                ParamByName('ordemcorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
                ParamByName('datacancel').Value := now;
                ParamByName('horacancel').Value := now;
                ParamByName('usuario').AsInteger :=strtoint(formPrincipal.labCodUsuario.Caption);
                ExecSQL;
                Application.MessageBox('Ordem cancelada com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                butSairInicioCorteClick(Sender);
                dmPrincipal.qyOrdemCorte.Refresh;
            end;


            formPrincipal.ComitaTransacao;

            except
                 on E: exception do
                 begin
                   formPrincipal.DesfazTransacao;
                   Application.MessageBox(pchar('Erro ao cancelar o corte! '+E.Message),'Erro', MB_ICONERROR);
                   Exit;
                 end;
            end;
        end;
    end;
end;

procedure TformIniciarCorte.butSairInicioCorteClick(Sender: TObject);
begin
    formIniciarCorte.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible :=true;
end;

procedure TformIniciarCorte.butSalvarClick(Sender: TObject);
var
        totalConsumo : real;
        processo : boolean;
        aux,msg : string;

begin
    {-----------VERIFICA SE HOUVE CANCELAMENTO PRA REFERENCIA ANTERIOR SEM EMPENHO DEVOLVIDO-----------}
    with dmIniciarCorte.qyOrdemDeCorte do
    begin
        Close;
        SQL.Text := 'SELECT * FROM controle_empenho';
        SQL.Add('WHERE emp_codprocesso = :fichatec');
        SQL.Add('AND emp_mod = ''0''');
        SQL.Add('AND emp_tipo = ''E''');
        SQL.Add('AND emp_situacao = ''N''');

        ParamByName('fichatec').AsInteger :=strtoint(editFicha.Text);
        Open;
    end;

    if dmIniciarCorte.qyOrdemDeCorte.RecordCount > 0 then
    begin
        Application.MessageBox('Houve um cancelamento de ordem de corte anterior para essa referência com empenhos devolvidos para almoxarifado!',
        'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        Application.MessageBox('Solicite ao almoxarifado que processe o recebimento da devolução dos empenhos!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    {-----------VERIFICA SE A GRADE ESTÁ INCORRETA-----------}
    with dmIniciarCorte.qyGradeModificada do
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

    if dmIniciarCorte.qyGradeModificada.FieldByName('oftr_id').Value > 0 then
    begin
        with dmIniciarCorte.qyGradeFicha do
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
        with dmIniciarCorte.qyGradeFicha do
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

    with dmIniciarCorte.qyFichaId do
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

    if dmIniciarCorte.qyGradeFicha.RecordCount > 1 then
    begin
        Application.MessageBox(PChar('Grade incorreta na Ficha Tecnica: '+ intTostr(dmIniciarCorte.qyFichaId.FieldByName('fi_id').Value)), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    {-----------VERIFICA SE FICHA TECNICA ESTA SEM GRADE-----------}
    with dmIniciarCorte.qyFichaSemGrade do
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

    if dmIniciarCorte.qyFichaSemGrade.FieldByName('gradeId').Value = null then
    begin
        Application.MessageBox('Ficha tecnica sem grade informada!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    {-----------VERIFICA SE A LINHA 120 ESTÁ INFORMA EM REFERENCIA DE SARJA OU JEANS (NÃO PODE LINHA 120 NESSA SITUAÇÃO)-----------}
    with dmIniciarCorte.qyLinha120 do
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

        if dmIniciarCorte.qyLinha120.FieldByName('existe').Value = true then
        begin
            Application.MessageBox('Ordem de corte não pode ser criada porque existe linha 120 lançada na costura!','Ordem de Corte', MB_OK + MB_ICONINFORMATION);
            Application.MessageBox('Linha Título 120 não é comum ser usado na fase de costura quando o segmento do tecido for JEANS ou SARJA.','Ordem de Corte', MB_OK + MB_ICONINFORMATION);
            with application do
            begin
                if MessageBox('Deseja mesmo assim continuar o procedimento?', 'Ordem Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDNO then
                exit;
            end;
        end
    end;

    {-----------VERIFICA SE EXISTE ARTIGO DA REFERENCIA SEM FASE INFORMADA NA FICHA TECNICA-----------}
    with dmIniciarCorte.qyFaseInformada do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_itens WHERE');
        SQL.Add('   fti_idfichatec = :fichatecnica AND fti_status = ''N''');
        SQL.Add('   AND fti_tecido = ''N'' AND fti_id NOT IN(');
        SQL.Add('   SELECT ftf_iditemfichatecnica FROM ficha_tecnica_itensfase)');

        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;

        if dmIniciarCorte.qyFaseInformada.RecordCount > 0 then
        begin
            Application.MessageBox('Existe artigo na ficha tecnica sem fase informada!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
            exit;
        end;
    end;

    {-----------VERIFICA SE O TAMANHO E COR DO PROTOTIPO CONDIZ COM A GRADE E COR DA REFERENCIA-----------}
    with dmIniciarCorte.qyFichaPrototipo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_prototipo WHERE');
        SQL.Add('   fp_idfichatec = :fichatecnica');

        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        Open;

        if labTipoCorte.Caption = 'Prototipo' then
        begin
            if dmIniciarCorte.qyFichaPrototipo.RecordCount = 0 then
            begin
                Application.MessageBox('O protótipo não foi informado na ficha tecnica, por favor re-abra a ficha tecnica e informe o tamanho e cor do protótipo',
                'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                exit;
            end;
        end;
    end;

    with dmIniciarCorte.qyCorGradeProt do
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
        begin
            if dmIniciarCorte.qyCorGradeProt.RecordCount = 0 then
            begin
                Application.MessageBox('O tamanho do prototipo está fora da grade e/ou a cor diferente da programada, por favor ajuste a informação do prototipo na ficha tecnica',
                'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                exit;
            end;
        end;
    end;

    {-----------VERIFICA SE EXISTE MAIS DE UMA TECIDO PRINCIPAL PARA MESMA COR INSERIDO NA FICHA TECNICA-----------}
    with dmIniciarCorte.qyTecidoPrincipal do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT fti_cortecidoidgrade, count(fti_id) as qtdPrincipal FROM ficha_tecnica_itens');
        SQL.Add('   WHERE fti_idfichatec = :fichatecnica AND');
        SQL.Add('   fti_tipo =''P'' AND');
        SQL.Add('   fti_status=''N''');
        SQL.Add('   GROUP BY fti_cortecidoidgrade');

        ParamByName('fichatecnica').AsInteger :=strtoint(editFicha.Text);
        Open;

        if dmIniciarCorte.qyTecidoPrincipal.FieldByName('qtdPrincipal').Value > 1 then
        begin
            Application.MessageBox('Há mais de um tecido principal na ficha tecnica, por favor realize o ajuste!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
            exit;
        end;
    end;

    {-----------VERIFICA SE A COR DE REFERENCIA ESTÁ DIFERENTE DA COR DO ARTIGO-----------}
    with dmIniciarCorte.qyRefArtigoCor do
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

        ParamByName('fichatecnica').AsInteger :=strtoint(editFicha.Text);
        Open;

        if dmIniciarCorte.qyRefArtigoCor.RecordCount = 0 then
        begin
            Application.MessageBox('Cor de referência diferente da cor do tecido principal!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
            exit;
        end;
     end;

     {-----------VERIFICA SE EXISTE ALGUM ITEM COM ESTOQUE INFERIOR (PRODUÇÃO)-----------}
     if labTipoCorte.Caption = 'Grande Escala' then
         with dmIniciarCorte.qyAviamentosPorFicha do
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

            ParamByName('fichatecnica').AsInteger :=strtoint(editFicha.Text);
            Open;

            dmIniciarCorte.qyAviamentosPorFicha.First;
            while not dmIniciarCorte.qyAviamentosPorFicha.Eof do
            begin
                with dmIniciarCorte.qyEstoqueSemReservaProt do
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

                     ParamByName('gradecor').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grc_id').Value;
                     ParamByName('gradetamanho').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grt_id').Value;
                     ParamByName('cadastroproduto').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('cp_id').Value;
                     Open;

                     totalConsumo :=0;
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade1').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade1').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr1').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade2').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade2').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr2').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade3').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade3').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr3').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade4').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade4').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr4').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade5').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade5').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr5').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade6').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade6').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr6').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade7').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade7').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr7').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade8').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade8').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr8').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade9').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade9').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr9').Value));
                     if dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade10').Value > 0 then
                          totalConsumo := totalConsumo + ((dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_qtdade10').Value) * (dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlr10').Value));

                     if dmIniciarCorte.qyEstoqueSemReservaProt.RecordCount = 0 then
                     begin
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.Append;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('idProduto').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('cp_id').AsInteger;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Produto').AsString := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('cp_descricao').AsString;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Cor').AsString := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grc_nome').AsString;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Tamanho').AsString := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grt_nome').AsString;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Tipo').AsString := 'PRODUTO VIRTUAL';
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Consumo').AsFloat := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlrtotalsemprototipo').Value;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Disponivel').AsFloat := 0;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('codCor').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grc_id').AsInteger;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('codTamanho').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grt_id').AsInteger;
                          dmConfirmacaoAvancoProducao.cdsProdSemEstoque.Post;
                          aux:= 'PRODUTOS SEM ESTOQUE'+#13+#13+
                                'Por este motivo(s) o corte não pode ser iniciado!'+#13+#13+
                                'Clique em SIM se deseja permitir o avanço da produção sem material, caso contrário clique em NÃO'+#13;
                          processo :=false;
                          break;
                     end
                     else
                     begin
                        if totalConsumo > dmIniciarCorte.qyEstoqueSemReservaProt.FieldByName('disponivel').Value then
                        begin
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.Append;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('idProduto').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('cp_id').AsInteger;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Produto').AsString := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('cp_descricao').AsString;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Cor').AsString := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grc_nome').AsString;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Tamanho').AsString := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grt_nome').AsString;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Tipo').AsString := 'SEM ESTOQUE';
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Consumo').AsFloat := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('fti_vlrtotalsemprototipo').Value;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('Disponivel').AsFloat := dmIniciarCorte.qyEstoqueSemReservaProt.FieldByName('disponivel').Value;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('codCor').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grc_id').AsInteger;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.FieldByName('codTamanho').AsInteger := dmIniciarCorte.qyAviamentosPorFicha.FieldByName('grt_id').AsInteger;
                            dmConfirmacaoAvancoProducao.cdsProdSemEstoque.Post;
                            aux:= 'PRODUTOS SEM ESTOQUE'+#13+#13+
                                  'Por este motivo(s) o corte não pode ser iniciado!'+#13+#13+
                                  'Clique em SIM se deseja permitir o avanço da produção sem material, caso contrário clique em NÃO'+#13;
                            processo :=false;
                        end;
                     end;
                     if totalConsumo < dmIniciarCorte.qyEstoqueSemReservaProt.FieldByName('disponivel').Value then
                       processo :=true;
                end;
            dmIniciarCorte.qyAviamentosPorFicha.Next;
            end;
            if processo = false then
            begin
                with Application do
                begin
                    if MessageBox(PChar(aux), 'Ordem Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                    begin
                        application.CreateForm(TformConfirmacaoAvancoProducao, formConfirmacaoAvancoProducao);
                        formConfirmacaoAvancoProducao.ShowModal;
                    end;
                end;
            end;
         end;

     {-----------VERIFICA SE DATAS E HORARIOS ESTÃO CORRETOS-----------}
      tratarDataHora;

    {-----------VERIFICA SE EXISTE ORDEM JA ABERTA PARA REFERENCIA-----------}
    with dmIniciarCorte.qyCortePorTipoFichaId do
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
        SQL.Add('   ORDER BY oc_id DESC');

        ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
        if labTipoCorte.Caption = 'Prototipo' then
            ParamByName('eprototipo').AsBoolean := true
        else
            ParamByName('eprototipo').AsBoolean := false;
        Open;
    end;

    if dmIniciarCorte.qyCortePorTipoFichaId.RecordCount > 0 then
    begin
        if dmIniciarCorte.qyCortePorTipoFichaId.FieldByName('oc_prototipo').Value = true then
        begin
            Application.MessageBox('Já existe uma ordem de corte protótipo para essa referencia!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
            exit;
        end
        else
        begin
            with application do
            begin
                 if MessageBox('Já existe uma ordem de corte grande escala para essa referencia'+#13+
                                'Deseja mesmo assim continuar o procedimento?', 'Ordem Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                 begin
                      usuarioOutraOrdem;
                 end
                 else
                      exit;
            end;
        end;
    end
    else
    begin

        try


            formPrincipal.IniciaTransacao;


            dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_ordem').AsInteger := 1;


            formPrincipal.ComitaTransacao;

        except
              on E: exception do
              begin
                   formPrincipal.DesfazTransacao;
                   Application.MessageBox(pchar('Erro ao inserir o nºordem! '+E.Message),'Erro', MB_ICONERROR);
                   Exit;
              end;
        end;

        end;
//        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_ordem').AsInteger := 1;

    {-----------VERIFICA SE TEM DOIS PROTÓTIPOS-----------}
    with dmIniciarCorte.qyFichaPrototipo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_prototipo');
        SQL.Add('    WHERE fp_idfichatec = :fichatecnica');

        ParamByName('fichatecnica').AsInteger :=strtoint(editFicha.Text);
        Open;
    end;

    if dminiciarCorte.qyFichaPrototipo.RecordCount > 1 then
    begin
        with application do
        begin
              if MessageBox('Foi programado dois prototipos para esta referencia.'+#13+
                            'Se a escolha de realizar dois prototipo estiver ERRADA,'+#13+
                            'ajuste na ficha tecnica, caso esteja CERTO clique em SIM', 'Ordem Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDNO then

                    exit;
        end;
    end;

    {-----------VERIFICA SE PODE ABRIR ORDEM GRANDE ESCALA-----------}
    with dmIniciarCorte.qyGEComOuSemProt do
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
    end;

    if labTipoCorte.Caption = 'Grande Escala' then
    begin
        if dmIniciarCorte.qyGEComOuSemProt.RecordCount > 0 then
        begin
            if dmIniciarCorte.qyGEComOuSemProt.FieldByName('fp_situacao').Value = 'N' then
            begin
                Application.MessageBox('Prototipo em espera por aprovação!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                exit;
            end;
            if dmIniciarCorte.qyGEComOuSemProt.FieldByName('fp_situacao').Value = 'R' then
            begin
                Application.MessageBox('Protótipo reprovado, por esse motivo produção não pode ser realizada', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                exit;
            end;
        end
        else
        begin
            with application do
            begin
                if MessageBox('Referência sem protótipo!'+#13+
                'Deseja mesmo assim abrir ordem de corte?', 'Ordem de Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDNO then
                exit;
            end;
        end;
    end;


    {-----------VERIFICA SE HÁ INFORMAÇÕES DE CONSUMO DE FASE LANÇADA GE-----------}
     with dmIniciarCorte.qyConsumoFaseGE do
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

    dminiciarCorte.qyConsumoFaseGE.First;
    while not dmIniciarCorte.qyConsumoFaseGE.Eof do
    begin
         with dmIniciarCorte.qyFichaFaseGE do
         begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT *');
              SQL.Add('   FROM ficha_tecnica_itensfase');
              SQL.Add('   WHERE ftf_idfaseproducao = :idFase');
              SQL.add('   AND ftf_idfichatecnica = :fichatecnica');

              ParamByName('idFase').AsInteger := dmIniciarCorte.qyConsumoFaseGE.FieldByName('cpi_idfase').Value;
              ParamByName('fichatecnica').AsInteger := strtoint(editFicha.Text);
              Open;

              msg:='SEM CONSUMO DE FASE LANÇADA!' +#13+#13+
                    'FASE: '+ dmIniciarCorte.qyConsumoFaseGE.FieldByName('fa_nome').Value;
              if labTipoCorte.Caption = 'Grande Escala' then
              begin
                  if dmIniciarCorte.qyFichaFaseGE.RecordCount = 0 then
                  begin
                      Application.MessageBox(PChar(msg), 'Ordem de Corte',MB_OK + MB_ICONINFORMATION);
                      exit;
                  end;
              end;
              dmIniciarCorte.qyConsumoFaseGE.Next;
         end;
    end;
    salvarCorte;
    iniciarPrevisto;
    Application.MessageBox('Operação realizada com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
    dmPrincipal.qyOrdemCorte.Refresh;
end;

procedure TformIniciarCorte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FreeAndNil(formIniciarCorte);
end;

procedure TformIniciarCorte.FormCreate(Sender: TObject);
begin
    butSalvar.Enabled           :=false;
    butCancelarOrdem.Enabled    :=false;
    butEditar.Enabled           :=false;
    butDesistir.Enabled         :=false;
    butAlterar.Visible          :=false;
    butEscolherCores.Enabled    :=false;
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

procedure TformIniciarCorte.iniciarPrevisto;

var
    media, qtd, total, totalConsGE : double;
    msg1,msg2 : string;
    cQyConsIDCorte : TFDQuery;

begin

     Try

              with dmIniciarCorte.qyItensFichaPrevisto do
              begin
                  Close;
                  SQL.Clear;
                  SQL.Add('SELECT * FROM ficha_tecnica_itens AS fti');
                  SQL.Add('JOIN ficha_tecnica_prototipo AS ftp ON');
                  SQL.Add('fti.fti_idfichatec = ftp.fp_idfichatec');
                  SQL.Add('JOIN cadastro_produto AS cp ON');
                  SQL.Add('cp.cp_id = fti.fti_idproduto');
                  SQL.Add('WHERE fti.fti_idfichatec =:ficha');
                  SQL.Add('AND fti.fti_status <> ''C''');

                  ParamByName('ficha').AsInteger := strtoint(editFicha.Text);
                  Open;
              end;

              if labTipoCorte.Caption = 'Prototipo' then
              begin

                   dmIniciarCorte.qyItensFichaPrevisto.First;

                   cQyConsIDCorte := TFDQuery.Create(nil);
                   cQyConsIDCorte.Connection := dmOrdemCorte.Conexao;

                   //Pega ID do corte
                   pegaIDOrdemCorte(cQyConsIDCorte);

                  Try

                     formPrincipal.IniciaTransacao;

                      while not dmIniciarCorte.qyItensFichaPrevisto.Eof do
                      begin

                          with dmIniciarCorte.tbOrdemCorteItensPrevisto do
                          begin

                               Close;
                               SQL.Clear;
                               SQL.Add('INSERT INTO ordem_corte_itens_previsto (');
                               SQL.Add('  oci_idocorte, oci_idproduto, oci_idcortecido, oci_dtlanc, oci_hrlanc, oci_codusulanc, oci_idgradetam,');
                               SQL.Add('  oci_un, oci_iditemficha, oci_situacao_id, oci_tipo, oci_tecido, oci_idgradecor, oci_idgradecorprodutoacabado,');
                               SQL.Add('  oci_tam1, oci_tam2, oci_tam3, oci_tam4, oci_tam5, oci_tam6, oci_tam7, oci_tam8, oci_tam9, oci_tam10,');
                               SQL.Add('  oci_tam11, oci_tam12, oci_tam13, oci_tam14, oci_tam15, oci_vlr1, oci_vlr2, oci_vlr3, oci_vlr4, oci_vlr5,');
                               SQL.Add('  oci_vlr6, oci_vlr7, oci_vlr8, oci_vlr9, oci_vlr10, oci_vlr11, oci_vlr12, oci_vlr13, oci_vlr14, oci_vlr15,');
                               SQL.Add('  oci_qtdade1, oci_qtdade2, oci_qtdade3, oci_qtdade4, oci_qtdade5, oci_qtdade6, oci_qtdade7, oci_qtdade8,');
                               SQL.Add('  oci_qtdade9, oci_qtdade10, oci_qtdade11, oci_qtdade12, oci_qtdade13, oci_qtdade14, oci_qtdade15,');
                               SQL.Add('  oci_vlrtotal, oci_vlrreserva, oci_vlrrestante)');
                               SQl.Add('VALUES(');
                               SQL.Add('  :idocorte, :idproduto, :idcortecido, :dtlanc, :hrlanc, :codusulanc, :idgradetam, :ociun, :iditemficha, :situacaoid,');
                               SQL.Add('  :ocitipo, :ocitecido, :idgradecor, :idgradecorprodutoacabado, :ocitam1, :ocitam2, :ocitam3, :ocitam4, :ocitam5,');
                               SQL.Add('  :ocitam6, :ocitam7, :ocitam8, :ocitam9, :ocitam10, :ocitam11, :ocitam12, :ocitam13, :ocitam14, :ocitam15,');
                               SQL.Add('  :ocivlr1, :ocivlr2, :ocivlr3, :ocivlr4, :ocivlr5, :ocivlr6, :ocivlr7, :ocivlr8, :ocivlr9, :ocivlr10, :ocivlr11,');
                               SQL.Add('  :ocivlr12, :ocivlr13, :ocivlr14, :ocivlr15, :ociqtdade1, :ociqtdade2, :ociqtdade3, :ociqtdade4, :ociqtdade5, :ociqtdade6,');
                               SQL.Add('  :ociqtdade7, :ociqtdade8, :ociqtdade9, :ociqtdade10, :ociqtdade11, :ociqtdade12, :ociqtdade13, :ociqtdade14, :ociqtdade15,');
                               SQL.Add('  :ocivlrtotal, :ocivlrreserva, :ocivlrrestante)');

                               ParamByName('idocorte').AsInteger                       :=cQyConsIDCorte.FieldByName('oc_id').AsInteger;
                               ParamByName('idproduto').AsInteger                      :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_idproduto').AsInteger;
                               ParamByName('idcortecido').AsInteger                    :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_cortecido').AsInteger;
                               ParamByName('dtlanc').AsDateTime                        :=now;
                               ParamByName('hrlanc').AsTime                            :=now;
                               ParamByName('codusulanc').AsInteger                     :=strtoInt(formPrincipal.labCodUsuario.Caption);
                               ParamByName('idgradetam').AsInteger                     :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_idgradetam').AsInteger;
                               ParamByName('ociun').AsString                           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('cp_un').AsString;
                               ParamByName('iditemficha').AsInteger                    :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_id').AsInteger;
                               ParamByName('situacaoid').AsInteger                     := 1;  //Situação do corte previsto inicia-se como NORMAL
                               ParamByName('ocitipo').AsString                         :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tipo').AsString;
                               if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tecido').AsString = 'A' then
                                  ParamByName('ocitecido').AsBoolean                   :=true
                               else
                                  ParamByName('ocitecido').AsBoolean                   :=false;
                               ParamByName('idgradecor').AsInteger                     :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_idgradecor').AsInteger;
                               ParamByName('idgradecorprodutoacabado').AsInteger       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_cortecidoidgrade').AsInteger;
                               ParamByName('ocitam1').AsString                         :='';
                               ParamByName('ocitam2').AsString                         :='';
                               ParamByName('ocitam3').AsString                         :='';
                               ParamByName('ocitam4').AsString                         :='';
                               ParamByName('ocitam5').AsString                         :='';
                               ParamByName('ocitam6').AsString                         :='';
                               ParamByName('ocitam7').AsString                         :='';
                               ParamByName('ocitam8').AsString                         :='';
                               ParamByName('ocitam9').AsString                         :='';
                               ParamByName('ocitam10').AsString                        :='';
                               ParamByName('ocitam11').AsString                        :='';
                               ParamByName('ocitam12').AsString                        :='';
                               ParamByName('ocitam13').AsString                        :='';
                               ParamByName('ocitam14').AsString                        :='';
                               ParamByName('ocitam15').AsString                        :='';
                               ParamByName('ocivlr1').AsFloat                          :=0;
                               ParamByName('ocivlr2').AsFloat                          :=0;
                               ParamByName('ocivlr3').AsFloat                          :=0;
                               ParamByName('ocivlr4').AsFloat                          :=0;
                               ParamByName('ocivlr5').AsFloat                          :=0;
                               ParamByName('ocivlr6').AsFloat                          :=0;
                               ParamByName('ocivlr7').AsFloat                          :=0;
                               ParamByName('ocivlr8').AsFloat                          :=0;
                               ParamByName('ocivlr9').AsFloat                          :=0;
                               ParamByName('ocivlr10').AsFloat                         :=0;
                               ParamByName('ocivlr11').AsFloat                         :=0;
                               ParamByName('ocivlr12').AsFloat                         :=0;
                               ParamByName('ocivlr13').AsFloat                         :=0;
                               ParamByName('ocivlr14').AsFloat                         :=0;
                               ParamByName('ocivlr15').AsFloat                         :=0;
                               ParamByName('ociqtdade1').AsFloat                       :=0;
                               ParamByName('ociqtdade2').AsFloat                       :=0;
                               ParamByName('ociqtdade3').AsFloat                       :=0;
                               ParamByName('ociqtdade4').AsFloat                       :=0;
                               ParamByName('ociqtdade5').AsFloat                       :=0;
                               ParamByName('ociqtdade6').AsFloat                       :=0;
                               ParamByName('ociqtdade7').AsFloat                       :=0;
                               ParamByName('ociqtdade8').AsFloat                       :=0;
                               ParamByName('ociqtdade9').AsFloat                       :=0;
                               ParamByName('ociqtdade10').AsFloat                      :=0;
                               ParamByName('ociqtdade11').AsFloat                      :=0;
                               ParamByName('ociqtdade12').AsFloat                      :=0;
                               ParamByName('ociqtdade13').AsFloat                      :=0;
                               ParamByName('ociqtdade14').AsFloat                      :=0;
                               ParamByName('ociqtdade15').AsFloat                      :=0;

                              {--16/06/2021 Prototipo passou a ser feito consumo pela media--}


                              if ParamByName('ocitecido').AsBoolean = true then
                              begin
                                  qtd:=0;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr1').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr2').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr3').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr4').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr5').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr6').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr7').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr8').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr9').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr10').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr11').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr12').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr13').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr14').AsFloat > 0 then
                                      qtd:=qtd+1;
                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr15').AsFloat > 0 then
                                      qtd:=qtd+1;

                                  media:=(dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr1').AsFloat+dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr2').AsFloat+
                                        dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr3').AsFloat+dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr4').AsFloat+
                                        dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr5').AsFloat+dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr6').AsFloat+
                                        dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr7').AsFloat+dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr8').AsFloat+
                                        dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr9').AsFloat+dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr10').AsFloat+
                                        dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr11').AsFloat+dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr12').AsFloat+
                                        dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr13').AsFloat+dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr14').AsFloat+
                                        dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr15').AsFloat)/qtd;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam1').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam1').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam1').AsString;
                                      ParamByName('ocivlr1').AsFloat            :=media;
                                      ParamByName('ociqtdade1').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam1').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam2').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam2').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam2').AsString;
                                      ParamByName('ocivlr2').AsFloat            :=media;
                                      ParamByName('ociqtdade2').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam2').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam3').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam3').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam3').AsString;
                                      ParamByName('ocivlr3').AsFloat            :=media;
                                      ParamByName('ociqtdade3').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam3').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam4').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam4').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam4').AsString;
                                      ParamByName('ocivlr4').AsFloat            :=media;
                                      ParamByName('ociqtdade4').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam4').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam5').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam5').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam5').AsString;
                                      ParamByName('ocivlr5').AsFloat            :=media;
                                      ParamByName('ociqtdade5').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam5').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam6').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam6').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam6').AsString;
                                      ParamByName('ocivlr6').AsFloat            :=media;
                                      ParamByName('ociqtdade6').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam6').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam7').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam7').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam7').AsString;
                                      ParamByName('ocivlr7').AsFloat            :=media;
                                      ParamByName('ociqtdade7').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam7').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam8').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam8').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam8').AsString;
                                      ParamByName('ocivlr8').AsFloat            :=media;
                                      ParamByName('ociqtdade8').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam8').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam9').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam9').AsString           :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam9').AsString;
                                      ParamByName('ocivlr9').AsFloat            :=media;
                                      ParamByName('ociqtdade9').AsFloat         :=1;
                                  end
                                  else
                                      ParamByName('ocitam9').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam10').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam10').AsString          :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam10').AsString;
                                      ParamByName('ocivlr10').AsFloat           :=media;
                                      ParamByName('ociqtdade10').AsFloat        :=1;
                                  end
                                  else
                                      ParamByName('ocitam10').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam11').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam11').AsString          :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam11').AsString;
                                      ParamByName('ocivlr11').AsFloat           :=media;
                                      ParamByName('ociqtdade11').AsFloat        :=1;
                                  end
                                  else
                                      ParamByName('ocitam11').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam12').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam12').AsString          :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam12').AsString;
                                      ParamByName('ocivlr12').AsFloat           :=media;
                                      ParamByName('ociqtdade12').AsFloat        :=1;
                                  end
                                  else
                                      ParamByName('ocitam12').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam13').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam13').AsString          :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam13').AsString;
                                      ParamByName('ocivlr13').AsFloat           :=media;
                                      ParamByName('ociqtdade13').AsFloat        :=1;
                                  end
                                  else
                                      ParamByName('ocitam13').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam14').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam14').AsString          :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam14').AsString;
                                      ParamByName('ocivlr14').AsFloat           :=media;
                                      ParamByName('ociqtdade14').AsFloat        :=1;
                                  end
                                  else
                                      ParamByName('ocitam14').Clear;

                                  if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam15').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                  begin
                                      ParamByName('ocitam15').AsString          :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam15').AsString;
                                      ParamByName('ocivlr15').AsFloat           :=media;
                                      ParamByName('ociqtdade15').AsFloat        :=1;
                                  end
                                  else
                                      ParamByName('ocitam15').Clear;
                              end;
                              if ParamByName('ocitecido').AsBoolean = false then
                              begin
                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam1').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam1').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam1').AsString;
                                          ParamByName('ocivlr1').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr1').AsFloat;
                                          ParamByName('ociqtdade1').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam1').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam2').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam2').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam2').AsString;
                                          ParamByName('ocivlr2').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr2').AsFloat;
                                          ParamByName('ociqtdade2').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam2').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam3').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam3').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam3').AsString;
                                          ParamByName('ocivlr3').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr3').AsFloat;
                                          ParamByName('ociqtdade3').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam3').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam4').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam4').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam4').AsString;
                                          ParamByName('ocivlr4').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr4').AsFloat;
                                          ParamByName('ociqtdade4').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam4').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam5').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam5').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam5').AsString;
                                          ParamByName('ocivlr5').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr5').AsFloat;
                                          ParamByName('ociqtdade5').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam5').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam6').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam6').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam6').AsString;
                                          ParamByName('ocivlr6').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr6').AsFloat;
                                          ParamByName('ociqtdade6').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam6').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam7').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam7').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam7').AsString;
                                          ParamByName('ocivlr7').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr7').AsFloat;
                                          ParamByName('ociqtdade7').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam7').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam8').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam8').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam8').AsString;
                                          ParamByName('ocivlr8').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr8').AsFloat;
                                          ParamByName('ociqtdade8').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam8').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam9').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam9').AsString       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam9').AsString;
                                          ParamByName('ocivlr9').AsFloat        :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr9').AsFloat;
                                          ParamByName('ociqtdade9').AsFloat     :=1;
                                      end
                                      else
                                          ParamByName('ocitam9').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam10').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam10').AsString      :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam10').AsString;
                                          ParamByName('ocivlr10').AsFloat       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr10').AsFloat;
                                          ParamByName('ociqtdade10').AsFloat    :=1;
                                      end
                                      else
                                          ParamByName('ocitam10').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam11').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam11').AsString      :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam11').AsString;
                                          ParamByName('ocivlr11').AsFloat       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr11').AsFloat;
                                          ParamByName('ociqtdade11').AsFloat    :=1;
                                      end
                                      else
                                          ParamByName('ocitam11').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam12').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam12').AsString      :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam12').AsString;
                                          ParamByName('ocivlr12').AsFloat       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr12').AsFloat;
                                          ParamByName('ociqtdade12').AsFloat    :=1;
                                      end
                                      else
                                          ParamByName('ocitam12').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam13').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam13').AsString      :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam13').AsString;
                                          ParamByName('ocivlr13').AsFloat       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr13').AsFloat;
                                          ParamByName('ociqtdade13').AsFloat    :=1;
                                      end
                                      else
                                          ParamByName('ocitam13').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam14').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam14').AsString      :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam14').AsString;
                                          ParamByName('ocivlr14').AsFloat       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr14').AsFloat;
                                          ParamByName('ociqtdade14').AsFloat    :=1;
                                      end
                                      else
                                          ParamByName('ocitam14').Clear;

                                      if dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam15').AsString=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fp_tamanho').AsString then
                                      begin
                                          ParamByName('ocitam15').AsString      :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_tam15').AsString;
                                          ParamByName('ocivlr15').AsFloat       :=dmIniciarCorte.qyItensFichaPrevisto.FieldByName('fti_vlr15').AsFloat;
                                          ParamByName('ociqtdade15').AsFloat    :=1;
                                      end
                                      else
                                          ParamByName('ocitam15').Clear;
                              end;



                              total:=(ParamByName('ociqtdade1').AsFloat*ParamByName('ocivlr1').AsFloat)+
                                     (ParamByName('ociqtdade2').AsFloat*ParamByName('ocivlr2').AsFloat)+
                                     (ParamByName('ociqtdade3').AsFloat*ParamByName('ocivlr3').AsFloat)+
                                     (ParamByName('ociqtdade4').AsFloat*ParamByName('ocivlr4').AsFloat)+
                                     (ParamByName('ociqtdade5').AsFloat*ParamByName('ocivlr5').AsFloat)+
                                     (ParamByName('ociqtdade6').AsFloat*ParamByName('ocivlr6').AsFloat)+
                                     (ParamByName('ociqtdade7').AsFloat*ParamByName('ocivlr7').AsFloat)+
                                     (ParamByName('ociqtdade8').AsFloat*ParamByName('ocivlr8').AsFloat)+
                                     (ParamByName('ociqtdade9').AsFloat*ParamByName('ocivlr9').AsFloat)+
                                     (ParamByName('ociqtdade10').AsFloat*ParamByName('ocivlr10').AsFloat)+
                                     (ParamByName('ociqtdade11').AsFloat*ParamByName('ocivlr11').AsFloat)+
                                     (ParamByName('ociqtdade12').AsFloat*ParamByName('ocivlr12').AsFloat)+
                                     (ParamByName('ociqtdade13').AsFloat*ParamByName('ocivlr13').AsFloat)+
                                     (ParamByName('ociqtdade14').AsFloat*ParamByName('ocivlr14').AsFloat)+
                                     (ParamByName('ociqtdade15').AsFloat*ParamByName('ocivlr15').AsFloat);

                              ParamByName('ocivlrtotal').AsFloat     :=total;
                              ParamByName('ocivlrreserva').AsFloat   :=ParamByName('ocivlrtotal').AsFloat;
                              ParamByName('ocivlrrestante').AsFloat  :=0;
                              ExecSQL;
                              dmIniciarCorte.qyItensFichaPrevisto.Next;
                          end;
                      end;


                          with dmIniciarCorte.qyOrdemCorteProtFase do
                          begin
                              Close;
                              SQL.Clear;
                              SQL.Add('SELECT * FROM ficha_tecnica_itensfase AS fti');
                              SQL.Add('JOIN ordem_corte_itens_previsto AS oit ON');
                              SQL.Add('fti.ftf_iditemfichatecnica=oit.oci_iditemficha');
                              SQL.Add('WHERE ftf_idfichatecnica = :ficha');
                              SQL.Add('AND oci_situacao_id <> ''2''');

                              ParamByName('ficha').AsInteger := StrToInt(editFicha.Text);
                              Open;
                          end;


                          dmIniciarCorte.qyOrdemCorteProtFase.First;


                          while not dmIniciarCorte.qyOrdemCorteProtFase.Eof do
                          begin

                              with dmIniciarCorte.tbOrdemCorteProtFase do
                              begin
                                  Close;
                                  SQL.Clear;
                                  SQL.Add('INSERT INTO ordem_corte_prototipo_fase (');
                                  SQL.Add('   ocpf_idfichatecnica, ocpf_idordemcorte, ocpf_idfaseproducao, ocpf_vlr1, ocpf_vlr2, ocpf_vlr3,');
                                  SQL.Add('   ocpf_vlr4, ocpf_vlr5, ocpf_vlr6, ocpf_vlr7, ocpf_vlr8, ocpf_vlr9, ocpf_vlr10, ocpf_vlr11,');
                                  SQL.Add('   ocpf_vlr12, ocpf_vlr13, ocpf_vlr14, ocpf_vlr15, ocpf_total, ocpf_idusulanc, ocpf_idsituacao,');
                                  SQL.Add('   ocpf_iditemfichatecnica, ocpf_atividade)');
                                  SQL.Add('VALUES (');
                                  SQL.Add('   :idficha, :idcorte, :idfaseprod, :vlr1, :vlr2, :vlr3, :vlr4, :vlr5, :vlr6, :vlr7, :vlr8, :vlr9,');
                                  SQL.Add('   :vlr10, :vlr11, :vlr12, :vlr13, :vlr14, :vlr15, :total, :idusulanc, :idsituacao, :iditemfichatec, :atividade)');

                                  ParamByName('idficha').AsInteger                      :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('ftf_idfichatecnica').AsInteger;
                                  ParamByName('idcorte').AsInteger                      :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_idocorte').AsInteger;
                                  ParamByName('idfaseprod').AsInteger                   :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('ftf_idfaseproducao').AsInteger;
                                  ParamByName('vlr1').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr1').AsFloat;
                                  ParamByName('vlr2').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr2').AsFloat;
                                  ParamByName('vlr3').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr3').AsFloat;
                                  ParamByName('vlr4').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr4').AsFloat;
                                  ParamByName('vlr5').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr5').AsFloat;
                                  ParamByName('vlr6').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr6').AsFloat;
                                  ParamByName('vlr7').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr7').AsFloat;
                                  ParamByName('vlr8').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr8').AsFloat;
                                  ParamByName('vlr9').AsFloat                           :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr9').AsFloat;
                                  ParamByName('vlr10').AsFloat                          :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr10').AsFloat;
                                  ParamByName('vlr11').AsFloat                          :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr11').AsFloat;
                                  ParamByName('vlr12').AsFloat                          :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr12').AsFloat;
                                  ParamByName('vlr13').AsFloat                          :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr13').AsFloat;
                                  ParamByName('vlr14').AsFloat                          :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr14').AsFloat;
                                  ParamByName('vlr15').AsFloat                          :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlr15').AsFloat;
                                  ParamByName('total').AsFloat                          :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('oci_vlrtotal').AsFloat;
                                  ParamByName('idusulanc').AsInteger                    :=strtoInt(formPrincipal.labCodUsuario.Caption);
                                  ParamByName('idsituacao').AsInteger                   :=3;
                                  ParamByName('iditemfichatec').AsInteger               :=dmIniciarCorte.qyOrdemCorteProtFase.FieldByName('ftf_iditemfichatecnica').AsInteger;
                                  ParamByName('atividade').AsString                     :='P';
                                  ExecSQL;
                                  dmIniciarCorte.qyOrdemCorteProtFase.Next;
                              end;
                          end;


                      formPrincipal.ComitaTransacao;

                  Except
                        on E: exception do
                        begin
                             formPrincipal.DesfazTransacao;
                             Application.MessageBox(pchar('Erro ao iniciar o previsto.'+E.Message),'Ordem de Corte', MB_ICONERROR);
                             Exit;
                        end;
                  End;



              end
              else
              begin  //###### PROCESSO EM GRANDE ESCALA  ###########

                  with dmIniciarCorte.qyDefinirPrevistoGE do
                  begin
                      Close;
                      SQL.Clear;
                      SQL.Add('SELECT');
                      SQL.Add('   *');
                      SQL.Add('   FROM ficha_tecnica_itens AS fti');
                      SQL.Add('   JOIN cadastro_produto AS cp ON');
                      SQL.Add('   cp.cp_id = fti.fti_idproduto');
                      SQL.Add('   WHERE fti_idfichatec = :ficha');
                      SQL.Add('   AND fti.fti_tecido = ''A''');
                      SQL.Add('   AND fti.fti_status <> ''C''');

                      ParamByName('ficha').AsInteger := strtoint(editFicha.Text);

                      Open;
                  end;

                  with dmIniciarCorte.qyTemOrdPrototipo do
                  begin
                      Close;
                          SQL.Clear;
                          SQL.Add('SELECT oci.*');
                          SQL.Add('   FROM ordem_corte_itens_real AS oci');
                          SQL.Add('   JOIN ordem_corte AS oc ON oc.oc_id = oci.oci_idocorte');
                          SQL.Add('   WHERE');
                          SQL.Add('   oc.oc_prototipo = TRUE');
                          SQL.Add('   AND oc.oc_idfichatecnica=:ficha');

                          ParamByName('ficha').AsInteger := strtoint(formIniciarCorte.editFicha.Text);
                          Open;
                  end;

                  with dmIniciarCorte.qyChecaReserva do
                  begin
                      Close;
                      SQL.Clear;
                      SQL.Add('SELECT * ');
                      SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
                      SQL.Add('   JOIN ordem_corte AS oc ON oc.oc_id = oci.oci_idocorte');
                      SQL.Add('   WHERE');
                      SQL.Add('   oci.oci_idocorte<>:corte');
                      SQL.Add('   AND oc.oc_prototipo=FALSE');
                      SQL.Add('   AND oc.oc_idfichatecnica=:ficha');
                      SQL.Add('   AND oci.oci_idgradecorprodutoacabado=:corprodutoacabado');

                      ParamByName('ficha').AsInteger:=strtoint(editFicha.Text);
                      ParamByName('corte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
                      ParamByName('corprodutoacabado').AsInteger:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger;
                      Open;
                  end;


                      dmIniciarCorte.qyDefinirPrevistoGE.First;

                      cQyConsIDCorte := TFDQuery.Create(nil);
                      cQyConsIDCorte.Connection := dmOrdemCorte.Conexao;

                      //PEGA ID DO CORTE
                      pegaIDOrdemCorte(cQyConsIDCorte);

                  Try

                     formPrincipal.IniciaTransacao;

                     while not dmIniciarCorte.qyDefinirPrevistoGE.Eof do
                     begin
                          with dmIniciarCorte.tbOrdemCorteItensPrevisto do
                          begin
                              Close;
                              SQL.Clear;
                              SQL.Add('INSERT INTO ordem_corte_itens_previsto (');
                              SQL.Add('  oci_idocorte, oci_idproduto, oci_idcortecido, oci_dtlanc, oci_hrlanc, oci_codusulanc, oci_idgradetam,');
                              SQL.Add('  oci_un, oci_iditemficha, oci_situacao_id, oci_tipo, oci_tecido, oci_idgradecor, oci_idgradecorprodutoacabado,');
                              SQL.Add('  oci_tam1, oci_tam2, oci_tam3, oci_tam4, oci_tam5, oci_tam6, oci_tam7, oci_tam8, oci_tam9, oci_tam10,');
                              SQL.Add('  oci_tam11, oci_tam12, oci_tam13, oci_tam14, oci_tam15, oci_vlr1, oci_vlr2, oci_vlr3, oci_vlr4, oci_vlr5,');
                              SQL.Add('  oci_vlr6, oci_vlr7, oci_vlr8, oci_vlr9, oci_vlr10, oci_vlr11, oci_vlr12, oci_vlr13, oci_vlr14, oci_vlr15,');
                              SQL.Add('  oci_qtdade1, oci_qtdade2, oci_qtdade3, oci_qtdade4, oci_qtdade5, oci_qtdade6, oci_qtdade7, oci_qtdade8,');
                              SQL.Add('  oci_qtdade9, oci_qtdade10, oci_qtdade11, oci_qtdade12, oci_qtdade13, oci_qtdade14, oci_qtdade15,');
                              SQL.Add('  oci_vlrtotal, oci_vlrreserva, oci_vlrrestante)');
                              SQl.Add('VALUES(');
                              SQL.Add('  :idocorte, :idproduto, :idcortecido, :dtlanc, :hrlanc, :codusulanc, :idgradetam, :ociun, :iditemficha, :situacaoid,');
                              SQL.Add('  :ocitipo, :ocitecido, :idgradecor, :idgradecorprodutoacabado, :ocitam1, :ocitam2, :ocitam3, :ocitam4, :ocitam5,');
                              SQL.Add('  :ocitam6, :ocitam7, :ocitam8, :ocitam9, :ocitam10, :ocitam11, :ocitam12, :ocitam13, :ocitam14, :ocitam15,');
                              SQL.Add('  :ocivlr1, :ocivlr2, :ocivlr3, :ocivlr4, :ocivlr5, :ocivlr6, :ocivlr7, :ocivlr8, :ocivlr9, :ocivlr10, :ocivlr11,');
                              SQL.Add('  :ocivlr12, :ocivlr13, :ocivlr14, :ocivlr15, :ociqtdade1, :ociqtdade2, :ociqtdade3, :ociqtdade4, :ociqtdade5, :ociqtdade6,');
                              SQL.Add('  :ociqtdade7, :ociqtdade8, :ociqtdade9, :ociqtdade10, :ociqtdade11, :ociqtdade12, :ociqtdade13, :ociqtdade14, :ociqtdade15,');
                              SQL.Add('  :ocivlrtotal, :ocivlrreserva, :ocivlrrestante)');

                              ParamByName('idocorte').AsInteger                       :=cQyConsIDCorte.FieldByName('oc_id').AsInteger;
                              ParamByName('idproduto').AsInteger                      :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_idproduto').AsInteger;
                              ParamByName('idcortecido').AsInteger                    :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecido').AsInteger;
                              ParamByName('dtlanc').AsDateTime                        :=now;
                              ParamByName('hrlanc').AsTime                            :=now;
                              ParamByName('codusulanc').AsInteger                     :=strtoInt(formPrincipal.labCodUsuario.Caption);
                              ParamByName('idgradetam').AsInteger                     :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_idgradetam').AsInteger;
                              ParamByName('ociun').AsString                           :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('cp_un').AsString;
                              ParamByName('iditemficha').AsInteger                    :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_id').AsInteger;
                              ParamByName('situacaoid').AsInteger                     := 1;  //Situação do corte previsto inicia-se como NORMAL
                              ParamByName('ocitipo').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tipo').AsString;
                              ParamByName('ocitecido').AsBoolean                      :=true;
                              ParamByName('idgradecor').AsInteger                     :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_idgradecor').AsInteger;
                              ParamByName('idgradecorprodutoacabado').AsInteger       :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger;
                              ParamByName('ociqtdade1').AsFloat                       :=0;
                              ParamByName('ociqtdade2').AsFloat                       :=0;
                              ParamByName('ociqtdade3').AsFloat                       :=0;
                              ParamByName('ociqtdade4').AsFloat                       :=0;
                              ParamByName('ociqtdade5').AsFloat                       :=0;
                              ParamByName('ociqtdade6').AsFloat                       :=0;
                              ParamByName('ociqtdade7').AsFloat                       :=0;
                              ParamByName('ociqtdade8').AsFloat                       :=0;
                              ParamByName('ociqtdade9').AsFloat                       :=0;
                              ParamByName('ociqtdade10').AsFloat                      :=0;
                              ParamByName('ociqtdade11').AsFloat                      :=0;
                              ParamByName('ociqtdade12').AsFloat                      :=0;
                              ParamByName('ociqtdade13').AsFloat                      :=0;
                              ParamByName('ociqtdade14').AsFloat                      :=0;
                              ParamByName('ociqtdade15').AsFloat                      :=0;
                              ParamByName('ocitam1').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam1').AsString;
                              ParamByName('ocitam2').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam2').AsString;
                              ParamByName('ocitam3').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam3').AsString;
                              ParamByName('ocitam4').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam4').AsString;
                              ParamByName('ocitam5').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam5').AsString;
                              ParamByName('ocitam6').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam6').AsString;
                              ParamByName('ocitam7').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam7').AsString;
                              ParamByName('ocitam8').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam8').AsString;
                              ParamByName('ocitam9').AsString                         :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam9').AsString;
                              ParamByName('ocitam10').AsString                        :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam10').AsString;
                              ParamByName('ocitam11').AsString                        :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam11').AsString;
                              ParamByName('ocitam12').AsString                        :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam12').AsString;
                              ParamByName('ocitam13').AsString                        :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam13').AsString;
                              ParamByName('ocitam14').AsString                        :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam14').AsString;
                              ParamByName('ocitam15').AsString                        :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam15').AsString;

                              { VERIFICA SE GE TEM PROTÓTIPO E SUBTRAI O MESMO DA GRADE }
                              if dmIniciarCorte.qyTemOrdPrototipo.RecordCount > 0 then
                              begin
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam1').AsString<>'' then
                                  begin
                                        if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                        dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                        begin
                                            ParamByName('ociqtdade1').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade1').AsFloat-
                                            dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade1').AsFloat;
                                        end
                                        else
                                            ParamByName('ociqtdade1').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade1').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam2').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade2').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade2').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade2').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade2').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade2').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam3').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade3').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade3').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade3').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade3').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade3').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam4').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade4').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade4').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade4').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade4').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade4').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam5').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade5').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade5').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade5').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade5').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade5').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam6').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade6').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade6').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade6').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade6').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade6').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam7').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade7').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade7').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade7').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade7').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade7').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam8').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade8').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade8').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade8').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade8').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade8').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam9').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade9').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade9').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade9').AsFloat;
                                      end
                                      else
                                            ParamByName('ociqtdade9').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade9').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam10').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade10').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade10').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade10').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade10').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade10').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam11').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade11').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade11').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade11').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade11').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade11').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam12').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade12').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade12').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade12').AsFloat;
                                      end
                                      else
                                            ParamByName('ociqtdade12').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade12').AsFloat;
                                  end;
                                  if dminiciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam13').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade13').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade13').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade13').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade13').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade13').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam14').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade14').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade14').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade14').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade14').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade14').AsFloat;
                                  end;
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam15').AsString<>'' then
                                  begin
                                      if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_cortecidoidgrade').AsInteger =
                                      dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_idgradecorprodutoacabado').AsInteger then
                                      begin
                                          ParamByName('ociqtdade15').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade15').AsFloat-
                                          dmIniciarCorte.qyTemOrdPrototipo.FieldByName('oci_qtdade15').AsFloat;
                                      end
                                      else
                                          ParamByName('ociqtdade15').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade15').AsFloat;
                                  end;
                              end
                              else
                              //if dmOrdemCorte.qyTemOrdPrototipo.RecordCount = 0 then
                              begin
                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam1').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade1').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade1').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam2').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade2').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade2').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam3').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade3').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade3').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam4').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade4').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade4').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam5').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade5').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade5').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam6').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade6').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade6').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam7').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade7').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade7').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam8').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade8').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade8').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam9').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade9').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade9').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam10').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade10').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade10').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam11').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade11').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade11').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam12').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade12').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade12').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam13').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade13').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade13').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam14').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade14').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade14').AsFloat;
                                  end;

                                  if dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_tam15').AsString<>'' then
                                  begin
                                      ParamByName('ociqtdade15').AsFloat:=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_qtdade15').AsFloat;
                                  end;
                              end;
                              ParamByName('ocivlr1').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr1').AsFloat;
                              ParamByName('ocivlr2').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr2').AsFloat;
                              ParamByName('ocivlr3').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr3').AsFloat;
                              ParamByName('ocivlr4').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr4').AsFloat;
                              ParamByName('ocivlr5').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr5').AsFloat;
                              ParamByName('ocivlr6').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr6').AsFloat;
                              ParamByName('ocivlr7').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr7').AsFloat;
                              ParamByName('ocivlr8').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr8').AsFloat;
                              ParamByName('ocivlr9').AsFloat                :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr9').AsFloat;
                              ParamByName('ocivlr10').AsFloat               :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr10').AsFloat;
                              ParamByName('ocivlr11').AsFloat               :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr11').AsFloat;
                              ParamByName('ocivlr12').AsFloat               :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr12').AsFloat;
                              ParamByName('ocivlr13').AsFloat               :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr13').AsFloat;
                              ParamByName('ocivlr14').AsFloat               :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr14').AsFloat;
                              ParamByName('ocivlr15').AsFloat               :=dmIniciarCorte.qyDefinirPrevistoGE.FieldByName('fti_vlr15').AsFloat;


                              //  CALCULO DO VALOR TOTAL
                              total:=(ParamByName('ociqtdade1').AsFloat*ParamByName('ocivlr1').AsFloat)+
                                    (ParamByName('ociqtdade2').AsFloat*ParamByName('ocivlr2').AsFloat)+
                                    (ParamByName('ociqtdade3').AsFloat*ParamByName('ocivlr3').AsFloat)+
                                    (ParamByName('ociqtdade4').AsFloat*ParamByName('ocivlr4').AsFloat)+
                                    (ParamByName('ociqtdade5').AsFloat*ParamByName('ocivlr5').AsFloat)+
                                    (ParamByName('ociqtdade6').AsFloat*ParamByName('ocivlr6').AsFloat)+
                                    (ParamByName('ociqtdade7').AsFloat*ParamByName('ocivlr7').AsFloat)+
                                    (ParamByName('ociqtdade8').AsFloat*ParamByName('ocivlr8').AsFloat)+
                                    (ParamByName('ociqtdade9').AsFloat*ParamByName('ocivlr9').AsFloat)+
                                    (ParamByName('ociqtdade10').AsFloat*ParamByName('ocivlr10').AsFloat)+
                                    (ParamByName('ociqtdade11').AsFloat*ParamByName('ocivlr11').AsFloat)+
                                    (ParamByName('ociqtdade12').AsFloat*ParamByName('ocivlr12').AsFloat)+
                                    (ParamByName('ociqtdade13').AsFloat*ParamByName('ocivlr13').AsFloat)+
                                    (ParamByName('ociqtdade14').AsFloat*ParamByName('ocivlr14').AsFloat)+
                                    (ParamByName('ociqtdade15').AsFloat*ParamByName('ocivlr15').AsFloat);

                              ParamByName('ocivlrtotal').AsFloat:=total;
                              ParamByName('ocivlrrestante').AsFloat:=0;


                              //VERFIFICA SE FEZ RESERVA
                              if dmIniciarCorte.qyChecaReserva.RecordCount=0 then
                                  ParamByName('ocivlrreserva').AsFloat:=ParamByName('ocivlrtotal').AsFloat
                              else
                                  ParamByName('ocivlrreserva').AsFloat:=0;
                              ExecSQL;
                              dmIniciarCorte.qyDefinirPrevistoGE.Next;
                          end;
                     end;

                     formPrincipal.ComitaTransacao;

                  Except
                        on E: exception do
                        begin
                             formPrincipal.DesfazTransacao;
                             Application.MessageBox(pchar('Erro ao iniciar o previsto.'+E.Message),'Ordem de Corte', MB_ICONERROR);
                             Exit;
                        end;
                  End;

              end;

     Except
           on E: exception do
           begin
                Application.MessageBox(pchar('Erro:'+E.message),'Ordem de Corte', MB_ICONERROR);
                Exit;
           end;
     End;


end;

procedure TformIniciarCorte.pegaIDOrdemCorte(cQy : TFDQuery);
begin
     With cQy do
     begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT oc_id FROM ordem_corte ORDER BY oc_id DESC LIMIT 1');
         Open;
     end;
end;

procedure TformIniciarCorte.salvarCorte;
begin
    try


        formPrincipal.IniciaTransacao;


        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_dtgerada').Value                                  :=now;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_hrgerada').Value                                  :=now;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_usugerou').Value                                  :=strtoint(formPrincipal.labCodUsuario.Caption);
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_dtsolicitacao').Value                             :=dataSolicitacao.Date;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_horasolicitacao').Value                           :=horaSolicitacao.Time;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_dtprevisaofinalizacao').Value                     :=dataOrdemFinalizacao.Date;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_hrprevisaofinalizacao').Value                     :=horaOrdemFinalizacao.Time;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_situacao').Value                                  :=1;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_idcodprodutoacabado').Value                       :=strtoint(editCodigo.Text);
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_observacao').Value                                :=editObservacao.Text;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_idfichatecnica').Value                            :=strtoint(editFicha.Text);
        if labTipoCorte.Caption = 'Prototipo' then
            dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_prototipo').Value                             :=true
        else
            dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_prototipo').Value                             :=false;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_idsetor').Value                                   :=7;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_idsetorresponsavel').Value                        :=1;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_datapreviniciocorteprevisto').Value               :=dataCortePrevisto.Date;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_horapreviniciocorteprevisto').Value               :=horaCortePrevisto.Time;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_dataprevfimcorteprevisto').Value                  :=dataFinalCortePrevisto.Date;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_horaprevfimcorteprevisto').Value                  :=horaFinalCortePrevisto.Time;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_datapreviniciorealcortado').Value                 :=dataRealCortado.Date;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_horapreviniciorealcortado').Value                 :=horaRealCortado.Time;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_dataprevfimrealcortado').Value                    :=dataFinalRealCortado.Date;
        dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_horaprevfimrealcortado').Value                    :=horaFinalRealCortado.Time;
        dmIniciarCorte.tbOrdemdeCorte.Post;
        butDesistir.Enabled                                                                             :=false;
        butSalvar.Enabled                                                                               :=false;
        butNovo.Enabled                                                                                 :=true;
        butEscolherCores.Enabled                                                                        :=false;


        formPrincipal.ComitaTransacao;

    except
          on E: exception do
          begin
             formPrincipal.DesfazTransacao;
             Application.MessageBox(pchar('Erro ao salvar o corte! '+E.Message),'Erro', MB_ICONERROR);
             Exit;
          end;
    end;
end;

procedure TformIniciarCorte.tratarDataHora;
begin
    if dataOrdemFinalizacao.Date < dataSolicitacao.Date then
    begin
        Application.MessageBox('Data de finalização do corte não pode ser anterior a atual!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if horaOrdemFinalizacao.Time < horaSolicitacao.Time then
    begin
        Application.MessageBox('Horário de finalização do corte não pode ser anterior a atual!','Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if dataCortePrevisto.Date < dataSolicitacao.Date then
    begin
         Application.MessageBox('Data de inicio do corte previsto não pode ser anterior a data de solicitação do corte!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
         abort;
    end;

    if horaCortePrevisto.Time < horaSolicitacao.Time then
    begin
        Application.MessageBox('Horário de inicio do corte previsto não pode ser anterior ao horário de solicitação do corte!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if dataFinalCortePrevisto.Date < dataCortePrevisto.Date then
    begin
        Application.MessageBox('Data de finalização do corte previsto não pode ser anterior a data de inicio do corte previsto!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if horaFinalCortePrevisto.Time < horaCortePrevisto.Time then
    begin
        Application.MessageBox('Horário de finalização do corte previsto não pode ser anterior ao horário de inicio do corte previsto!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if dataRealCortado.Date < dataFinalCortePrevisto.Date then
    begin
        Application.MessageBox('Data de inicio do real cortado não pode ser anterior a data de finalização do corte previsto!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if horaRealCortado.Time < horaFinalCortePrevisto.Time then
    begin
        Application.MessageBox('Horário de inicio do real cortado não pode ser anterior ao horário de finalização do corte previsto!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if dataFinalRealCortado.Date < dataRealCortado.Date then
    begin
        Application.MessageBox('Data de finalização do real cortado não pode ser anterior a data de inicio do real cortado!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if horaFinalRealCortado.Time < horaRealCortado.Time then
    begin
        Application.MessageBox('Horário de finalização do corte real não pode ser anterior ao horário de inicio do corte real', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
        abort;
    end;
end;

procedure TformIniciarCorte.usuarioOutraOrdem;
var
  parametro : integer;

begin
    parametro := 18;
    with dmIniciarCorte.qyUserOrdem2 do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM usuario');
        SQL.Add('  WHERE us_id = :codigo');
        ParamByName('codigo').AsInteger := parametro;
        Open;
        if dmIniciarCorte.qyUserOrdem2.FieldByName('us_libera_outra_ordemcorte').Value = false then
        begin
            Application.MessageBox('Você não tem permissão para executar este procedimento','Atenção',MB_OK + MB_ICONINFORMATION);
            abort;
        end
        else
        begin
            if dmIniciarCorte.qyCortePorTipoFichaId.RecordCount > 0 then
            begin
                try

                    formPrincipal.IniciaTransacao;

                    dmIniciarCorte.tbOrdemdeCorte.FieldByName('oc_ordem').Value := dmIniciarCorte.qyCortePorTipoFichaId.FieldByName('oc_ordem').OldValue + 1;

                    formPrincipal.ComitaTransacao;
                except
                      on E: exception do
                      begin
                           formPrincipal.DesfazTransacao;
                           Application.MessageBox(pchar('Erro ao inserir o nºordem! '+E.Message),'Erro', MB_ICONERROR);
                           Exit;
                      end;
                end;
            end;
        end;
    end;
end;

end.
