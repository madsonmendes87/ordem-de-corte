unit UnitPrincipal;

interface

uses
  Winapi.Windows,Winapi.Messages,System.SysUtils,System.Variants,System.Classes,Vcl.Graphics,Vcl.Controls,Vcl.Forms,Vcl.Dialogs,Vcl.Menus,
  Vcl.ToolWin,Vcl.ActnMan,Vcl.ActnCtrls,Vcl.ActnMenus,Vcl.ComCtrls,Vcl.StdCtrls,Vcl.ExtCtrls,Vcl.Buttons,Data.DB,Vcl.Grids,Vcl.DBGrids,
  Vcl.DBCtrls, System.Actions, Vcl.ActnList, flatsb;

type
  TformPrincipal = class(TForm)
    panelFormPrincipal: TPanel;
    LbUsuario: TLabel;
    LbCodigoUsuario: TLabel;
    LbSetor: TLabel;
    LbDigitoSetor: TLabel;
    panelMenuEsquerdo: TPanel;
    btnOrdemCorte: TSpeedButton;
    footerPrincipal: TStatusBar;
    btnEmpAlmoxarifado: TSpeedButton;
    popupMenuOrdem: TPopupMenu;
    IniciarCorte1: TMenuItem;
    IniciarCorte2: TMenuItem;
    CortePrevisto1: TMenuItem;
    CortePrevisto2: TMenuItem;
    RealCortado1: TMenuItem;
    btnEmpFase: TSpeedButton;
    btnEstoqueFase: TSpeedButton;
    btnEstAproveitamento: TSpeedButton;
    btnEntregaPecas: TSpeedButton;
    btnObservacoes: TSpeedButton;
    popupMenuObs: TPopupMenu;
    Visualizar1: TMenuItem;
    Visualizar2: TMenuItem;
    Lanar1: TMenuItem;
    btnProcRestrito: TSpeedButton;
    popupMenuProcRes: TPopupMenu;
    rocarEstilistadeReferncia1: TMenuItem;
    AjustarGradedaFichaTcnica1: TMenuItem;
    AjustarGradedaFichaTcnica2: TMenuItem;
    N1: TMenuItem;
    VoltarFichaTcnicaparaFinalizada1: TMenuItem;
    LbDigitoUsuario: TLabel;
    LbNomeUsuario: TLabel;
    Panel1: TPanel;
    LbCodigoSetor: TLabel;
    gridOrdem: TDBGrid;
    Panel2: TPanel;
    labFiltro: TLabel;
    labTipo: TLabel;
    comboTipo: TComboBox;
    butOrdemPesquisar: TSpeedButton;
    labEstilista: TLabel;
    labSetor: TLabel;
    comboSetor: TComboBox;
    labFiltrarPor: TLabel;
    comboFiltro: TComboBox;
    labDadosConsulta: TLabel;
    editSearch: TEdit;
    labSituacao: TLabel;
    comboSituacao: TComboBox;
    labIniOrdem: TLabel;
    comboIniOrd: TComboBox;
    labColecao: TLabel;
    labData: TLabel;
    comboFiltroData: TComboBox;
    dateTimePicker1: TDateTimePicker;
    labA: TLabel;
    dateTimePicker2: TDateTimePicker;
    ActionList1: TActionList;
    acaoBotaoCorteReal: TAction;
    butVerCorte: TBitBtn;
    acaoBotaoCortePrevisto: TAction;
    butCortePrevisto: TBitBtn;
    acaoBotaoHistorico: TAction;
    butHistoricOrdem: TBitBtn;
    dbLColecao: TDBLookupComboBox;
    labMostrAnos: TLabel;
    butClearTipo: TButton;
    dbLkComboEstilo: TDBLookupComboBox;
    butClearEstilo: TButton;
    butClearSetor: TButton;
    butClearSituacao: TButton;
    butLimpaIniOrdem: TButton;
    butClearColecao: TButton;
    butRealCortado: TBitBtn;
    acaoRealCortado: TAction;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butVerCorteClick(Sender: TObject);
    procedure butCortePrevistoClick(Sender: TObject);
    procedure butHistoricOrdemClick(Sender: TObject);
    procedure butOrdemPesquisarClick(Sender: TObject);
    procedure acaoBotaoVerCorteExecute(Sender: TObject);
    procedure acaoBotaoCortePrevistoExecute(Sender: TObject);
    procedure acaoBotaoHistoricoExecute(Sender: TObject);
    procedure IniciarCorte1Click(Sender: TObject);
    procedure labMostrAnosClick(Sender: TObject);
    procedure butClearTipoClick(Sender: TObject);
    procedure butClearEstiloClick(Sender: TObject);
    procedure butClearSetorClick(Sender: TObject);
    procedure butClearSituacaoClick(Sender: TObject);
    procedure butLimpaIniOrdemClick(Sender: TObject);
    procedure butClearColecaoClick(Sender: TObject);
    procedure acaoRealCortadoExecute(Sender: TObject);
    procedure butRealCortadoClick(Sender: TObject);
    procedure gridOrdemCellClick(Column: TColumn);
    procedure editSearchKeyPress(Sender: TObject; var Key: Char);
    procedure CortePrevisto1Click(Sender: TObject);
  private
    { Private declarations }
    procedure gridViewOrdemCorte;
    procedure desabComponentes;
  public
    { Public declarations }
    procedure boxColecao;
    function versaoExe: String;
    procedure boxEstilista;
    procedure habComponentes;
    procedure dimensionarGrid(dbg: TDBGrid);
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitIniciarCorte, UnitHistoricOrdem,
  UnitProdutoAcabado, UnitPrevisto;

