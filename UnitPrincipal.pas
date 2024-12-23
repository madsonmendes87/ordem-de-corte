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
    labCodUsuario: TLabel;
    LbSetor: TLabel;
    labDigitoSetor: TLabel;
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
    labDigitoUsuario: TLabel;
    LbNomeUsuario: TLabel;
    Panel1: TPanel;
    labCodSetor: TLabel;
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
    labNomeUsuario: TLabel;
    labNomeSetor: TLabel;
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
    procedure btnOrdemCorteClick(Sender: TObject);
    procedure btnObservacoesClick(Sender: TObject);
    procedure btnProcRestritoClick(Sender: TObject);
    procedure RealCortado1Click(Sender: TObject);
    procedure btnEmpAlmoxarifadoClick(Sender: TObject);
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
    procedure IniciaTransacao;
    procedure ComitaTransacao;
    procedure DesfazTransacao;
    procedure boxTipoProduto;
    procedure boxGradeTamanho;
    procedure boxComprador;
    procedure boxFornecedor;
  end;

var
  formPrincipal: TformPrincipal;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitIniciarCorte, UnitHistoricOrdem,
  UnitProdutoAcabado, UnitPrevisto, unitDMPrincipal, unitDMRealCortado,
  unitRealCortado, unitDMPrevisto, unitRecEmpenho;

procedure TformPrincipal.acaoBotaoCortePrevistoExecute(Sender: TObject);
begin
      if butCortePrevisto.Enabled = true then
        gridOrdem.Visible             :=false;
        formPrevisto                  :=TformPrevisto.Create(Self);
        formPrevisto.Parent           :=Panel1;
        formPrevisto.Align            :=alClient;
        formPrevisto.BorderStyle      :=bsNone;
        formPrevisto.Show;
        desabComponentes;
end;

procedure TformPrincipal.acaoBotaoVerCorteExecute(Sender: TObject);
begin
      if butVerCorte.Enabled = true then
          gridOrdem.Visible                       :=false;
          formIniciarCorte                        :=TformIniciarCorte.Create(Self);
          formIniciarCorte.Parent                 :=Panel1;
          formIniciarCorte.Align                  :=alClient;
          formIniciarCorte.BorderStyle            :=bsNone;
          formIniciarCorte.Show;
          formIniciarCorte.butNovo.Enabled        :=false;
          formIniciarCorte.butEditar.Enabled      :=true;
          formIniciarCorte.labNumeroOrd.Caption   :=intToStr(gridOrdem.Fields[0].Value) +'-00'+ intToStr(gridOrdem.Fields[1].Value);
          with dmPrincipal.qyDadosCorteById do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT oc_idcodprodutoacabado,oc_corte_aproveitamento, oc_complementar, oc_dtsolicitacao, oc_horasolicitacao, oc_dtprevisaofinalizacao,');
              SQL.Add('oc_hrprevisaofinalizacao, oc_datapreviniciocorteprevisto, oc_horapreviniciocorteprevisto, oc_dataprevfimcorteprevisto,');
              SQL.Add('oc_horaprevfimcorteprevisto, oc_datapreviniciorealcortado, oc_horapreviniciorealcortado, oc_dataprevfimrealcortado, oc_horaprevfimrealcortado,');
              SQL.Add('oc_observacao FROM ordem_corte');
              SQL.Add('  WHERE oc_id = :idCorte');
              ParamByName('idCorte').AsInteger := strtoint(gridOrdem.Fields[0].Value);
              Open;
              if dmPrincipal.qyDadosCorteById.FieldByName('oc_complementar').Value = false then
                  formIniciarCorte.labNaoComp.Caption   :='N�O';
              if dmPrincipal.qyDadosCorteById.FieldByName('oc_complementar').Value = true then
                  formIniciarCorte.labNaoComp.Caption   :='SIM';
              if dmPrincipal.qyDadosCorteById.FieldByName('oc_corte_aproveitamento').Value = false then
                  formIniciarCorte.labNaoAprov.Caption  :='N�O';
              if dmPrincipal.qyDadosCorteById.FieldByName('oc_corte_aproveitamento').Value = true then
                  formIniciarCorte.labNaoAprov.Caption  :='SIM';
          end;
          formIniciarCorte.editCodigo.Text              :=intToStr(dmPrincipal.qyDadosCorteById.FieldByName('oc_idcodprodutoacabado').Value);
          formIniciarCorte.editReferencia.Text          :=gridOrdem.Fields[9].Value;
          formIniciarCorte.editFicha.Text               :=intToStr(gridOrdem.Fields[5].Value);
          formIniciarCorte.editDescReferencia.Text      :=gridOrdem.Fields[10].Value;
          formIniciarCorte.labTipoCorte.Caption         :=gridOrdem.Fields[8].Value;
          formIniciarCorte.labNormal.Caption            :=gridOrdem.Fields[3].Value;
          formIniciarCorte.dataSolicitacao.Date         :=dmPrincipal.qyDadosCorteById.FieldByName('oc_dtsolicitacao').Value;
          formIniciarCorte.horaSolicitacao.Time         :=dmPrincipal.qyDadosCorteById.FieldByName('oc_horasolicitacao').Value;
          formIniciarCorte.dataOrdemFinalizacao.Date    :=dmPrincipal.qyDadosCorteById.FieldByName('oc_dtprevisaofinalizacao').Value;
          formIniciarCorte.horaOrdemFinalizacao.Time    :=dmPrincipal.qyDadosCorteById.FieldByName('oc_hrprevisaofinalizacao').Value;
          formIniciarCorte.dataCortePrevisto.Date       :=dmPrincipal.qyDadosCorteById.FieldByName('oc_datapreviniciocorteprevisto').Value;
          formIniciarCorte.horaCortePrevisto.Time       :=dmPrincipal.qyDadosCorteById.FieldByName('oc_horapreviniciocorteprevisto').Value;
          formIniciarCorte.dataFinalCortePrevisto.Date  :=dmPrincipal.qyDadosCorteById.FieldByName('oc_dataprevfimcorteprevisto').Value;
          formIniciarCorte.horaFinalCortePrevisto.Time  :=dmPrincipal.qyDadosCorteById.FieldByName('oc_horaprevfimcorteprevisto').Value;
          formIniciarCorte.dataRealCortado.Date         :=dmPrincipal.qyDadosCorteById.FieldByName('oc_datapreviniciorealcortado').Value;
          formIniciarCorte.horaRealCortado.Time         :=dmPrincipal.qyDadosCorteById.FieldByName('oc_horapreviniciorealcortado').Value;
          formIniciarCorte.dataFinalRealCortado.Date    :=dmPrincipal.qyDadosCorteById.FieldByName('oc_dataprevfimrealcortado').Value;
          formIniciarCorte.horaFinalRealCortado.Time    :=dmPrincipal.qyDadosCorteById.FieldByName('oc_horaprevfimrealcortado').Value;
          formIniciarCorte.editObservacao.Text          :=dmPrincipal.qyDadosCorteById.FieldByName('oc_observacao').Value;
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

