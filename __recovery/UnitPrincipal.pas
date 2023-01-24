unit UnitPrincipal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  Vcl.ToolWin,
  Vcl.ActnMan,
  Vcl.ActnCtrls,
  Vcl.ActnMenus,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.DBCtrls, System.Actions, Vcl.ActnList;

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
    procedure acaoBotaoCorteRealExecute(Sender: TObject);
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
  private
    { Private declarations }
    procedure gridViewOrdemCorte;
  public
    { Public declarations }
    procedure boxColecao;
    function VersaoExe: String;
    procedure boxEstilista;
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitIniciarCorte;

procedure TformPrincipal.acaoBotaoCortePrevistoExecute(Sender: TObject);
begin
      if butCortePrevisto.Enabled = true then
            ShowMessage('Mensagem de teste: Corte Previsto');
end;

procedure TformPrincipal.acaoBotaoCorteRealExecute(Sender: TObject);
begin
      if butVerCorte.Enabled = true then
            ShowMessage('Mensagem de teste: Corte Real');
end;

procedure TformPrincipal.acaoBotaoHistoricoExecute(Sender: TObject);
begin
      if butHistoricOrdem.Enabled = true then
            ShowMessage('Mensagem de teste: Ver o Historico Ordem de Corte');
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
        SQL.Add('select es_id, es_nome');
        SQL.Add('from cadastro_estilista');
        SQL.Add('order by es_nome');
        Open;
    end;
end;
procedure TformPrincipal.boxColecao;
begin
    With dmOrdemCorte.qyBoxColecao do
    begin
        Close;
        SQl.Clear;
        SQl.add('Select co_id,');
        SQl.add('Cast(concat(co_descricao,'' de '', to_char(co_anocolecao, ''YYYY''))as character varying(25))as nome');
        SQl.add('from colecao');
        SQl.add('order by co_anocolecao desc limit 7');
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
            SQL.Add('SELECT');
            SQL.Add('Cast(concat(lpad(cast(oc.oc_id As varchar), 7, ''0''), ''-'', lpad(cast(oc.oc_ordem As varchar), 3, ''0'') )as character varying(15))as NumerodoCorte,');
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
            SQL.Add('Cast(Case When oc.oc_prototipo = True Then ''Protótipo'' ELSE ''Grande Escala'' END as character varying(15)) AS tipo,');
            SQL.Add('(pa.cad_idreferencia)as referencia,');
            SQL.Add('(pa.cad_descricao)as produtoacabado,');
            SQL.Add('(oc.oc_dtgerada)as datagerada,');
            SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_previsto WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradeprevisto,');
            SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_real WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradereal,');
            SQL.Add('  Cast(CASE');
            SQL.Add('      WHEN (SELECT emp_tipo FROM controle_empenho WHERE emp_idordemcorte= oc.oc_id And emp_situacao <>''C'' LIMIT 1) IS NULL THEN ''NÃO EMPENHADO''');
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
                SQL.Add('and pa.cad_idreferencia = :referencia');
                ParamByName('referencia').AsString := editSearch.Text;
            end;
            if comboFiltro.Text = 'NUMERO DA FICHA' then
            begin
                SQL.Add('and oc.oc_idfichatecnica = :fichatecnica');
                ParamByName('fichatecnica').AsInteger := strtointdef(editSearch.Text,0);
            end;
            if comboFiltro.Text = 'ORDEM DE CORTE' then
            begin
                SQL.Add('and oc.oc_id = :ordemdecorte');
                ParamByName('ordemdecorte').AsInteger := strtointdef(editSearch.Text,0);
            end;
            if comboFiltro.Text = 'DESCRICAO REFERENCIA' then
            begin
                SQL.Add('and pa.cad_descricao = :descricao');
                ParamByName('descricao').AsString := editSearch.Text;
            end;
            if comboTipo.Text = 'Prototipo' then
                SQL.Add('and oc.oc_prototipo = true');
            if comboTipo.Text = 'Grande Escala' then
                SQL.Add('and oc.oc_prototipo = false');
            if dbLkComboEstilo.KeyValue <> Null then
            begin
                SQL.Add('and ce.es_id = :estilista');
                ParamByName('estilista').AsInteger := dbLkComboEstilo.KeyValue;
            end;
            if comboSetor.Text = 'ALMOXARIFADO' then
                SQL.Add('and (select emp_tipo from controle_empenho where emp_idordemcorte=oc.oc_id and emp_situacao in (''N'', ''P'') and emp_mod = 0 ORDER BY emp_id DESC LIMIT 1) = ''S''');
            if comboSetor.Text = 'PLANEJAMENTO' then
                SQL.Add('and (select emp_tipo from controle_empenho where emp_idordemcorte=oc.oc_id and emp_situacao = ''N'' and emp_mod = 1 ORDER BY emp_id DESC LIMIT 1) = ''E''');
            if comboSetor.Text = 'CORTE' then
                SQL.Add('and (select emp_tipo from controle_empenho where emp_idordemcorte=oc.oc_id and emp_situacao = ''P'' and emp_mod = 1 ORDER BY emp_id DESC LIMIT 1) = ''E''');
            if comboSituacao.Text = 'NORMAL' then
                SQL.Add('and oc.oc_situacao = 1');
            if comboSituacao.Text = 'FINALIZADA' then
                SQL.Add('and oc.oc_situacao = 3');
            if comboIniOrd.ItemIndex <> -1 then
            begin
                if comboIniOrd.ItemIndex = 0 then
                    SQL.Add('and exists(');
                if comboIniOrd.ItemIndex = 1 then
                    SQL.Add('and not exists(');
                    SQL.Add('select * from ordem_producao as op where op.op_idordemcorte = oc.oc_id and op.op_idstatus <> 4)');
            end;
            if dbLColecao.KeyValue <> Null then
            begin
                SQL.Add('and pa.cad_idcolecao = :colecao');
                ParamByName('colecao').AsInteger := dbLColecao.KeyValue;
            end;
           if comboFiltroData.ItemIndex <> -1 then
           begin
              if comboFiltroData.ItemIndex <> 0 then
              begin
                if comboFiltroData.ItemIndex = 1 then
                    SQL.Add('and oc_dtgerada between :data1 and :data2');
                if comboFiltroData.ItemIndex = 2 then
                    SQL.Add('and oc_dtsolicitacao between :data1 and :data2');
                if comboFiltroData.ItemIndex = 3 then
                    SQL.Add('and oc_dtprevisaofinalizacao between :data1 and :data2');
                    ParamByName('data1').AsDate := dateTimePicker1.Date;
                    ParamByName('data2').AsDate := dateTimePicker2.Date;
              end;
           end;
            SQL.Add('ORDER BY oc.oc_id desc limit 30');
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
    acaoBotaoCorteRealExecute(Sender);