procedure TformPrincipal.acaoBotaoCortePrevistoExecute(Sender: TObject);
begin
      if butCortePrevisto.Enabled = true then
            ShowMessage('Mensagem de teste: Ver Corte Previsto');
end;

procedure TformPrincipal.acaoBotaoVerCorteExecute(Sender: TObject);
begin
      if butVerCorte.Enabled = true then
          gridOrdem.Visible:=false;
          formIniciarCorte:=TformIniciarCorte.Create(Self);
          formIniciarCorte.Parent:=Panel1;
          formIniciarCorte.Align:=alClient;
          formIniciarCorte.BorderStyle:=bsNone;
          formIniciarCorte.Show;
          formIniciarCorte.butNovo.Enabled := false;
          formIniciarCorte.butEditar.Enabled := true;
          formIniciarCorte.labNumeroOrd.Caption := gridOrdem.Fields[0].Value;
          formIniciarCorte.labOrd.Caption := gridOrdem.Fields[1].Value;
          //formIniciarCorte.labNumeroOrd.Caption := '789455';  //Testar Casas
          with dmOrdemCorte.qyDadosCorteById do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT oc_idcodprodutoacabado,oc_corte_aproveitamento, oc_complementar, oc_dtsolicitacao, oc_horasolicitacao, oc_dtprevisaofinalizacao,');
              SQL.Add('oc_hrprevisaofinalizacao, oc_datapreviniciocorteprevisto, oc_horapreviniciocorteprevisto, oc_dataprevfimcorteprevisto,');
              SQL.Add('oc_horaprevfimcorteprevisto, oc_datapreviniciorealcortado, oc_horapreviniciorealcortado, oc_dataprevfimrealcortado, oc_horaprevfimrealcortado,');
              SQL.Add('oc_observacao FROM ordem_corte');
              SQL.ADD('  WHERE oc_id = :idCorte');
              ParamByName('idCorte').AsInteger := strtoint(gridOrdem.Fields[0].Value);
              Open;
              if dmOrdemCorte.qyDadosCorteById.FieldByName('oc_complementar').Value = false then
                  formIniciarCorte.labNaoComp.Caption := 'N�O';
              if dmOrdemCorte.qyDadosCorteById.FieldByName('oc_complementar').Value = true then
                  formIniciarCorte.labNaoComp.Caption := 'SIM';
              if dmOrdemCorte.qyDadosCorteById.FieldByName('oc_corte_aproveitamento').Value = false then
                  formIniciarCorte.labNaoAprov.Caption := 'N�O';
              if dmOrdemCorte.qyDadosCorteById.FieldByName('oc_corte_aproveitamento').Value = true then
                  formIniciarCorte.labNaoAprov.Caption := 'SIM';
          end;
          formIniciarCorte.editCodigo.Text := intToStr(dmOrdemCorte.qyDadosCorteById.FieldByName('oc_idcodprodutoacabado').Value);
          formIniciarCorte.editReferencia.Text := gridOrdem.Fields[9].Value;
          formIniciarCorte.editFicha.Text := intToStr(gridOrdem.Fields[5].Value);
          formIniciarCorte.editDescReferencia.Text := gridOrdem.Fields[10].Value;
          formIniciarCorte.labTipoCorte.Caption := gridOrdem.Fields[8].Value;
          formIniciarCorte.labNormal.Caption := gridOrdem.Fields[3].Value;
          formIniciarCorte.dataSolicitacao.Date := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_dtsolicitacao').Value;
          formIniciarCorte.horaSolicitacao.Time := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_horasolicitacao').Value;
          formIniciarCorte.dataOrdemFinalizacao.Date := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_dtprevisaofinalizacao').Value;
          formIniciarCorte.horaOrdemFinalizacao.Time := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_hrprevisaofinalizacao').Value;
          formIniciarCorte.dataCortePrevisto.Date := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_datapreviniciocorteprevisto').Value;
          formIniciarCorte.horaCortePrevisto.Time := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_horapreviniciocorteprevisto').Value;
          formIniciarCorte.dataFinalCortePrevisto.Date := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_dataprevfimcorteprevisto').Value;
          formIniciarCorte.horaFinalCortePrevisto.Time := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_horaprevfimcorteprevisto').Value;
          formIniciarCorte.dataRealCortado.Date := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_datapreviniciorealcortado').Value;
          formIniciarCorte.horaRealCortado.Time := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_horapreviniciorealcortado').Value;
          formIniciarCorte.dataFinalRealCortado.Date := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_dataprevfimrealcortado').Value;
          formIniciarCorte.horaFinalRealCortado.Time := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_horaprevfimrealcortado').Value;
          formIniciarCorte.editObservacao.Text := dmOrdemCorte.qyDadosCorteById.FieldByName('oc_observacao').Value;
          desabComponentes;