var
      mediaTotal : double;
begin
      if butRealCortado.Enabled = true then
      begin
          gridOrdem.Visible                           :=false;
          formRealCortado                             :=TformRealCortado.Create(Self);
          formRealCortado.Parent                      :=Panel1;
          formRealCortado.Align                       :=alClient;
          formRealCortado.BorderStyle                 :=bsNone;
          formRealCortado.Show;
          formRealCortado.labNumCorte.Caption         :=intToStr(formPrincipal.gridOrdem.Fields[0].Value) +'-00'+ intToStr(formPrincipal.gridOrdem.Fields[1].Value);
          formRealCortado.labNumReferencia.Caption    :=formPrincipal.gridOrdem.Fields[9].Value;
          formRealCortado.labNomeDescricao.Caption    :=formPrincipal.gridOrdem.Fields[10].Value;

          with dmRealCortado.qyOrdemPrototipo do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT *');
              SQL.Add(' FROM ordem_corte AS oc JOIN ficha_tecnica AS ft ON ft.fi_id = oc.oc_idfichatecnica');
              SQL.Add(' WHERE');
              SQL.Add(' oc.oc_idfichatecnica = :fichatecnica');
              SQL.Add(' AND oc.oc_prototipo = true');
              SQL.Add(' AND oc.oc_situacao <> ''2''');
              SQL.Add(' ORDER BY oc_id DESC');
              ParamByName('fichatecnica').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[5].Value);
              Open;
          end;

          if formPrincipal.gridOrdem.Fields[8].Value = 'Grande Escala' then
          begin
              if dmRealCortado.qyOrdemPrototipo.RecordCount > 0 then
              begin
                  formRealCortado.butPrototipo.Visible :=true;
                  formRealCortado.labPrototipo.Visible :=true;
                  formRealCortado.labPrototipo.Caption :='Prot�tipo: '+intToStr(dmRealCortado.qyOrdemPrototipo.FieldByName('oc_id').Value)+'-00'+
                  intToStr(dmRealCortado.qyOrdemPrototipo.FieldByName('oc_ordem').Value);
              end;
              if dmRealCortado.qyOrdemPrototipo.RecordCount = 0 then
              begin
                  formRealCortado.butPrototipo.Visible :=false;
                  formRealCortado.labPrototipo.Visible :=false;
              end;
          end;
          if formPrincipal.gridOrdem.Fields[8].Value = 'Prototipo' then
          begin
              formRealCortado.butPrototipo.Visible :=false;
              formRealCortado.labPrototipo.Visible :=false;
          end;

          with dmRealCortado.qyCodProdAcabadoFicha do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT pa.cad_id FROM produto_acabado AS pa JOIN ficha_tecnica AS ft');
              SQL.Add(' ON ft.fi_idprodutoacabado = pa.cad_id WHERE ft.fi_id = :fichatecnica');

              ParamByName('fichatecnica').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
              Open;
          end;

          formRealCortado.labCodProdAcabado.Caption :=intToStr(dmRealCortado.qyCodProdAcabadoFicha.FieldByName('cad_id').Value);

          with dmRealCortado.qyStatusRealCortado do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT oci_situacao_id, descricao FROM ordem_corte_itens_real, ordem_corte_itens_situacao');
              SQL.Add('   WHERE oci_idocorte = :idcorte AND oci_situacao_id = id;');

              ParamByName('idcorte').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
              Open;
          end;

          if dmRealCortado.qyStatusRealCortado.FieldByName('oci_situacao_id').Value = 1 then
          begin
              formRealCortado.labStatuSituacao.Caption    :=dmRealCortado.qyStatusRealCortado.FieldByName('descricao').Value;
              formRealCortado.labStatuSituacao.Font.Color :=clRed;
          end;

          if dmRealCortado.qyStatusRealCortado.FieldByName('oci_situacao_id').Value = 3 then
          begin
              formRealCortado.labStatuSituacao.Caption    :='CORTADO';
              formRealCortado.labStatuSituacao.Font.Color :=clOlive;
          end;

          if dmRealCortado.qyStatusRealCortado.FieldByName('oci_situacao_id').Value = 4 then
          begin
              formRealCortado.labStatuSituacao.Caption    :=dmRealCortado.qyStatusRealCortado.FieldByName('descricao').Value;
              formRealCortado.labStatuSituacao.Font.Color :=clNavy;
          end;


          if formRealCortado.labStatuSituacao.Caption = 'NORMAL' then
          begin
              formRealCortado.butNovo.Enabled                                                   :=false;
              formRealCortado.butOrdemCorte.Enabled                                             :=false;
              formRealCortado.popupCortado.Items.Find('Retirar Cortado').Enabled                :=false;
              formRealCortado.popupAcao.Items.Find('Reabrir').Enabled                           :=false;
          end;

          if formRealCortado.labStatuSituacao.Caption = 'CORTADO' then
          begin
              formRealCortado.butNovo.Enabled                                                   :=false;
              formRealCortado.butOrdemCorte.Enabled                                             :=false;
              formRealCortado.butSalvar.Enabled                                                 :=false;
              formRealCortado.popupCortado.Items.Find('Consumo Cortado').Enabled                :=false;
              formRealCortado.popupAcao.Items.Find('Reabrir').Enabled                           :=false;
          end;

          if formRealCortado.labStatuSituacao.Caption = 'FINALIZADO' then
          begin
              formRealCortado.butNovo.Enabled                                                   :=false;
              formRealCortado.butOrdemCorte.Enabled                                             :=false;
              formRealCortado.butSalvar.Enabled                                                 :=false;
              formRealCortado.butCortado.Enabled                                                :=false;
              formRealCortado.butReceberTecido.Enabled                                          :=false;
              formRealCortado.popupArtigos.Items.Find('Adicionar Prim�rio').Enabled             :=false;
              formRealCortado.popupArtigos.Items.Find('Adicionar Secund�rio').Enabled           :=false;
              formRealCortado.popupArtigos.Items.Find('Retirar').Enabled                        :=false;
              formRealCortado.popupAcao.Items.Find('Sobras').Enabled                            :=false;
              formRealCortado.popupAcao.Items.Find('Empenho').Enabled                           :=false;
              formRealCortado.popupAcao.Items.Find('Finalizar').Enabled                         :=false;
          end;


          if formPrincipal.gridOrdem.Fields[8].Value = 'Prototipo' then
             formRealCortado.panelCabecalho.Caption   :='Real Cortado - Prot�tipo'
          else
              formRealCortado.panelCabecalho.Caption  :='Real Cortado - Grande Escala';

          with dmRealCortado.qyFichaIdCorte do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT * FROM ficha_tecnica_itens');
              SQL.Add(' WHERE fti_idfichatec = :ficha');

              ParamByName('ficha').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
              Open;

              if dmRealCortado.qyFichaIdCorte.RecordCount > 0 then
              begin
                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam1').Value = '' then
                  begin
                      formRealCortado.labTam1.Visible             :=false;
                      formRealCortado.spinTamanho1.Visible        :=false;
                      formRealCortado.labIndividual1.Visible      :=false;
                      formRealCortado.labTotal1.Visible           :=false;
                      formRealCortado.labRealTam1.Visible         :=false;
                      formRealCortado.spinTamReal1.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam1.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam1').Value;
                      formRealCortado.labRealTam1.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam1').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam2').Value = '' then
                  begin
                      formRealCortado.labTam2.Visible             :=false;
                      formRealCortado.spinTamanho2.Visible        :=false;
                      formRealCortado.labIndividual2.Visible      :=false;
                      formRealCortado.labTotal2.Visible           :=false;
                      formRealCortado.labRealTam2.Visible         :=false;
                      formRealCortado.spinTamReal2.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam2.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam2').Value;
                      formRealCortado.labRealTam2.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam2').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam3').Value = '' then
                  begin
                      formRealCortado.labTam3.Visible             :=false;
                      formRealCortado.spinTamanho3.Visible        :=false;
                      formRealCortado.labIndividual3.Visible      :=false;
                      formRealCortado.labTotal3.Visible           :=false;
                      formRealCortado.labRealTam3.Visible         :=false;
                      formRealCortado.spinTamReal3.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam3.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam3').Value;
                      formRealCortado.labRealTam3.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam3').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam4').Value = '' then
                  begin
                      formRealCortado.labTam4.Visible             :=false;
                      formRealCortado.spinTamanho4.Visible        :=false;
                      formRealCortado.labIndividual4.Visible      :=false;
                      formRealCortado.labTotal4.Visible           :=false;
                      formRealCortado.labRealTam4.Visible         :=false;
                      formRealCortado.spinTamReal4.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam4.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam4').Value;
                      formRealCortado.labRealTam4.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam4').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam5').Value = '' then
                  begin
                      formRealCortado.labTam5.Visible             :=false;
                      formRealCortado.spinTamanho5.Visible        :=false;
                      formRealCortado.labIndividual5.Visible      :=false;
                      formRealCortado.labTotal5.Visible           :=false;
                      formRealCortado.labRealTam5.Visible         :=false;
                      formRealCortado.spinTamReal5.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam5.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam5').Value;
                      formRealCortado.labRealTam5.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam5').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam6').Value = '' then
                  begin
                      formRealCortado.labTam6.Visible             :=false;
                      formRealCortado.spinTamanho6.Visible        :=false;
                      formRealCortado.labIndividual6.Visible      :=false;
                      formRealCortado.labTotal6.Visible           :=false;
                      formRealCortado.labRealTam6.Visible         :=false;
                      formRealCortado.spinTamReal6.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam6.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam6').Value;
                      formRealCortado.labRealTam6.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam6').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam7').Value = '' then
                  begin
                      formRealCortado.labTam7.Visible             :=false;
                      formRealCortado.spinTamanho7.Visible        :=false;
                      formRealCortado.labIndividual7.Visible      :=false;
                      formRealCortado.labTotal7.Visible           :=false;
                      formRealCortado.labRealTam7.Visible         :=false;
                      formRealCortado.spinTamReal7.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam7.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam7').Value;
                      formRealCortado.labRealTam7.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam7').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam8').Value = '' then
                  begin
                      formRealCortado.labTam8.Visible             :=false;
                      formRealCortado.spinTamanho8.Visible        :=false;
                      formRealCortado.labIndividual8.Visible      :=false;
                      formRealCortado.labTotal8.Visible           :=false;
                      formRealCortado.labRealTam8.Visible         :=false;
                      formRealCortado.spinTamReal8.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam8.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam8').Value;
                      formRealCortado.labRealTam8.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam8').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam9').Value = '' then
                  begin
                      formRealCortado.labTam9.Visible             :=false;
                      formRealCortado.spinTamanho9.Visible        :=false;
                      formRealCortado.labIndividual9.Visible      :=false;
                      formRealCortado.labTotal9.Visible           :=false;
                      formRealCortado.labRealTam9.Visible         :=false;
                      formRealCortado.spinTamReal9.Visible        :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam9.Caption       :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam9').Value;
                      formRealCortado.labRealTam9.Caption   :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam9').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam10').Value = '' then
                  begin
                      formRealCortado.labTam10.Visible            :=false;
                      formRealCortado.spinTamanho10.Visible       :=false;
                      formRealCortado.labIndividual10.Visible     :=false;
                      formRealCortado.labTotal10.Visible          :=false;
                      formRealCortado.labRealTam10.Visible        :=false;
                      formRealCortado.spinTamReal10.Visible       :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam10.Caption        :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam10').Value;
                      formRealCortado.labRealTam10.Caption    :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam10').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam11').Value = '' then
                  begin
                      formRealCortado.labTam11.Visible            :=false;
                      formRealCortado.spinTamanho11.Visible       :=false;
                      formRealCortado.labIndividual11.Visible     :=false;
                      formRealCortado.labTotal11.Visible          :=false;
                      formRealCortado.labRealTam11.Visible        :=false;
                      formRealCortado.spinTamReal11.Visible       :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam11.Caption        :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam11').Value;
                      formRealCortado.labRealTam11.Caption    :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam11').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam12').Value = '' then
                  begin
                      formRealCortado.labTam12.Visible            :=false;
                      formRealCortado.spinTamanho12.Visible       :=false;
                      formRealCortado.labIndividual12.Visible     :=false;
                      formRealCortado.labTotal12.Visible          :=false;
                      formRealCortado.labRealTam12.Visible        :=false;
                      formRealCortado.spinTamReal12.Visible       :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam12.Caption        :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam12').Value;
                      formRealCortado.labRealTam12.Caption    :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam12').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam13').Value = '' then
                  begin
                      formRealCortado.labTam13.Visible            :=false;
                      formRealCortado.spinTamanho13.Visible       :=false;
                      formRealCortado.labIndividual13.Visible     :=false;
                      formRealCortado.labTotal13.Visible          :=false;
                      formRealCortado.labRealTam13.Visible        :=false;
                      formRealCortado.spinTamReal13.Visible       :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam13.Caption        :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam13').Value;
                      formRealCortado.labRealTam13.Caption    :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam13').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam14').Value = '' then
                  begin
                      formRealCortado.labTam14.Visible            :=false;
                      formRealCortado.spinTamanho14.Visible       :=false;
                      formRealCortado.labIndividual14.Visible     :=false;
                      formRealCortado.labTotal14.Visible          :=false;
                      formRealCortado.labRealTam14.Visible        :=false;
                      formRealCortado.spinTamReal14.Visible       :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam14.Caption        :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam14').Value;
                      formRealCortado.labRealTam14.Caption    :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam14').Value;
                  end;

                  if dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam15').Value = '' then
                  begin
                      formRealCortado.labTam15.Visible            :=false;
                      formRealCortado.spinTamanho15.Visible       :=false;
                      formRealCortado.labIndividual15.Visible     :=false;
                      formRealCortado.labTotal15.Visible          :=false;
                      formRealCortado.labRealTam15.Visible        :=false;
                      formRealCortado.spinTamReal15.Visible       :=false;
                  end
                  else
                  begin
                      formRealCortado.labTam15.Caption        :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam15').Value;
                      formRealCortado.labRealTam15.Caption    :=dmRealCortado.qyFichaIdCorte.FieldByName('fti_tam15').Value;
                  end;
              end;
          end;

          with dmRealCortado.qyGridRealCortado do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add('   oci.oci_id,');
              SQL.Add('   CAST(COALESCE(ocis.descricao, '''') ||'' - ''||');
              SQL.Add('   TRIM(CAST(CASE WHEN oci_tipo = ''P'' THEN ''PRINCIPAL'' ELSE ''SECUNDARIO'' END AS character varying(10))) AS character varying(45)) AS situacao,');
              SQL.Add('   CAST(COALESCE(gc_pa.grc_codexterno, '''') ||'' - '' || TRIM(gc_pa.grc_nome, '''') AS character varying(18)) AS grc_nome_pa,');
              SQL.Add('   cp.cp_id, cp.cp_descricao, cm.cm_descricao,');
              SQL.Add('   CAST(COALESCE(gc.grc_codexterno, '''') ||'' - '' || TRIM(gc.grc_nome)AS character varying(18)) AS grc_nome,');
              SQL.Add('   CAST(TRIM(gt.grt_nome) || ''('' || TRIM(gt.grt_sigla) || '')'' AS character varying(18)) AS grt_nome,');
              SQL.Add('   oci_vlrtotal, oci_vlr_sobra,');
              SQL.Add('   oci_qtdade1, oci_qtdade2, oci_qtdade3, oci_qtdade4, oci_qtdade5, oci_qtdade6, oci_qtdade7, oci_qtdade8,');
              SQL.Add('   oci_qtdade9, oci_qtdade10, oci_qtdade11, oci_qtdade12, oci_qtdade13, oci_qtdade14, oci_qtdade15,');
              SQL.Add('   cp.cp_un, oci_tipo, oci_tecido');
              SQL.Add('   FROM ordem_corte_itens_real AS oci');
              SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id');
              SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
              SQL.Add('   JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id');
              SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
              SQL.Add('   LEFT JOIN composicao_material AS cm ON cm.cm_id = cp.cp_idcomposicao');
              SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
              SQL.Add('   WHERE oci.oci_idocorte = :ordemcorte AND oci.oci_situacao_id<>''2''');
              SQL.Add('   ORDER BY CASE WHEN oci_tecido = true THEN 0 ELSE 1  END, oci.oci_idcortecido, oci.oci_tipo ASC');

              ParamByName('ordemcorte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
              Open;
          end;

          formRealCortado.gridRealCortado.Columns[0].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[0].Title.Caption:='N� Real Cortado';
          formRealCortado.gridRealCortado.Columns[1].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[1].Title.Caption:='Situa��o';
          formRealCortado.gridRealCortado.Columns[2].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[2].Title.Caption:='Cor do Produto Acabado';
          formRealCortado.gridRealCortado.Columns[3].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[3].Title.Caption:='C�d Produto';
          formRealCortado.gridRealCortado.Columns[4].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[4].Title.Caption:='Item';
          formRealCortado.gridRealCortado.Columns[5].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[5].Title.Caption:='Composi��o';
          formRealCortado.gridRealCortado.Columns[6].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[6].Title.Caption:='Cor';
          formRealCortado.gridRealCortado.Columns[7].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[7].Title.Caption:='Tamanho\Largura';
          formRealCortado.gridRealCortado.Columns[8].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[8].Title.Caption:='Total';
          formRealCortado.gridRealCortado.Columns[9].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[9].Title.Caption:='Sobra';

          if formRealCortado.labTam1.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[10].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[10].Title.Caption:=formRealCortado.labTam1.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[10].Visible:=false;
          end;

          if formRealCortado.labTam2.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[11].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[11].Title.Caption:=formRealCortado.labTam2.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[11].Visible:=false;
          end;

          if formRealCortado.labTam3.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[12].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[12].Title.Caption:=formRealCortado.labTam3.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[12].Visible:=false;
          end;

          if formRealCortado.labTam4.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[13].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[13].Title.Caption:=formRealCortado.labTam4.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[13].Visible:=false;
          end;

          if formRealCortado.labTam5.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[14].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[14].Title.Caption:=formRealCortado.labTam5.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[14].Visible:=false;
          end;

          if formRealCortado.labTam6.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[15].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[15].Title.Caption:=formRealCortado.labTam6.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[15].Visible:=false;
          end;

          if formRealCortado.labTam7.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[16].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[16].Title.Caption:=formRealCortado.labTam7.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[16].Visible:=false;
          end;

          if formRealCortado.labTam8.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[17].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[17].Title.Caption:=formRealCortado.labTam8.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[17].Visible:=false;
          end;

          if formRealCortado.labTam9.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[18].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[18].Title.Caption:=formRealCortado.labTam9.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[18].Visible:=false;
          end;

          if formRealCortado.labTam10.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[19].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[19].Title.Caption:=formRealCortado.labTam10.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[19].Visible:=false;
          end;

          if formRealCortado.labTam11.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[20].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[20].Title.Caption:=formRealCortado.labTam11.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[20].Visible:=false;
          end;

          if formRealCortado.labTam12.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[21].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[21].Title.Caption:=formRealCortado.labTam12.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[21].Visible:=false;
          end;

          if formRealCortado.labTam13.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[22].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[22].Title.Caption:=formRealCortado.labTam13.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[22].Visible:=false;
          end;

          if formRealCortado.labTam14.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[23].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[23].Title.Caption:=formRealCortado.labTam14.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[23].Visible:=false;
          end;

          if formRealCortado.labTam15.Visible = true then
          begin
              formRealCortado.gridRealCortado.Columns[24].Title.Alignment:=taCenter;
              formRealCortado.gridRealCortado.Columns[24].Title.Caption:=formRealCortado.labTam15.Caption;
          end
          else
          begin
              formRealCortado.gridRealCortado.Columns[24].Visible:=false;
          end;
          formRealCortado.gridRealCortado.Columns[25].Title.Alignment:=taCenter;
          formRealCortado.gridRealCortado.Columns[25].Title.Caption:='Unidade';
          formRealCortado.gridRealCortado.Columns[26].Visible:=false;
          formRealCortado.gridRealCortado.Columns[27].Visible:=false;


          with dmRealCortado.qyGerMediaPecas do
          begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT');
              SQL.Add(' (');
              SQL.Add('     SUM(oci_qtdade1 +');
              SQL.Add('     oci_qtdade2 +');
              SQL.Add('     oci_qtdade3 +');
              SQL.Add('     oci_qtdade4 +');
              SQL.Add('     oci_qtdade5 +');
              SQL.Add('     oci_qtdade6 +');
              SQL.Add('     oci_qtdade7 +');
              SQL.Add('     oci_qtdade8 +');
              SQL.Add('     oci_qtdade9 +');
              SQL.Add('     oci_qtdade10 +');
              SQL.Add('     oci_qtdade11 +');
              SQL.Add('     oci_qtdade12 +');
              SQL.Add('     oci_qtdade13 +');
              SQL.Add('     oci_qtdade14 +');
              SQL.Add('     oci_qtdade15)');
              SQL.Add(' )AS qtd,');
              SQL.Add(' (SUM(oci_vlrtotal) + SUM(oci_vlr_sobra)) AS cons');
              SQL.Add(' FROM ordem_corte_itens_real');
              SQL.Add(' WHERE oci_idocorte=:ordemcorte');
              SQL.Add(' AND oci_tecido=TRUE');
              SQL.Add(' AND oci_tipo=''P''');
              SQL.Add(' AND oci_situacao_id<>''2''');

              ParamByName('ordemcorte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
              Open;

              formRealCortado.labNumTotalGeral.Caption  :=intToStr(dmRealCortado.qyGerMediaPecas.FieldByName('qtd').Value);
              mediaTotal  :=strtofloat(dmRealCortado.qyGerMediaPecas.FieldByName('cons').Value)/strtofloat(dmRealCortado.qyGerMediaPecas.FieldByName('qtd').Value);
              formRealCortado.labNumMediaTotal.Caption:=formatfloat('0.0000',mediaTotal);
          end;

          desabComponentes;
      end;
end;

procedure TformPrincipal.boxEstilista;
begin
    With dmPrincipal.qyBoxEstilista do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT es_id, es_nome');
        SQL.Add('FROM cadastro_estilista');
        SQL.Add('ORDER BY es_nome');
        Open;
    end;
end;
procedure TformPrincipal.boxFornecedor;
begin
    with dmPrincipal.qyBoxFornecedor do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM fornecedor ORDER BY for_apelido');
        Open;
    end;
end;

procedure TformPrincipal.boxGradeTamanho;
begin
    with dmPrincipal.qyGradeTamanho do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT grt_id, grt_nome FROM grade_tamanho ORDER BY grt_id');
        Open;
    end;
end;

procedure TformPrincipal.boxTipoProduto;
begin
    with dmPrincipal.qyTipoProduto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT tp_id, tp_nome FROM tipo_produto ORDER BY tp_id');
        Open;
    end;
end;

procedure TformPrincipal.btnEmpAlmoxarifadoClick(Sender: TObject);
begin
    gridOrdem.Visible             :=false;
    formRecEmpenho                :=TformRecEmpenho.Create(Self);
    formRecEmpenho.Parent         :=Panel1;
    formRecEmpenho.Align          :=alClient;
    formRecEmpenho.BorderStyle    :=bsNone;
    formRecEmpenho.Show;
    desabComponentes;
end;

procedure TformPrincipal.btnObservacoesClick(Sender: TObject);
begin
    btnObservacoes.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrincipal.btnOrdemCorteClick(Sender: TObject);
begin
    btnOrdemCorte.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrincipal.btnProcRestritoClick(Sender: TObject);
begin
    btnProcRestrito.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrincipal.boxColecao;
begin
    With dmPrincipal.qyBoxColecao do
    begin
        Close;
        SQl.Clear;
        SQl.Add('SELECT co_id,');
        SQl.Add('CAST(CONCAT(co_descricao,'' de '', to_char(co_anocolecao, ''YYYY''))as character varying(25))AS nome');
        SQl.Add('FROM colecao');
        SQl.Add('ORDER BY co_anocolecao DESC LIMIT 7');
        Open;
    end;
end;

procedure TformPrincipal.boxComprador;
begin
    with dmPrincipal.qyBoxComprador do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT comp_id, comp_nome FROM cadastro_compradores');
        SQL.Add('   ORDER BY comp_nome');
        Open;
    end;
end;

procedure TformPrincipal.butClearEstiloClick(Sender: TObject);
begin
    dbLkComboEstilo.KeyValue :=Null;
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
        With dmPrincipal.qyOrdemCorte do
        begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT oc.oc_id,');
              SQL.Add('CAST(lpad(cast(oc.oc_ordem AS varchar), 3, ''0'') AS character varying(5))AS NumerodoCorte,');
              SQL.Add('cc.co_descricao, (ocs.os_nome)AS situacao,');
              SQL.Add('(ce.es_nome)AS estilista,');
              SQL.Add('oc.oc_idfichatecnica,');
              SQL.Add('(SELECT op.op_id FROM ordem_producao AS op WHERE op.op_idordemcorte = oc.oc_id AND op.op_idstatus <> ''4'')AS noordproducao,');
              SQL.Add('(SELECT (CASE WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) = 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
              SQL.Add('                  CURRENT_DATE - oc.oc_dtgerada::DATE');
              SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) = 0)) THEN');
              SQL.Add('                  CURRENT_DATE - ocpi.oci_dtlanc::DATE');
              SQL.Add('              WHEN ((oc.oc_situacao = 1) AND (coalesce(ocpi.oci_id, 0) > 0) AND (coalesce(ocri.oci_id,0) > 0)) THEN');
              SQL.Add('                  CURRENT_DATE - ocri.oci_dtlanc::DATE');
              SQL.Add('         ELSE 0 END)');
              SQL.Add('     FROM ordem_corte as oci LEFT JOIN ordem_corte_itens_previsto AS ocpi ON');
              SQL.Add('     ((ocpi.oci_idocorte = oci.oc_id) AND (ocpi.oci_situacao_id NOT IN (2, 4)))');
              SQL.Add('     LEFT JOIN ordem_corte_itens_real AS ocri ON');
              SQL.Add('     ((ocri.oci_idocorte = oci.oc_id) AND (ocpi.oci_situacao_id NOT IN (2, 4)))');
              SQL.Add('     WHERE oci.oc_id=oc.oc_id');
              SQL.Add('     LIMIT 1');
              SQL.Add(') AS diasemprocesso,');
              SQL.Add('CAST(CASE WHEN oc.oc_prototipo = True THEN ''Prototipo'' ELSE ''Grande Escala'' END as character varying(15)) AS tipo,');
              SQL.Add('(pa.cad_idreferencia)as referencia,');
              SQL.Add('(pa.cad_descricao)as produtoacabado,');
              SQL.Add('(oc.oc_dtgerada)as datagerada,');
              SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_previsto WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradeprevisto,');
              SQL.Add('(SELECT oci_dtlanc FROM ordem_corte_itens_real WHERE oci_idocorte=oc.oc_id AND oci_situacao_id <> 2 LIMIT 1) as datagradereal,');
              SQL.Add('  CAST(CASE');
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
              SQL.Add('oc.oc_observacao FROM ordem_corte AS oc JOIN produto_acabado AS pa ON pa.cad_id = oc.oc_idcodprodutoacabado LEFT JOIN colecao AS cc ON');
              SQL.Add('cc.co_id = pa.cad_idcolecao LEFT JOIN cadastro_estilista as ce on pa.cad_idestilista = ce.es_id LEFT JOIN ordem_corte_situacao AS ocs ON');
              SQL.Add('ocs.os_id = oc.oc_situacao WHERE oc.oc_situacao <> ''2''');
              if comboFiltro.Text = 'REFERENCIA' then
              begin
                  SQL.Add('AND pa.cad_idreferencia = :referencia');
                  ParamByName('referencia').AsString:=editSearch.Text;
              end;
              if comboFiltro.Text = 'NUMERO DA FICHA' then
              begin
                  SQL.Add('AND oc.oc_idfichatecnica = :fichatecnica');
                  ParamByName('fichatecnica').AsInteger:=strtointdef(editSearch.Text,0);
              end;
              if comboFiltro.Text = 'ORDEM DE CORTE' then
              begin
                  SQL.Add('AND oc.oc_id = :ordemdecorte');
                  ParamByName('ordemdecorte').AsInteger:=strtointdef(editSearch.Text,0);
              end;
              if comboFiltro.Text = 'DESCRICAO REFERENCIA' then
              begin
                  SQL.Add('AND pa.cad_descricao = :descricao');
                  ParamByName('descricao').AsString:=editSearch.Text;
              end;
              if comboTipo.Text = 'Prototipo' then
                  SQL.Add('AND oc.oc_prototipo = true');
              if comboTipo.Text = 'Grande Escala' then
                  SQL.Add('AND oc.oc_prototipo = false');
              if dbLkComboEstilo.KeyValue <> Null then
              begin
                  SQL.Add('AND ce.es_id = :estilista');
                  ParamByName('estilista').AsInteger:=dbLkComboEstilo.KeyValue;
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
                  ParamByName('colecao').AsInteger:=dbLColecao.KeyValue;
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