end;

procedure TformPrincipal.FormCreate(Sender: TObject);
begin
    dateTimePicker1.Date := now;
    dateTimePicker2.Date := now;
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
    footerPrincipal.Panels.Items[0].Text := 'VERSÃO: '+ VersaoExe;
    boxColecao;
    //if gridOrdem.SelectedRows. then

end;

procedure TformPrincipal.gridOrdemCellClick(Column: TColumn);
begin
 //   if gridOrdem.Columns[2].Field := 'FINALIZADA' then
  //     butRealCortado.Enabled := true;
end;

procedure TformPrincipal.gridViewOrdemCorte;
begin
    gridOrdem.Columns[0].Title.Alignment:=taCenter;
    gridOrdem.Columns[0].Title.Caption:='Nº Corte';
    gridOrdem.Columns[1].Title.Alignment:=taCenter;
    gridOrdem.Columns[1].Title.Caption:='Coleção';
    gridOrdem.Columns[2].Title.Alignment:=taCenter;
    gridOrdem.Columns[2].Title.Caption:='Situação';
    gridOrdem.Columns[3].Title.Alignment:=taCenter;
    gridOrdem.Columns[3].Title.Caption:='Estilista';
    gridOrdem.Columns[4].Title.Alignment:=taCenter;
    gridOrdem.Columns[4].Title.Caption:='Ficha Técnica';
    gridOrdem.Columns[5].Title.Alignment:=taCenter;
    gridOrdem.Columns[5].Title.Caption:='Ordem de Produção';
    gridOrdem.Columns[6].Title.Alignment:=taCenter;
    gridOrdem.Columns[6].Title.Caption:='Dias em Processo';
    gridOrdem.Columns[7].Title.Alignment:=taCenter;
    gridOrdem.Columns[7].Title.Caption:='Tipo';
    gridOrdem.Columns[8].Title.Alignment:=taCenter;
    gridOrdem.Columns[8].Title.Caption:='Referência';
    gridOrdem.Columns[9].Title.Alignment:=taCenter;
    gridOrdem.Columns[9].Title.Caption:='Produto Acabado';
    gridOrdem.Columns[10].Title.Alignment:=taCenter;
    gridOrdem.Columns[10].Title.Caption:='Inicio Ordem de Corte';
    gridOrdem.Columns[11].Title.Alignment:=taCenter;
    gridOrdem.Columns[11].Title.Caption:='Corte Previsto';
    gridOrdem.Columns[12].Title.Alignment:=taCenter;
    gridOrdem.Columns[12].Title.Caption:='Real Cortado';
    gridOrdem.Columns[13].Title.Alignment:=taCenter;
    gridOrdem.Columns[13].Title.Caption:='Localização Empenho';
    gridOrdem.Columns[14].Title.Alignment:=taCenter;
    gridOrdem.Columns[14].Title.Caption:='Observação';
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

function TformPrincipal.VersaoExe: string;
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
    formIniciarCorte:=TformIniciarCorte.Create(Self);
    formIniciarCorte.Parent:=gridOrdem;
    formIniciarCorte.Align:=alClient;
    formIniciarCorte.BorderStyle:=bsNone;
    formIniciarCorte.Show;
    butVerCorte.Enabled := false;
    butCortePrevisto.Enabled := false;
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
end;

procedure TformPrincipal.labMostrAnosClick(Sender: TObject);
begin
    With dmOrdemCorte.qyBoxColecao do
    begin
        Close;
        SQl.Clear;
        SQl.add('Select co_id,');
        SQl.add('Cast(concat(co_descricao,'' de '', to_char(co_anocolecao, ''YYYY''))as character varying(25))as nome');
        SQl.add('from colecao');
        SQl.add('order by co_anocolecao');
        Open;
    end;
end;

end.