end;

procedure TformPrincipal.acaoBotaoHistoricoExecute(Sender: TObject);
begin
      if butHistoricOrdem.Enabled = true then
      begin
          application.CreateForm(TformHistoricOrdem, formHistoricOrdem);
          formHistoricOrdem.ShowModal;
      end;
end;

procedure TformPrincipal.acaoRealCortadoExecute(Sender: TObject);
begin
      if butRealCortado.Enabled = true then
            ShowMessage('Mensagem de teste: Ver Real Cortado');
end;

procedure TformPrincipal.boxEstilista;
begin
    With dmOrdemCorte.qyBoxEstilista do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT es_id, es_nome');
        SQL.Add('FROM cadastro_estilista');
        SQL.Add('ORDER BY es_nome');
        Open;
    end;
end;
procedure TformPrincipal.boxColecao;
begin
    With dmOrdemCorte.qyBoxColecao do
    begin
        Close;
        SQl.Clear;
        SQl.add('SELECT co_id,');
        SQl.add('CAST(CONCAT(co_descricao,'' de '', to_char(co_anocolecao, ''YYYY''))as character varying(25))AS nome');
        SQl.add('FROM colecao');
        SQl.add('ORDER BY co_anocolecao DESC LIMIT 7');
        Open;
    end;
end;

procedure TformPrincipal.butClearEstiloClick(Sender: TObject);
begin
    dbLkComboEstilo.KeyValue := Null;
end;

procedure TformPrincipal.butClearSetorClick(Sender: TObject);
begin
    comboSetor.ClearSelection;
end;

procedure TformPrincipal.butClearSituacaoClick(Sender: TObject);
begin
    comboSituacao.ClearSelection;
end;

procedure TformPrincipal.butClearTipoClick(Sender: TObject);
begin
    comboTipo.ClearSelection;
end;