procedure TformPrincipal.ComitaTransacao;
begin
     dmOrdemCorte.Conexao.Commit;
end;

procedure TformPrincipal.CortePrevisto1Click(Sender: TObject);
begin
    gridOrdem.Visible           :=false;
    formPrevisto                :=TformPrevisto.Create(Self);
    formPrevisto.Parent         :=Panel1;
    formPrevisto.Align          :=alClient;
    formPrevisto.BorderStyle    :=bsNone;
    formPrevisto.Show;
    desabComponentes;
end;

procedure TformPrincipal.desabComponentes;
begin
    butVerCorte.Enabled             :=false;
    butCortePrevisto.Enabled        :=false;
    butRealCortado.Enabled          :=false;
    butHistoricOrdem.Enabled        :=false;
    comboFiltro.Enabled             :=false;
    comboSituacao.Enabled           :=false;
    editSearch.Enabled              :=false;
    comboIniOrd.Enabled             :=false;
    comboTipo.Enabled               :=false;
    dbLkComboEstilo.Enabled         :=false;
    comboFiltroData.Enabled         :=false;
    comboSetor.Enabled              :=false;
    dateTimePicker1.Enabled         :=false;
    dateTimePicker2.Enabled         :=false;
    butOrdemPesquisar.Enabled       :=false;
    dbLColecao.Enabled              :=false;
    butClearTipo.Enabled            :=false;
    butClearEstilo.Enabled          :=false;
    butClearSetor.Enabled           :=false;
    butClearSituacao.Enabled        :=false;
    butLimpaIniOrdem.Enabled        :=false;
    butClearColecao.Enabled         :=false;
    labMostrAnos.Enabled            :=false;
    btnOrdemCorte.Enabled           :=false;
    btnEmpAlmoxarifado.Enabled      :=false;
    btnEmpFase.Enabled              :=false;
    btnEstoqueFase.Enabled          :=false;
    btnEstAproveitamento.Enabled    :=false;
    btnEntregaPecas.Enabled         :=false;
    btnObservacoes.Enabled          :=false;
    btnProcRestrito.Enabled         :=false;
