unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ToolWin, Vcl.ActnMan,
  Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TFormPrincipal = class(TForm)
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
    butVerCorte: TBitBtn;
    butCortePrevisto: TBitBtn;
    butHistoricOrdem: TBitBtn;
    Panel2: TPanel;
    labFiltro: TLabel;
    labTipo: TLabel;
    comboTipo: TComboBox;
    butOrdemPesquisar: TSpeedButton;
    labEstilista: TLabel;
    comboEstilista: TComboBox;
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
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butVerCorteClick(Sender: TObject);
    procedure butCortePrevistoClick(Sender: TObject);
    procedure butHistoricOrdemClick(Sender: TObject);
    procedure butOrdemPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UnitDatamodule;

procedure TFormPrincipal.butCortePrevistoClick(Sender: TObject);
begin
    ShowMessage('Mensagem de teste: Corte Previsto');
end;

procedure TFormPrincipal.butHistoricOrdemClick(Sender: TObject);
begin
    ShowMessage('Mensagem de teste: Ver o Historico Ordem de Corte');
end;

procedure TFormPrincipal.butOrdemPesquisarClick(Sender: TObject);
begin
    begin
      With dmOrdemCorte do
      begin
            qyOrdemCorte.Close;
            qyOrdemCorte.SQL.Clear;
            qyOrdemCorte.SQL.Add('SELECT');
            qyOrdemCorte.SQL.Add('Cast(concat(lpad(cast(oc.oc_id As varchar), 7, ''0''), ''-'', lpad(cast(oc.oc_ordem As varchar), 3, ''0'') )as character varying(15))as NumerodoCorte,');
            qyOrdemCorte.SQL.Add('cc.co_descricao, (ocs.os_nome)as situacao,');
            qyOrdemCorte.SQL.Add('(ce.es_nome)as estilista,');
            qyOrdemCorte.SQL.Add('oc.oc_idfichatecnica,');
            qyOrdemCorte.SQL.Add('(SELECT op.op_id FROM ordem_producao AS op WHERE op.op_idordemcorte = oc.oc_id AND op.op_idstatus <> ''4'')as noordproducao,');
            qyOrdemCorte.SQL.Add('(SELECT (CASE WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) = 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
            qyOrdemCorte.SQL.Add('                  CURRENT_DATE - oc.oc_dtgerada::DATE');
            qyOrdemCorte.SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
            qyOrdemCorte.SQL.Add('                  CURRENT_DATE - ocpi.oci_dtlanc::DATE');
            qyOrdemCorte.SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) > 0)) THEN');
            qyOrdemCorte.SQL.Add('                  CURRENT_DATE - ocri.oci_dtlanc::DATE');
            qyOrdemCorte.SQL.Add('         ELSE 0 END)');
            qyOrdemCorte.SQL.Add('     FROM ordem_corte as oci LEFT JOIN ordem_corte_itens_previsto as ocpi on');
            qyOrdemCorte.SQL.Add('     ((ocpi.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT IN (2, 4)))');
            qyOrdemCorte.SQL.Add('     LEFT JOIN ordem_corte_itens_real as ocri on');
            qyOrdemCorte.SQL.Add('     ((ocri.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT IN (2, 4)))');
            qyOrdemCorte.SQL.Add('     WHERE oci.oc_id=oc.oc_id');
            qyOrdemCorte.SQL.Add('     LIMIT 1');
            qyOrdemCorte.SQL.Add(') AS diasemprocesso,');
            qyOrdemCorte.SQL.Add('Cast(Case When oc.oc_prototipo = True Then ''Prot�tipo'' ELSE ''Grande Escala'' END as character varying(15)) AS tipo,');
            qyOrdemCorte.SQL.Add('(pa.cad_idreferencia)as referencia,');
            qyOrdemCorte.SQL.Add('(pa.cad_descricao)as produtoacabado,');
            qyOrdemCorte.SQL.Add('(oc.oc_dtgerada)as datagerada,');
            qyOrdemCorte.SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_previsto WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradeprevisto,');
            qyOrdemCorte.SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_real WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradereal,');
            qyOrdemCorte.SQL.Add('  Cast(CASE');
            qyOrdemCorte.SQL.Add('      WHEN (SELECT emp_tipo FROM controle_empenho WHERE emp_idordemcorte= oc.oc_id And emp_situacao <>''C'' LIMIT 1) IS NULL THEN ''N�O EMPENHADO''');
            qyOrdemCorte.SQL.Add('      ELSE');
            qyOrdemCorte.SQL.Add('          (CASE');
            qyOrdemCorte.SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            qyOrdemCorte.SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            qyOrdemCorte.SQL.Add('                          AND emp_situacao IN (''N'', ''P'')');
            qyOrdemCorte.SQL.Add('                          AND emp_mod = ''0''');
            qyOrdemCorte.SQL.Add('                          ORDER BY emp_id DESC LIMIT 1)= ''S'' THEN ''PLANEJAMENTO => ALMOXARIFADO''');
            qyOrdemCorte.SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            qyOrdemCorte.SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            qyOrdemCorte.SQL.Add('                          AND emp_situacao=''N''');
            qyOrdemCorte.SQL.Add('                          AND emp_mod = ''1''');
            qyOrdemCorte.SQL.Add('                          ORDER BY emp_id DESC LIMIT 1)= ''E'' THEN ''ALMOXARIFADO => CORTE''');
            qyOrdemCorte.SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            qyOrdemCorte.SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            qyOrdemCorte.SQL.Add('                          AND emp_situacao= ''P''');
            qyOrdemCorte.SQL.Add('                          AND emp_mod = ''1''');
            qyOrdemCorte.SQL.Add('                          ORDER BY emp_id DESC LIMIT 1) =''E'' THEN ''RECEBIDO NO CORTE''');
            qyOrdemCorte.SQL.Add('              END)');
            qyOrdemCorte.SQL.Add('  END as character varying(30)) AS processoempenho,');
            qyOrdemCorte.SQL.Add('oc.oc_observacao FROM ordem_corte as oc JOIN produto_acabado as pa on pa.cad_id = oc.oc_idcodprodutoacabado LEFT JOIN colecao as cc on');
            qyOrdemCorte.SQL.Add('cc.co_id = pa.cad_idcolecao LEFT JOIN cadastro_estilista as ce on pa.cad_idestilista = ce.es_id LEFT JOIN ordem_corte_situacao as ocs on');
            qyOrdemCorte.SQL.Add('ocs.os_id = oc.oc_situacao WHERE oc.oc_situacao <> ''2''');
            if comboFiltro.Text = 'REFERENCIA' then
            begin
                qyOrdemCorte.SQL.Add('and pa.cad_idreferencia = :referencia');
                qyOrdemCorte.ParamByName('referencia').AsString := editSearch.Text;
            end;
            if comboFiltro.Text = 'NUMERO DA FICHA' then
            begin
                qyOrdemCorte.SQL.Add('and oc.oc_idfichatecnica = :fichatecnica');
                qyOrdemCorte.ParamByName('fichatecnica').AsInteger := strtoint(editSearch.Text);
            end;
            if comboFiltro.Text = 'ORDEM DE CORTE' then
            begin
                qyOrdemCorte.SQL.Add('and oc.oc_id = :ordemdecorte');
                qyOrdemCorte.ParamByName('ordemdecorte').AsInteger := strtoint(editSearch.Text);
            end;
            if comboFiltro.Text = 'DESCRICAO REFERENCIA' then
            begin
                qyOrdemCorte.SQL.Add('and pa.cad_descricao = :descricao');
                qyOrdemCorte.ParamByName('descricao').AsString := editSearch.Text;
            end;
            if comboTipo.Text = 'Prototipo' then
                qyOrdemCorte.SQL.Add('and oc.oc_prototipo = true');
            if comboTipo.Text = 'Grande Escala' then
                qyOrdemCorte.SQL.Add('and oc.oc_prototipo = false');
            if comboEstilista.ItemIndex <> -1 then
            begin
                qyOrdemCorte.SQL.Add('and ce.es_nome = :estilista');
                qyOrdemCorte.ParamByName('estilista').AsString := comboEstilista.Text;
            end;
            if comboSetor.Text = 'ALMOXARIFADO' then
                qyOrdemCorte.SQL.Add('and (select emp_tipo from controle_empenho where emp_idordemcorte=oc.oc_id and emp_situacao in (''N'', ''P'') and emp_mod = 0 ORDER BY emp_id DESC LIMIT 1) = ''S''');
            if comboSetor.Text = 'PLANEJAMENTO' then
                qyOrdemCorte.SQL.Add('and (select emp_tipo from controle_empenho where emp_idordemcorte=oc.oc_id and emp_situacao = ''N'' and emp_mod = 1 ORDER BY emp_id DESC LIMIT 1) = ''E''');
            if comboSetor.Text = 'CORTE' then
                qyOrdemCorte.SQL.Add('and (select emp_tipo from controle_empenho where emp_idordemcorte=oc.oc_id and emp_situacao = ''P'' and emp_mod = 1 ORDER BY emp_id DESC LIMIT 1) = ''E''');
            if comboSituacao.Text = 'NORMAL' then
                qyOrdemCorte.SQL.Add('and oc.oc_situacao = 1');
            if comboSituacao.Text = 'FINALIZADA' then
                qyOrdemCorte.SQL.Add('and oc.oc_situacao = 3');
            if comboIniOrd.ItemIndex <> -1 then
            begin
                if comboIniOrd.ItemIndex = 0 then
                    qyOrdemCorte.SQL.Add('and exists(');
                if comboIniOrd.ItemIndex = 1 then
                    qyOrdemCorte.SQL.Add('and not exists(');
                    qyOrdemCorte.SQL.Add('select * from ordem_producao as op where op.op_idordemcorte = oc.oc_id and op.op_idstatus <> 4)');
            end;
            qyOrdemCorte.SQL.Add('ORDER BY oc.oc_id desc limit 30');
            qyOrdemCorte.Open;
      end;

      gridOrdem.Columns[0].Alignment:=taCenter;
      gridOrdem.Columns[0].Title.Alignment:=taCenter;
      gridOrdem.Columns[0].Title.Caption:='N� Corte';
      gridOrdem.Columns[1].Alignment:=taCenter;
      gridOrdem.Columns[1].Title.Alignment:=taCenter;
      gridOrdem.Columns[1].Title.Caption:='Cole��o';
      gridOrdem.Columns[2].Alignment:=taCenter;
      gridOrdem.Columns[2].Title.Alignment:=taCenter;
      gridOrdem.Columns[2].Title.Caption:='Situa��o';
      gridOrdem.Columns[3].Alignment:=taCenter;
      gridOrdem.Columns[3].Title.Alignment:=taCenter;
      gridOrdem.Columns[3].Title.Caption:='Estilista';
      gridOrdem.Columns[4].Alignment:=taCenter;
      gridOrdem.Columns[4].Title.Alignment:=taCenter;
      gridOrdem.Columns[4].Title.Caption:='Ficha T�cnica';
      gridOrdem.Columns[5].Alignment:=taCenter;
      gridOrdem.Columns[5].Title.Alignment:=taCenter;
      gridOrdem.Columns[5].Title.Caption:='Ordem de Produ��o';
      gridOrdem.Columns[6].Alignment:=taCenter;
      gridOrdem.Columns[6].Title.Alignment:=taCenter;
      gridOrdem.Columns[6].Title.Caption:='Dias em Processo';
      gridOrdem.Columns[7].Alignment:=taCenter;
      gridOrdem.Columns[7].Title.Alignment:=taCenter;
      gridOrdem.Columns[7].Title.Caption:='Tipo';
      gridOrdem.Columns[8].Alignment:=taCenter;
      gridOrdem.Columns[8].Title.Alignment:=taCenter;
      gridOrdem.Columns[8].Title.Caption:='Refer�ncia';
      gridOrdem.Columns[9].Alignment:=taCenter;
      gridOrdem.Columns[9].Title.Alignment:=taCenter;
      gridOrdem.Columns[9].Title.Caption:='Produto Acabado';
      gridOrdem.Columns[10].Alignment:=taCenter;
      gridOrdem.Columns[10].Title.Alignment:=taCenter;
      gridOrdem.Columns[10].Title.Caption:='Inicio Ordem de Corte';
      gridOrdem.Columns[11].Alignment:=taCenter;
      gridOrdem.Columns[11].Title.Alignment:=taCenter;
      gridOrdem.Columns[11].Title.Caption:='Corte Previsto';
      gridOrdem.Columns[12].Alignment:=taCenter;
      gridOrdem.Columns[12].Title.Alignment:=taCenter;
      gridOrdem.Columns[12].Title.Caption:='Real Cortado';
      gridOrdem.Columns[13].Alignment:=taCenter;
      gridOrdem.Columns[13].Title.Alignment:=taCenter;
      gridOrdem.Columns[13].Title.Caption:='Localiza��o Empenho';
      gridOrdem.Columns[14].Alignment:=taCenter;
      gridOrdem.Columns[14].Title.Alignment:=taCenter;
      gridOrdem.Columns[14].Title.Caption:='Observa��o'
    end;