procedure TformPrincipal.butCortePrevistoClick(Sender: TObject);
begin
    acaoBotaoCortePrevistoExecute(Sender);
end;

procedure TformPrincipal.butHistoricOrdemClick(Sender: TObject);
begin
    acaoBotaoHistoricoExecute(Sender);
end;

procedure TformPrincipal.butLimpaIniOrdemClick(Sender: TObject);
begin
    comboIniOrd.ClearSelection;
end;

procedure TformPrincipal.butOrdemPesquisarClick(Sender: TObject);
begin
    begin
      With dmOrdemCorte.qyOrdemCorte do
      begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT oc.oc_id,');
            SQL.Add('Cast(lpad(cast(oc.oc_ordem As varchar), 3, ''0'') as character varying(5))as NumerodoCorte,');
            SQL.Add('cc.co_descricao, (ocs.os_nome)as situacao,');
            SQL.Add('(ce.es_nome)as estilista,');
            SQL.Add('oc.oc_idfichatecnica,');
            SQL.Add('(SELECT op.op_id FROM ordem_producao AS op WHERE op.op_idordemcorte = oc.oc_id AND op.op_idstatus <> ''4'')as noordproducao,');
            SQL.Add('(SELECT (CASE WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) = 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
            SQL.Add('                  CURRENT_DATE - oc.oc_dtgerada::DATE');
            SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
            SQL.Add('                  CURRENT_DATE - ocpi.oci_dtlanc::DATE');
            SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) > 0)) THEN');
            SQL.Add('                  CURRENT_DATE - ocri.oci_dtlanc::DATE');
            SQL.Add('         ELSE 0 END)');
            SQL.Add('     FROM ordem_corte as oci LEFT JOIN ordem_corte_itens_previsto as ocpi on');
            SQL.Add('     ((ocpi.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT IN (2, 4)))');
            SQL.Add('     LEFT JOIN ordem_corte_itens_real as ocri on');
            SQL.Add('     ((ocri.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT IN (2, 4)))');
            SQL.Add('     WHERE oci.oc_id=oc.oc_id');
            SQL.Add('     LIMIT 1');
            SQL.Add(') AS diasemprocesso,');
            SQL.Add('Cast(Case When oc.oc_prototipo = True Then ''Prototipo'' ELSE ''Grande Escala'' END as character varying(15)) AS tipo,');
            SQL.Add('(pa.cad_idreferencia)as referencia,');
            SQL.Add('(pa.cad_descricao)as produtoacabado,');
            SQL.Add('(oc.oc_dtgerada)as datagerada,');
            SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_previsto WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradeprevisto,');
            SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_real WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradereal,');
            SQL.Add('  Cast(CASE');
            SQL.Add('      WHEN (SELECT emp_tipo FROM controle_empenho WHERE emp_idordemcorte= oc.oc_id AND emp_situacao <>''C'' LIMIT 1) IS NULL THEN ''N�O EMPENHADO''');
            SQL.Add('      ELSE');
            SQL.Add('          (CASE');
            SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            SQL.Add('                          AND emp_situacao IN (''N'', ''P'')');
            SQL.Add('                          AND emp_mod = ''0''');
            SQL.Add('                          ORDER BY emp_id DESC LIMIT 1)= ''S'' THEN ''PLANEJAMENTO => ALMOXARIFADO''');
            SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            SQL.Add('                          AND emp_situacao=''N''');
            SQL.Add('                          AND emp_mod = ''1''');
            SQL.Add('                          ORDER BY emp_id DESC LIMIT 1)= ''E'' THEN ''ALMOXARIFADO => CORTE''');
            SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            SQL.Add('                          AND emp_situacao= ''P''');
            SQL.Add('                          AND emp_mod = ''1''');
            SQL.Add('                          ORDER BY emp_id DESC LIMIT 1) =''E'' THEN ''RECEBIDO NO CORTE''');
            SQL.Add('              END)');
            SQL.Add('  END as character varying(30)) AS processoempenho,');
            SQL.Add('oc.oc_observacao FROM ordem_corte as oc JOIN produto_acabado as pa on pa.cad_id = oc.oc_idcodprodutoacabado LEFT JOIN colecao as cc on');
            SQL.Add('cc.co_id = pa.cad_idcolecao LEFT JOIN cadastro_estilista as ce on pa.cad_idestilista = ce.es_id LEFT JOIN ordem_corte_situacao as ocs on');
            SQL.Add('ocs.os_id = oc.oc_situacao WHERE oc.oc_situacao <> ''2''');
            if comboFiltro.Text = 'REFERENCIA' then
            begin
                SQL.Add('AND pa.cad_idreferencia = :referencia');
                ParamByName('referencia').AsString := editSearch.Text;
            end;
            if comboFiltro.Text = 'NUMERO DA FICHA' then
            begin
                SQL.Add('AND oc.oc_idfichatecnica = :fichatecnica');
                ParamByName('fichatecnica').AsInteger := strtointdef(editSearch.Text,0);
            end;
            if comboFiltro.Text = 'ORDEM DE CORTE' then
            begin
                SQL.Add('AND oc.oc_id = :ordemdecorte');
                ParamByName('ordemdecorte').AsInteger := strtointdef(editSearch.Text,0);
            end;
            if comboFiltro.Text = 'DESCRICAO REFERENCIA' then
            begin
                SQL.Add('AND pa.cad_descricao = :descricao');
                ParamByName('descricao').AsString := editSearch.Text;
            end;
            if comboTipo.Text = 'Prototipo' then
                SQL.Add('AND oc.oc_prototipo = true');
            if comboTipo.Text = 'Grande Escala' then
                SQL.Add('AND oc.oc_prototipo = false');
            if dbLkComboEstilo.KeyValue <> Null then
            begin
                SQL.Add('AND ce.es_id = :estilista');
                ParamByName('estilista').AsInteger := dbLkComboEstilo.KeyValue;
            end;
            if comboSetor.Text = 'ALMOXARIFADO' then
                SQL.Add('AND oc.oc_dtempenho IS NOT NULL');
            if comboSetor.Text = 'PLANEJAMENTO' then
                SQL.Add('AND oc.oc_dtempenho IS NULL');
            if comboSetor.Text = 'CORTE' then
                SQL.Add('AND oc.oc_dtrecempenho IS NOT NULL');
            if comboSituacao.Text = 'NORMAL' then
                SQL.Add('AND oc.oc_situacao = 1');
            if comboSituacao.Text = 'FINALIZADA' then
                SQL.Add('AND oc.oc_situacao = 3');
            if comboIniOrd.ItemIndex <> -1 then
            begin
                if comboIniOrd.ItemIndex = 0 then
                    SQL.Add('AND EXISTS(');
                if comboIniOrd.ItemIndex = 1 then
                    SQL.Add('AND NOT EXISTS(');
                    SQL.Add('SELECT * FROM ordem_producao AS op WHERE op.op_idordemcorte = oc.oc_id AND op.op_idstatus <> 4)');
            end;
            if dbLColecao.KeyValue <> Null then
            begin
                SQL.Add('AND pa.cad_idcolecao = :colecao');
                ParamByName('colecao').AsInteger := dbLColecao.KeyValue;
            end;
           if comboFiltroData.ItemIndex <> -1 then
           begin
              if comboFiltroData.ItemIndex <> 0 then
              begin
                if comboFiltroData.ItemIndex = 1 then
                    SQL.Add('AND oc_dtgerada BETWEEN :data1 AND :data2');
                if comboFiltroData.ItemIndex = 2 then
                    SQL.Add('AND oc_dtsolicitacao BETWEEN :data1 AND :data2');
                if comboFiltroData.ItemIndex = 3 then
                    SQL.Add('AND oc_dtprevisaofinalizacao BETWEEN :data1 AND :data2');
                    ParamByName('data1').AsDate := dateTimePicker1.Date;
                    ParamByName('data2').AsDate := dateTimePicker2.Date;
              end;
           end;
            SQL.Add('ORDER BY oc.oc_id DESC LIMIT 23');
            Open;
      end;
      gridViewOrdemCorte;
    end;