end;

procedure TformPrincipal.DesfazTransacao;
begin
     dmOrdemCorte.Conexao.Rollback;
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
          dbg.Columns[idx].Width:=(dbg.Width - dbg.Canvas.TextWidth('AAAAAA')
            ) div TSize
      end
      else
        for idx:=0 to dbg.Columns.count - 1 do
          dbg.Columns[idx].Width:=dbg.Columns[idx].Width +
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
    Twidth:=0;
    TSize:=0;
    for idx:=0 to dbg.Columns.count - 1 do
    begin
        NomeColuna:=dbg.Columns[idx].Title.Caption;
        dbg.Columns[idx].Width:=dbg.Canvas.TextWidth
          (dbg.Columns[idx].Title.Caption + 'A');
        AWidth[idx]:=dbg.Columns[idx].Width;
        Twidth:=Twidth + AWidth[idx];

        if Assigned(dbg.Columns[idx].Field) then
          Asize[idx]:=dbg.Columns[idx].Field.Size
        else
          Asize[idx]:=1;

        TSize:=TSize + Asize[idx];
    end;

    if TDBGridOption.dgColLines in dbg.Options then
      Twidth:=Twidth + dbg.Columns.count;

    // adiciona a largura da coluna indicada do cursor
    if TDBGridOption.dgIndicator in dbg.Options then
      Twidth:=Twidth + IndicatorWidth;

    Swidth:=dbg.ClientWidth - Twidth;
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
    BorderStyle             :=bsSingle;
    BorderIcons             :=BorderIcons - [biMaximize];
    WindowState             :=wsNormal;
    Top                     :=0;
    Left                    :=0;
    Height                  :=Screen.Height;
    Width                   :=Screen.Width;
    dateTimePicker1.Date    :=now;
    dateTimePicker2.Date    :=now;
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
    dmPrincipal.qyOrdemCorte.Active:=true;
    gridViewOrdemCorte;
    footerPrincipal.Panels.Items[0].Text :='VERS�O: '+ versaoExe;
    boxColecao;