end;

procedure TFormPrincipal.butVerCorteClick(Sender: TObject);
begin
    ShowMessage('Mensagem de teste: Ver o Corte');
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
    //labelNomeUsuario.Caption:=Query;
end;

procedure TFormPrincipal.FormResize(Sender: TObject);
begin
    panelFormPrincipal.Width:=Self.Width;
    panelMenuEsquerdo.Height:=Self.Height;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
    begin
      With dmOrdemCorte do
      begin
            qyOrdemCorte.Close;
            qyOrdemCorte.SQL.Clear;
            qyOrdemCorte.SQL.Add('SELECT');
            qyOrdemCorte.SQL.Add('Cast(concat(lpad(cast(oc.oc_id As varchar), 7, ''0''), ''-'', lpad(cast(oc.oc_ordem As varchar), 3, ''0'') )as character varying(15))as NumerodoCorte,');
            qyOrdemCorte.SQL.Add('cc.co_descricao, (ocs.os_nome)as situacao,');
            qyOrdemCorte.SQL.Add('(ce.es_nome)as estilista,');
            qyOrdemCorte.SQL.Add('oc.oc_idfichatecnica,');
            qyOrdemCorte.SQL.Add('(SELECT op.op_id FROM ordem_producao AS op WHERE op.op_idordemcorte = oc.oc_id AND op.op_idstatus <> ''4'')as noordproducao,');
            qyOrdemCorte.SQL.Add('(SELECT (CASE WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) = 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
            qyOrdemCorte.SQL.Add('                  CURRENT_DATE - oc.oc_dtgerada::DATE');
            qyOrdemCorte.SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
            qyOrdemCorte.SQL.Add('                  CURRENT_DATE - ocpi.oci_dtlanc::DATE');
            qyOrdemCorte.SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) > 0)) THEN');
            qyOrdemCorte.SQL.Add('                  CURRENT_DATE - ocri.oci_dtlanc::DATE');
            qyOrdemCorte.SQL.Add('         ELSE 0 END)');
            qyOrdemCorte.SQL.Add('     FROM ordem_corte as oci LEFT JOIN ordem_corte_itens_previsto as ocpi on');
            qyOrdemCorte.SQL.Add('     ((ocpi.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT IN (2, 4)))');
            qyOrdemCorte.SQL.Add('     LEFT JOIN ordem_corte_itens_real as ocri on');
            qyOrdemCorte.SQL.Add('     ((ocri.oci_idocorte = oci.oc_id) and (ocpi.oci_situacao_id NOT IN (2, 4)))');
            qyOrdemCorte.SQL.Add('     WHERE oci.oc_id=oc.oc_id');
            qyOrdemCorte.SQL.Add('     LIMIT 1');
            qyOrdemCorte.SQL.Add(') AS diasemprocesso,');
            qyOrdemCorte.SQL.Add('Cast(Case When oc.oc_prototipo = True Then ''Prot�tipo'' ELSE ''Grande Escala'' END as character varying(15)) AS tipo,');
            qyOrdemCorte.SQL.Add('(pa.cad_idreferencia)as referencia,');
            qyOrdemCorte.SQL.Add('(pa.cad_descricao)as produtoacabado,');
            qyOrdemCorte.SQL.Add('(oc.oc_dtgerada)as datagerada,');
            qyOrdemCorte.SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_previsto WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradeprevisto,');
            qyOrdemCorte.SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_real WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradereal,');
            qyOrdemCorte.SQL.Add('  Cast(CASE');
            qyOrdemCorte.SQL.Add('      WHEN (SELECT emp_tipo FROM controle_empenho WHERE emp_idordemcorte= oc.oc_id And emp_situacao <>''C'' LIMIT 1) IS NULL THEN ''N�O EMPENHADO''');
            qyOrdemCorte.SQL.Add('      ELSE');
            qyOrdemCorte.SQL.Add('          (CASE');
            qyOrdemCorte.SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            qyOrdemCorte.SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            qyOrdemCorte.SQL.Add('                          AND emp_situacao IN (''N'', ''P'')');
            qyOrdemCorte.SQL.Add('                          AND emp_mod = ''0''');
            qyOrdemCorte.SQL.Add('                          ORDER BY emp_id DESC LIMIT 1)= ''S'' THEN ''PLANEJAMENTO => ALMOXARIFADO''');
            qyOrdemCorte.SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            qyOrdemCorte.SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            qyOrdemCorte.SQL.Add('                          AND emp_situacao=''N''');
            qyOrdemCorte.SQL.Add('                          AND emp_mod = ''1''');
            qyOrdemCorte.SQL.Add('                          ORDER BY emp_id DESC LIMIT 1)= ''E'' THEN ''ALMOXARIFADO => CORTE''');
            qyOrdemCorte.SQL.Add('              WHEN (SELECT emp_tipo FROM controle_empenho');
            qyOrdemCorte.SQL.Add('                          WHERE emp_idordemcorte=oc.oc_id');
            qyOrdemCorte.SQL.Add('                          AND emp_situacao= ''P''');
            qyOrdemCorte.SQL.Add('                          AND emp_mod = ''1''');
            qyOrdemCorte.SQL.Add('                          ORDER BY emp_id DESC LIMIT 1) =''E'' THEN ''RECEBIDO NO CORTE''');
            qyOrdemCorte.SQL.Add('              END)');
            qyOrdemCorte.SQL.Add('  END as character varying(30)) AS processoempenho,');
            qyOrdemCorte.SQL.Add('oc.oc_observacao FROM ordem_corte as oc JOIN produto_acabado as pa on pa.cad_id = oc.oc_idcodprodutoacabado LEFT JOIN colecao as cc on');
            qyOrdemCorte.SQL.Add('cc.co_id = pa.cad_idcolecao LEFT JOIN cadastro_estilista as ce on pa.cad_idestilista = ce.es_id LEFT JOIN ordem_corte_situacao as ocs on');
            qyOrdemCorte.SQL.Add('ocs.os_id = oc.oc_situacao WHERE oc.oc_situacao <> ''2'' AND not EXISTS (SELECT * FROM ordem_producao AS op');
            qyOrdemCorte.SQL.Add('                           WHERE op.op_idordemcorte=oc.oc_id and op.op_idstatus <> 4)');
            qyOrdemCorte.SQL.Add('ORDER BY oc.oc_id desc limit 50');
            qyOrdemCorte.Open;
            comboTipo.Items.Add('');
      end;
    end;
    gridOrdem.Columns[0].Alignment:=taCenter;
    gridOrdem.Columns[0].Title.Alignment:=taCenter;
    gridOrdem.Columns[0].Title.Caption:='N� Corte';
    gridOrdem.Columns[1].Alignment:=taCenter;
    gridOrdem.Columns[1].Title.Alignment:=taCenter;
    gridOrdem.Columns[1].Title.Caption:='Cole��o';
    gridOrdem.Columns[2].Alignment:=taCenter;
    gridOrdem.Columns[2].Title.Alignment:=taCenter;
    gridOrdem.Columns[2].Title.Caption:='Situa��o';
    gridOrdem.Columns[3].Alignment:=taCenter;
    gridOrdem.Columns[3].Title.Alignment:=taCenter;
    gridOrdem.Columns[3].Title.Caption:='Estilista';
    gridOrdem.Columns[4].Alignment:=taCenter;
    gridOrdem.Columns[4].Title.Alignment:=taCenter;
    gridOrdem.Columns[4].Title.Caption:='Ficha T�cnica';
    gridOrdem.Columns[5].Alignment:=taCenter;
    gridOrdem.Columns[5].Title.Alignment:=taCenter;
    gridOrdem.Columns[5].Title.Caption:='Ordem de Produ��o';
    gridOrdem.Columns[6].Alignment:=taCenter;
    gridOrdem.Columns[6].Title.Alignment:=taCenter;
    gridOrdem.Columns[6].Title.Caption:='Dias em Processo';
    gridOrdem.Columns[7].Alignment:=taCenter;
    gridOrdem.Columns[7].Title.Alignment:=taCenter;
    gridOrdem.Columns[7].Title.Caption:='Tipo';
    gridOrdem.Columns[8].Alignment:=taCenter;
    gridOrdem.Columns[8].Title.Alignment:=taCenter;
    gridOrdem.Columns[8].Title.Caption:='Refer�ncia';
    gridOrdem.Columns[9].Alignment:=taCenter;
    gridOrdem.Columns[9].Title.Alignment:=taCenter;
    gridOrdem.Columns[9].Title.Caption:='Produto Acabado';
    gridOrdem.Columns[10].Alignment:=taCenter;
    gridOrdem.Columns[10].Title.Alignment:=taCenter;
    gridOrdem.Columns[10].Title.Caption:='Inicio Ordem de Corte';
    gridOrdem.Columns[11].Alignment:=taCenter;
    gridOrdem.Columns[11].Title.Alignment:=taCenter;
    gridOrdem.Columns[11].Title.Caption:='Corte Previsto';
    gridOrdem.Columns[12].Alignment:=taCenter;
    gridOrdem.Columns[12].Title.Alignment:=taCenter;
    gridOrdem.Columns[12].Title.Caption:='Real Cortado';
    gridOrdem.Columns[13].Alignment:=taCenter;
    gridOrdem.Columns[13].Title.Alignment:=taCenter;
    gridOrdem.Columns[13].Title.Caption:='Localiza��o Empenho';
    gridOrdem.Columns[14].Alignment:=taCenter;
    gridOrdem.Columns[14].Title.Alignment:=taCenter;
    gridOrdem.Columns[14].Title.Caption:='Observa��o';
    butVerCorte.Font.Color:=clMenuHighlight;
    butVerCorte.Font.Style:=[fsBold];
    butCortePrevisto.Font.Color:=clMenuHighlight;
    butCortePrevisto.Font.Style:=[fsBold];
    butHistoricOrdem.Font.Color:=clMenuHighlight;
    butHistoricOrdem.Font.Style:=[fsBold];
    comboTipo.Text:='';
end;


end.