end;

procedure TformPrincipal.butRealCortadoClick(Sender: TObject);
begin
      acaoRealCortadoExecute(Sender);
end;

procedure TformPrincipal.butClearColecaoClick(Sender: TObject);
begin
    dbLColecao.KeyValue := Null;
end;

procedure TformPrincipal.butVerCorteClick(Sender: TObject);
begin
    acaoBotaoVerCorteExecute(Sender);
end;

procedure TformPrincipal.CortePrevisto1Click(Sender: TObject);
begin
    gridOrdem.Visible:=false;
    formPrevisto:=TformPrevisto.Create(Self);
    formPrevisto.Parent:=Panel1;
    formPrevisto.Align:=alClient;
    formPrevisto.BorderStyle:=bsNone;
    formPrevisto.Show;
    //formIniciarCorte.labNumeroOrd.Caption := gridOrdem.Fields[0].Value;
    //formIniciarCorte.labOrd.Caption := gridOrdem.Fields[1].Value;
    desabComponentes;
end;

procedure TformPrincipal.desabComponentes;
begin
    butVerCorte.Enabled := false;
    butCortePrevisto.Enabled := false;
    butRealCortado.Enabled := false;
    butHistoricOrdem.Enabled := false;
    comboFiltro.Enabled := false;
    comboSituacao.Enabled := false;
    editSearch.Enabled := false;
    comboIniOrd.Enabled := false;
    comboTipo.Enabled := false;
    dbLkComboEstilo.Enabled := false;
    comboFiltroData.Enabled := false;
    comboSetor.Enabled := false;
    dateTimePicker1.Enabled := false;
    dateTimePicker2.Enabled := false;
    butOrdemPesquisar.Enabled := false;
    dbLColecao.Enabled := false;
    butClearTipo.Enabled := false;
    butClearEstilo.Enabled := false;
    butClearSetor.Enabled := false;
    butClearSituacao.Enabled := false;
    butLimpaIniOrdem.Enabled := false;
    butClearColecao.Enabled := false;
    labMostrAnos.Enabled := false;
    btnOrdemCorte.Enabled := false;
    btnEmpAlmoxarifado.Enabled := false;
    btnEmpFase.Enabled := false;
    btnEstoqueFase.Enabled := false;
    btnEstAproveitamento.Enabled := false;
    btnEntregaPecas.Enabled := false;
    btnObservacoes.Enabled := false;
    btnProcRestrito.Enabled := false;