end;

procedure TformPrincipal.gridOrdemCellClick(Column: TColumn);
begin
    with dmPrincipal.qyVerCorteReal do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ordem_corte_itens_real');
        SQL.Add('WHERE oci_idocorte = :ordem');
        ParamByName('ordem').AsInteger :=strtoint(gridOrdem.Fields[0].Value);
        Open;
        if dmPrincipal.qyVerCorteReal.RecordCount > 0 then
           butRealCortado.Enabled :=true;
    end;

end;

procedure TformPrincipal.gridViewOrdemCorte;
begin
    gridOrdem.Columns[0].Title.Alignment          :=taCenter;
    gridOrdem.Columns[0].Title.Caption            :='N� Corte';
    gridOrdem.Columns[0].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[1].Title.Alignment          :=taCenter;
    gridOrdem.Columns[1].Title.Caption            :='Ordem';
    gridOrdem.Columns[1].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[2].Title.Alignment          :=taCenter;
    gridOrdem.Columns[2].Title.Caption            :='Cole��o';
    gridOrdem.Columns[2].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[3].Title.Alignment          :=taCenter;
    gridOrdem.Columns[3].Title.Caption            :='Situa��o';
    gridOrdem.Columns[3].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[4].Title.Alignment          :=taCenter;
    gridOrdem.Columns[4].Title.Caption            :='Estilista';
    gridOrdem.Columns[4].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[5].Title.Alignment          :=taCenter;
    gridOrdem.Columns[5].Title.Caption            :='Ficha T�cnica';
    gridOrdem.Columns[5].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[6].Title.Alignment          :=taCenter;
    gridOrdem.Columns[6].Title.Caption            :='Ordem de Produ��o';
    gridOrdem.Columns[6].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[7].Title.Alignment          :=taCenter;
    gridOrdem.Columns[7].Title.Caption            :='Dias em Processo';
    gridOrdem.Columns[7].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[8].Title.Alignment          :=taCenter;
    gridOrdem.Columns[8].Title.Caption            :='Tipo';
    gridOrdem.Columns[8].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[9].Title.Alignment          :=taCenter;
    gridOrdem.Columns[9].Title.Caption            :='Refer�ncia';
    gridOrdem.Columns[9].Title.Font.Style         :=[fsBold];
    gridOrdem.Columns[10].Title.Alignment         :=taCenter;
    gridOrdem.Columns[10].Title.Caption           :='Produto Acabado';
    gridOrdem.Columns[10].Title.Font.Style        :=[fsBold];
    gridOrdem.Columns[11].Title.Alignment         :=taCenter;
    gridOrdem.Columns[11].Title.Caption           :='Inicio Ordem de Corte';
    gridOrdem.Columns[11].Title.Font.Style        :=[fsBold];
    gridOrdem.Columns[12].Title.Alignment         :=taCenter;
    gridOrdem.Columns[12].Title.Caption           :='Corte Previsto';
    gridOrdem.Columns[12].Title.Font.Style        :=[fsBold];
    gridOrdem.Columns[13].Title.Alignment         :=taCenter;
    gridOrdem.Columns[13].Title.Caption           :='Real Cortado';
    gridOrdem.Columns[13].Title.Font.Style        :=[fsBold];
    gridOrdem.Columns[14].Title.Alignment         :=taCenter;
    gridOrdem.Columns[14].Title.Caption           :='Localiza��o Empenho';
    gridOrdem.Columns[14].Title.Font.Style        :=[fsBold];
    gridOrdem.Columns[15].Title.Alignment         :=taCenter;
    gridOrdem.Columns[15].Title.Caption           :='Observa��o';
    gridOrdem.Columns[15].Title.Font.Style        :=[fsBold];
    butVerCorte.Font.Color                        :=clMenuHighlight;
    butVerCorte.Font.Style                        :=[fsBold];
    butCortePrevisto.Font.Color                   :=clMenuHighlight;
    butCortePrevisto.Font.Style                   :=[fsBold];
    butHistoricOrdem.Font.Color                   :=clMenuHighlight;
    butHistoricOrdem.Font.Style                   :=[fsBold];
    butRealCortado.Font.Color                     :=clMenuhighlight;
    butRealCortado.Font.Style                     :=[fsBold];
    butRealCortado.Enabled                        :=false;
    comboTipo.Text                                :='';
