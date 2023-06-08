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
    butRemover: TBitBtn;
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure abrirProdutoAcabado;
  end;

var
  formIniciarCorte: TformIniciarCorte;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule, UnitHistoricOrdem,
  UnitOrdemCorteCores;



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
        Application.MessageBox('Este corte é prototipo e a cor de corte já foi definida na ficha tecnica, por este motivo a funcionalidade requerida foi vedada',
        'Ordem de Corte', mb_iconexclamation + mb_ok + mb_taskmodal);
        exit;
    end;
    if dmOrdemCorte.qyOrdemIniciarCorte.FieldByName('oc_situacao').Value = 3 then
    begin
        Application.MessageBox('Ordem de corte finalizada, por esse motivo é vedado qualquer modificação na ordem de corte', 'Ordem de Corte', mb_iconexclamation +
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
            Application.MessageBox('Corte sob empenho, por este motivo não é possivel mudar cores. Para fazer um nova cor inicie um outra ordem de corte para esta referencia',
            'Ordem de Corte', mb_iconexclamation + mb_ok + mb_taskmodal);
            exit;
        end;
        dmOrdemCorte.qyPrevisto.Next;
    end;
        abrirProdutoAcabado;
end;

procedure TformIniciarCorte.butDesistirClick(Sender: TObject);
begin
    dmOrdemCorte.tbOrdemdeCorte.Cancel;
    butDesistir.Enabled := false;
    butSalvar.Enabled := false;
    butNovo.Enabled := true;
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
    butNovo.Enabled := false;
    butSalvar.Enabled := true;
    butDesistir.Enabled := true;
end;

procedure TformIniciarCorte.butSairInicioCorteClick(Sender: TObject);
begin
    formIniciarCorte.Close;
    formPrincipal.habComponentes;
end;

procedure TformIniciarCorte.butSalvarClick(Sender: TObject);
var
  ficha : string;
begin
    {-----------VERIFICA SE HOUVE CANCELAMENTO PRA REFERENCIA ANTERIOR-----------}
    with dmOrdemCorte.qyOrdemDeCorte do
    begin
        Close;
        SQL.Text := 'SELECT oc_situacao FROM ordem_corte';
        SQL.Add('WHERE oc_idcodprodutoacabado = :prodacabado');
        ParamByName('prodacabado').AsInteger := strtoint(editCodigo.Text);
        Open;
    end;
    if dmOrdemCorte.qyOrdemDeCorte.FieldByName('oc_situacao').Value = 2 then
    begin
        Application.MessageBox('Houve um cancelamento de ordem de corte anterior para essa referência com empenhos devolvidos para almoxarifado!',
        'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        Application.MessageBox('Solicite ao almoxarifado que processe o recebimento da devolução dos empenhos!', 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        exit;
    end;

    {-----------VERIFICA SE A GRADE ESTÁ INCORRETA-----------}
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
    end;
    if dmOrdemCorte.qyGradeFicha.RecordCount > 1 then
    begin
        ShowMessage('Grade incorreta na Ficha Tecnica: ' + dmOrdemCorte.qyFichaId.FieldByName('fi_id').Value);
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

    {-----------VERIFICA SE A LINHA 120 ESTÁ INFORMA EM REFERENCIA DE SARJA OU JEANS (NÃO PODE LINHA 120 NESSA SITUAÇÃO)-----------}
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
            Application.MessageBox('Ordem de corte não pode ser criada porque existe linha 120 lançada na costura!','Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
            Application.MessageBox('Linha Título 120 não é comum ser usado na fase de costura quando o segmento do tecido for JEANS ou SARJA.','Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
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
        if dmOrdemCorte.qyFichaPrototipo.RecordCount = 0 then
        begin
            Application.MessageBox('O protótipo não foi informado na ficha tecnica, por favor re-abra a ficha tecnica e informe o tamanho e cor do protótipo',
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
        if dmOrdemCorte.qyCorGradeProt.RecordCount = 0 then
        begin
            Application.MessageBox('O tamanho do prototipo está fora da grade e/ou a cor diferente da programada, por favor ajuste a informação do prototipo na ficha tecnica',
            'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
            exit;
        end;
    end;

    {-----------VERIFICA SE EXISTE MAIS DE UMA TECIDO PRINCIPAL PARA MESMA COR INSERIDO NA FICHA TECNICA-----------}
    with dmordemCorte.qyTecidoPrincipal do
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
            Application.MessageBox('Há mais de um tecido principal na ficha tecnica, por favor realize o ajuste!', 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
            exit;
        end;
    end;

    {-----------VERIFICA SE A COR DE REFERENCIA ESTÁ DIFERENTE DA COR DO ARTIGO-----------}

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
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_prototipo').Value := true;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_idsetor').Value := 7;
    dmOrdemCorte.tbOrdemdeCorte.FieldByName('oc_ordem').Value := 1;
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
    Application.MessageBox('Operação realizada com sucesso!', 'Ordem de Corte', mb_iconexclamation + mb_ok + mb_applmodal);
end;

procedure TformIniciarCorte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FreeAndNil(formIniciarCorte);
end;

procedure TformIniciarCorte.FormCreate(Sender: TObject);
begin
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
    butSalvar.Enabled := false;
    butRemover.Enabled := false;
    butEditar.Enabled := false;
    butDesistir.Enabled := false;
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

end.