end;

procedure TformPrincipal.dimensionarGrid(dbg: TDBGrid);
  type
  TArray = Array of Integer;
  procedure AjustarColumns(Swidth, TSize: Integer; Asize: TArray);
  var
    idx: Integer;
  begin
    if TSize = 0 then
    begin
      TSize := dbg.Columns.count;
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := (dbg.Width - dbg.Canvas.TextWidth('AAAAAA')
          ) div TSize
    end
    else
      for idx := 0 to dbg.Columns.count - 1 do
        dbg.Columns[idx].Width := dbg.Columns[idx].Width +
          (Swidth * Asize[idx] div TSize);
  end;

var
  idx, Twidth, TSize, Swidth: Integer;
  AWidth: TArray;
  Asize: TArray;
  NomeColuna: String;
begin
  SetLength(AWidth, dbg.Columns.count);
  SetLength(Asize, dbg.Columns.count);
  Twidth := 0;
  TSize := 0;
  for idx := 0 to dbg.Columns.count - 1 do
  begin
    NomeColuna := dbg.Columns[idx].Title.Caption;
    dbg.Columns[idx].Width := dbg.Canvas.TextWidth
      (dbg.Columns[idx].Title.Caption + 'A');
    AWidth[idx] := dbg.Columns[idx].Width;
    Twidth := Twidth + AWidth[idx];

    if Assigned(dbg.Columns[idx].Field) then
      Asize[idx] := dbg.Columns[idx].Field.Size
    else
      Asize[idx] := 1;

    TSize := TSize + Asize[idx];
  end;
  if TDBGridOption.dgColLines in dbg.Options then
    Twidth := Twidth + dbg.Columns.count;

  // adiciona a largura da coluna indicada do cursor
  if TDBGridOption.dgIndicator in dbg.Options then
    Twidth := Twidth + IndicatorWidth;

  Swidth := dbg.ClientWidth - Twidth;
  AjustarColumns(Swidth, TSize, Asize);