end;

procedure TformPrincipal.habComponentes;
begin
    butVerCorte.Enabled           :=true;
    butCortePrevisto.Enabled      :=true;
    butHistoricOrdem.Enabled      :=true;
    comboFiltro.Enabled           :=true;
    comboSituacao.Enabled         :=true;
    editSearch.Enabled            :=true;
    comboIniOrd.Enabled           :=true;
    comboTipo.Enabled             :=true;
    dbLkComboEstilo.Enabled       :=true;
    comboFiltroData.Enabled       :=true;
    comboSetor.Enabled            :=true;
    dateTimePicker1.Enabled       :=true;
    dateTimePicker2.Enabled       :=true;
    butOrdemPesquisar.Enabled     :=true;
    dbLColecao.Enabled            :=true;
    butClearTipo.Enabled          :=true;
    butClearEstilo.Enabled        :=true;
    butClearSetor.Enabled         :=true;
    butClearSituacao.Enabled      :=true;
    butLimpaIniOrdem.Enabled      :=true;
    butClearColecao.Enabled       :=true;
    labMostrAnos.Enabled          :=true;
    btnOrdemCorte.Enabled         :=true;
    btnEmpAlmoxarifado.Enabled    :=true;
    btnEmpFase.Enabled            :=true;
    btnEstoqueFase.Enabled        :=true;
    btnEstAproveitamento.Enabled  :=true;
    btnEntregaPecas.Enabled       :=true;
    btnObservacoes.Enabled        :=true;
    btnProcRestrito.Enabled       :=true;
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
   Arquivo  :=Application.ExeName;
   Parquivo :=StrAlloc(Length(Arquivo) + 1);
   StrPcopy(Parquivo, Arquivo);
   Len := GetFileVersionInfoSize(Parquivo, Handle);
   Result   :='';
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
    gridOrdem.Visible             :=false;
    formIniciarCorte              :=TformIniciarCorte.Create(Self);
    formIniciarCorte.Parent       :=Panel1;
    formIniciarCorte.Align        :=alClient;
    formIniciarCorte.BorderStyle  :=bsNone;
    formIniciarCorte.Show;
    desabComponentes;
