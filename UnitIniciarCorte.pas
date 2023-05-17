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
         SQL.Add('select oc_situacao from ordem_corte');
         SQL.Add('where oc_id = :ordem');
         ParamByName('ordem').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
         Open;
    end;
    if editCodigo.Text = ''  then
    begin
        Showmessage('Selecione o produto acabado');
        exit;
    end;
    if labTipoCorte.Caption = 'Prototipo' then
    begin
        Showmessage('Este corte � prototipo e a cor de corte j� foi definida na ficha tecnica, por este motivo a funcionalidade requerida foi vedada');
        exit;
    end;
    if dmOrdemCorte.qyOrdemIniciarCorte.FieldByName('oc_situacao').Value = 3 then
    begin
        Showmessage('Ordem de corte finalizada, por esse motivo � vedado qualquer modifica��o na ordem de corte');
        exit;
    end;
    With dmOrdemCorte.qyPrevisto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('select oci_situacao_id from ordem_corte_itens_previsto');
        SQL.Add('where oci_idocorte = :numerocorte');
        ParamByName('numerocorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
    end;
    dmOrdemCorte.qyPrevisto.First;
    while not dmOrdemCorte.qyPrevisto.Eof do
    begin
        if dmOrdemCorte.qyPrevisto.FieldByName('oci_situacao_id').Value = 3 then
        begin
            ShowMessage('Corte sob empenho, por este motivo n�o � possivel mudar cores. Para fazer um nova cor inicie um outra ordem de corte para esta referencia');
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
begin
    with dmOrdemCorte.qyOrdemDeCorte do
    begin
        Close;
        SQL.Text := 'select oc_situacao from ordem_corte';
        SQL.Add('where oc_idcodprodutoacabado = :prodacabado');
        ParamByName('prodacabado').AsInteger := strtoint(editCodigo.Text);
        Open;
    end;
    if dmOrdemCorte.qyOrdemDeCorte.FieldByName('oc_situacao').Value = 2 then
    begin
        Application.MessageBox('Houve um cancelamento de ordem de corte anterior para essa refer�ncia com empenhos devolvidos para almoxarifado!',
        'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        Application.MessageBox('Solicite ao almoxarifado que processe o recebimento da devolu��o dos empenhos!', 'Ordem de Corte', mb_iconhand + mb_ok + mb_applmodal);
        exit;
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
    Application.MessageBox('Opera��o realizada com sucesso!', 'Ordem de Corte', mb_iconexclamation + mb_ok + mb_applmodal);

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