end;

procedure TformPrincipal.editSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #13 then
      butOrdemPesquisarClick(Sender);
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
var
  arquivo : String;
begin
    BorderStyle := bsSingle;
    BorderIcons := BorderIcons - [biMaximize];
    WindowState := wsNormal;
    Top := 0;
    Left := 0;
    Height := Screen.Height;
    Width := Screen.Width;
    dateTimePicker1.Date := now;
    dateTimePicker2.Date := now;
    arquivo := 'C:\Sistema DiaERP_\DiaAplicativo\OrdemCorte.exe_old';
    DeleteFile(arquivo);
end;

procedure TformPrincipal.FormResize(Sender: TObject);
begin
    panelFormPrincipal.Width:=Self.Width;
    panelMenuEsquerdo.Height:=Self.Height;
end;

procedure TformPrincipal.FormShow(Sender: TObject);
begin
    dmOrdemCorte.qyOrdemCorte.Active:=true;
    gridViewOrdemCorte;
    footerPrincipal.Panels.Items[0].Text := 'VERS�O: '+ versaoExe;
    boxColecao;
end;

procedure TformPrincipal.gridOrdemCellClick(Column: TColumn);
begin
    with dmOrdemCorte.qyVerCorteReal do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ordem_corte_itens_real');
        SQL.Add('WHERE oci_idocorte = :ordem');
        ParamByName('ordem').AsInteger := strtoint(gridOrdem.Fields[0].Value);
        Open;
        if dmOrdemCorte.qyVerCorteReal.RecordCount > 0 then
           butRealCortado.Enabled := true;
    end;

end;

procedure TformPrincipal.gridViewOrdemCorte;
begin
    gridOrdem.Columns[0].Title.Alignment:=taCenter;
    gridOrdem.Columns[0].Title.Caption:='N� Corte';
    gridOrdem.Columns[1].Title.Alignment:=taCenter;
    gridOrdem.Columns[1].Title.Caption:='Ordem';
    gridOrdem.Columns[2].Title.Alignment:=taCenter;
    gridOrdem.Columns[2].Title.Caption:='Cole��o';
    gridOrdem.Columns[3].Title.Alignment:=taCenter;
    gridOrdem.Columns[3].Title.Caption:='Situa��o';
    gridOrdem.Columns[4].Title.Alignment:=taCenter;
    gridOrdem.Columns[4].Title.Caption:='Estilista';
    gridOrdem.Columns[5].Title.Alignment:=taCenter;
    gridOrdem.Columns[5].Title.Caption:='Ficha T�cnica';
    gridOrdem.Columns[6].Title.Alignment:=taCenter;
    gridOrdem.Columns[6].Title.Caption:='Ordem de Produ��o';
    gridOrdem.Columns[7].Title.Alignment:=taCenter;
    gridOrdem.Columns[7].Title.Caption:='Dias em Processo';
    gridOrdem.Columns[8].Title.Alignment:=taCenter;
    gridOrdem.Columns[8].Title.Caption:='Tipo';
    gridOrdem.Columns[9].Title.Alignment:=taCenter;
    gridOrdem.Columns[9].Title.Caption:='Refer�ncia';
    gridOrdem.Columns[10].Title.Alignment:=taCenter;
    gridOrdem.Columns[10].Title.Caption:='Produto Acabado';
    gridOrdem.Columns[11].Title.Alignment:=taCenter;
    gridOrdem.Columns[11].Title.Caption:='Inicio Ordem de Corte';
    gridOrdem.Columns[12].Title.Alignment:=taCenter;
    gridOrdem.Columns[12].Title.Caption:='Corte Previsto';
    gridOrdem.Columns[13].Title.Alignment:=taCenter;
    gridOrdem.Columns[13].Title.Caption:='Real Cortado';
    gridOrdem.Columns[14].Title.Alignment:=taCenter;
    gridOrdem.Columns[14].Title.Caption:='Localiza��o Empenho';
    gridOrdem.Columns[15].Title.Alignment:=taCenter;
    gridOrdem.Columns[15].Title.Caption:='Observa��o';
    butVerCorte.Font.Color:=clMenuHighlight;
    butVerCorte.Font.Style:=[fsBold];
    butCortePrevisto.Font.Color:=clMenuHighlight;
    butCortePrevisto.Font.Style:=[fsBold];
    butHistoricOrdem.Font.Color:=clMenuHighlight;
    butHistoricOrdem.Font.Style:=[fsBold];
    butRealCortado.Font.Color:=clMenuhighlight;
    butRealCortado.Font.Style:=[fsBold];
    butRealCortado.Enabled := false;
    comboTipo.Text:='';