end;

procedure TformPrincipal.IniciaTransacao;
begin
     dmOrdemCorte.Conexao.StartTransaction;
end;

procedure TformPrincipal.labMostrAnosClick(Sender: TObject);
begin
    With dmPrincipal.qyBoxColecao do
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

procedure TformPrincipal.RealCortado1Click(Sender: TObject);
begin
    gridOrdem.Visible                           :=false;
    formRealCortado                             :=TformRealCortado.Create(Self);
    formRealCortado.Parent                      :=Panel1;
    formRealCortado.Align                       :=alClient;
    formRealCortado.BorderStyle                 :=bsNone;
    formRealCortado.Show;
    formRealCortado.butOrdemCorte.Enabled       :=false;
    formRealCortado.butReceberTecido.Enabled    :=false;
    formRealCortado.butSalvar.Enabled           :=false;
    formRealCortado.butArtigos.Enabled          :=false;
    formRealCortado.butCortado.Enabled          :=false;
    formRealCortado.butAcao.Enabled             :=false;
    formRealCortado.butPrototipo.Enabled        :=false;
    formRealCortado.labPrototipo.Enabled        :=false;
    formRealCortado.butInfoReferencia.Enabled   :=false;
    formRealCortado.butImGradeCor.Enabled       :=false;
    desabComponentes;
end;

end.