end;

procedure TformPrincipal.habComponentes;
begin
    butVerCorte.Enabled := true;
    butCortePrevisto.Enabled := true;
    butHistoricOrdem.Enabled := true;
    comboFiltro.Enabled := true;
    comboSituacao.Enabled := true;
    editSearch.Enabled := true;
    comboIniOrd.Enabled := true;
    comboTipo.Enabled := true;
    dbLkComboEstilo.Enabled := true;
    comboFiltroData.Enabled := true;
    comboSetor.Enabled := true;
    dateTimePicker1.Enabled := true;
    dateTimePicker2.Enabled := true;
    butOrdemPesquisar.Enabled := true;
    dbLColecao.Enabled := true;
    butClearTipo.Enabled := true;
    butClearEstilo.Enabled := true;
    butClearSetor.Enabled := true;
    butClearSituacao.Enabled := true;
    butLimpaIniOrdem.Enabled := true;
    butClearColecao.Enabled := true;
    labMostrAnos.Enabled := true;
    btnOrdemCorte.Enabled := true;
    btnEmpAlmoxarifado.Enabled := true;
    btnEmpFase.Enabled := true;
    btnEstoqueFase.Enabled := true;
    btnEstAproveitamento.Enabled := true;
    btnEntregaPecas.Enabled := true;
    btnObservacoes.Enabled := true;
    btnProcRestrito.Enabled := true;
end;

function TformPrincipal.versaoExe: string;
type
   PFFI = ^vs_FixedFileInfo;
var
   F       : PFFI;
   Handle  : Dword;
   Len     : Longint;
   Data    : Pchar;
   Buffer  : Pointer;
   Tamanho : Dword;
   Parquivo: Pchar;
   Arquivo : String;
begin
   Arquivo  := Application.ExeName;
   Parquivo := StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result := '';
   if Len > 0 then
   begin
      Data:=StrAlloc(Len+1);
      if GetFileVersionInfo(Parquivo,Handle,Len,Data) then
      begin
         VerQueryValue(Data, '',Buffer,Tamanho);
         F := PFFI(Buffer);
         Result := Format('%d.%d.%d.%d',
                          [HiWord(F^.dwFileVersionMs),
                           LoWord(F^.dwFileVersionMs),
                           HiWord(F^.dwFileVersionLs),
                           Loword(F^.dwFileVersionLs)]
                         );
      end;
      StrDispose(Data);
   end;
   StrDispose(Parquivo);
end;
procedure TformPrincipal.IniciarCorte1Click(Sender: TObject);
begin
    gridOrdem.Visible:=false;
    formIniciarCorte:=TformIniciarCorte.Create(Self);
    formIniciarCorte.Parent:=Panel1;
    formIniciarCorte.Align:=alClient;
    formIniciarCorte.BorderStyle:=bsNone;
    formIniciarCorte.Show;
    desabComponentes;
end;

procedure TformPrincipal.labMostrAnosClick(Sender: TObject);
begin
    With dmOrdemCorte.qyBoxColecao do
    begin
        Close;
        SQl.Clear;
        SQl.add('SELECT co_id,');
        SQl.add('CAST(CONCAT(co_descricao,'' de '', to_char(co_anocolecao, ''YYYY''))AS character varying(25))AS nome');
        SQl.add('FROM colecao');
        SQl.add('ORDER BY co_anocolecao');
        Open;
    end;
end;

end.
