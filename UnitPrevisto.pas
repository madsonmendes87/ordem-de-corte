unit UnitPrevisto;

interface

uses
  System.RegularExpressions, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Samples.Spin, Vcl.Grids,
  Vcl.DBGrids;

type
  TformPrevisto = class(TForm)
    panelCabecalho: TPanel;
    butSairPrevisto: TSpeedButton;
    radioCorte: TRadioGroup;
    labControleCorte: TLabel;
    labNumCorte: TLabel;
    radioProdAcabado: TRadioGroup;
    radioEstadoGuia: TRadioGroup;
    labControleProdAcabado: TLabel;
    labReferencia: TLabel;
    labDescricao: TLabel;
    labCodProdAcabado: TLabel;
    labNumReferencia: TLabel;
    labNomeDescricao: TLabel;
    labSituacao: TLabel;
    labStatuSituacao: TLabel;
    butEditGrade: TSpeedButton;
    butArtigos: TSpeedButton;
    butEmpenho: TSpeedButton;
    butAcao: TSpeedButton;
    popupArtigos: TPopupMenu;
    Trocar: TMenuItem;
    Liberar1: TMenuItem;
    Retirar: TMenuItem;
    popupEmpenho: TPopupMenu;
    Empenhar1: TMenuItem;
    Informao1: TMenuItem;
    Informacao: TMenuItem;
    RetirarEmpenho1: TMenuItem;
    N3: TMenuItem;
    Verartigoscancelados: TMenuItem;
    RetirarEmpenho2: TMenuItem;
    popupAcao: TPopupMenu;
    Finalizar1: TMenuItem;
    N4: TMenuItem;
    Reabrir1: TMenuItem;
    labItem: TLabel;
    labQuantidade: TLabel;
    spinTamanho1: TSpinEdit;
    spinTamanho2: TSpinEdit;
    spinTamanho3: TSpinEdit;
    spinTamanho4: TSpinEdit;
    spinTamanho5: TSpinEdit;
    spinTamanho6: TSpinEdit;
    spinTamanho7: TSpinEdit;
    spinTamanho8: TSpinEdit;
    spinTamanho9: TSpinEdit;
    spinTamanho10: TSpinEdit;
    spinTamanho11: TSpinEdit;
    spinTamanho12: TSpinEdit;
    spinTamanho13: TSpinEdit;
    spinTamanho14: TSpinEdit;
    spinTamanho15: TSpinEdit;
    labTam1: TLabel;
    labTam2: TLabel;
    labTam3: TLabel;
    labTam4: TLabel;
    labTam5: TLabel;
    labTam6: TLabel;
    labTam7: TLabel;
    labTam8: TLabel;
    labTam9: TLabel;
    labTam10: TLabel;
    labTam11: TLabel;
    labTam12: TLabel;
    labTam13: TLabel;
    labTam14: TLabel;
    labTam15: TLabel;
    labConsumo: TLabel;
    labIndividual: TLabel;
    labTotal: TLabel;
    labIndividual1: TLabel;
    labIndividual2: TLabel;
    labIndividual3: TLabel;
    labIndividual4: TLabel;
    labIndividual5: TLabel;
    labIndividual6: TLabel;
    labIndividual7: TLabel;
    labIndividual8: TLabel;
    labIndividual9: TLabel;
    labindividual10: TLabel;
    labIndividual11: TLabel;
    labIndividual12: TLabel;
    labIndividual13: TLabel;
    labIndividual14: TLabel;
    labIndividual15: TLabel;
    labTotal1: TLabel;
    labTotal2: TLabel;
    labTotal3: TLabel;
    labTotal4: TLabel;
    labTotal5: TLabel;
    labTotal6: TLabel;
    labTotal7: TLabel;
    labTotal8: TLabel;
    labTotal9: TLabel;
    labTotal10: TLabel;
    labTotal11: TLabel;
    labTotal12: TLabel;
    labTotal13: TLabel;
    labTotal14: TLabel;
    labTotal15: TLabel;
    panelInfo1: TPanel;
    panelInfo2: TPanel;
    labQtdCortes: TLabel;
    labNumQtdCortes: TLabel;
    labMedia: TLabel;
    labNumMedia: TLabel;
    labConsTotal: TLabel;
    labNumConsTotal: TLabel;
    labPlus: TLabel;
    labConsRestante: TLabel;
    labNumConsRestante: TLabel;
    labNomeTotal: TLabel;
    labIgual: TLabel;
    labNumTotal: TLabel;
    labUnidade: TLabel;
    labNumUnidade: TLabel;
    labTotalGeralPecas: TLabel;
    labNumTotalGeral: TLabel;
    labMediaGeralPecas: TLabel;
    labNumMediaTotal: TLabel;
    butInfoReferencia: TSpeedButton;
    butImGradeCor: TSpeedButton;
    butPrototipo: TSpeedButton;
    labPrototipo: TLabel;
    gridPrevisto: TDBGrid;
    procedure butSairPrevistoClick(Sender: TObject);
    procedure butEditGradeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butArtigosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butEmpenhoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butAcaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butArtigosClick(Sender: TObject);
    procedure butEmpenhoClick(Sender: TObject);
    procedure butAcaoClick(Sender: TObject);
    procedure butInfoReferenciaMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure butImGradeCorMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure gridPrevistoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure butEditGradeClick(Sender: TObject);
    procedure VerartigoscanceladosClick(Sender: TObject);
    procedure RetirarClick(Sender: TObject);
    procedure TrocarClick(Sender: TObject);
    procedure Finalizar1Click(Sender: TObject);
    procedure Reabrir1Click(Sender: TObject);
    procedure butInfoReferenciaClick(Sender: TObject);
    procedure butImGradeCorClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Empenhar1Click(Sender: TObject);

  private
    { Private declarations }
    procedure gridPrevistoClick(Sender: TObject);
    procedure finalizaPrevisto;
  public
    { Public declarations }
    procedure retirArtigo;
  end;

var
  formPrevisto: TformPrevisto;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule, UnitHistoricOrdem,
  UnitOrdemCorteCores, UnitConfirmacaoAvancoProducao, UnitVerificaVersao,
  UnitDMHistoricOrdem, unitArtCancelados, UnitLogin, UnitMudancArtigo,
  unitDMIniciarCorte, unitDMPrevisto, unitInfoReferencias, unitImgGradeCor,
  unitEmpenho;

procedure TformPrevisto.butSairPrevistoClick(Sender: TObject);
begin
    formPrevisto.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible :=true;
end;

procedure TformPrevisto.Empenhar1Click(Sender: TObject);
begin
     application.CreateForm(TformEmpenho, formEmpenho);
     formEmpenho.ShowModal;
end;

procedure TformPrevisto.finalizaPrevisto;
begin

    try

        formPrincipal.IniciaTransacao;

        with dmPrevisto.qyFinalizaPrevisto do
        begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE ordem_corte_itens_previsto SET oci_situacao_id = :situacao, oci_dtfinalizada = :dtfinalizada,');
            SQL.Add('   oci_hrfinalizada = :hrfinalizada, oci_idusufinalizou = :usuario WHERE oci_idocorte = :ordemcorte');

            ParamByName('ordemcorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            ParamByName('situacao').AsInteger             :=4;
            ParamByName('dtfinalizada').AsDateTime        :=now;
            ParambyName('hrfinalizada').AsTime            :=now;
            ParamByName('usuario').AsInteger              :=strtoint(formPrincipal.labCodUsuario.Caption);
            ExecSQL;
        end;

        formPrincipal.ComitaTransacao;
        Application.MessageBox('Previsto finalizado com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION)

    except
          on E: exception do
          begin
              formPrincipal.DesfazTransacao;
              Application.MessageBox(pchar('Erro ao finalizar o previsto!'+E.Message),'Ordem de Corte', MB_ICONERROR);
              exit;
          end;
    end;

end;

procedure TformPrevisto.Finalizar1Click(Sender: TObject);
var
    qtd1, qtd2, qtd3, qtd4, qtd5, qtd6, qtd7, qtd8,
    qtd9, qtd10, qtd11, qtd12, qtd13, qtd14, qtd15 : integer;

    disponivel, totalCons : real;
    mensagem, msg, produto : string;
    processo : boolean;
begin
    with dmPrevisto.qyCorteOrdem do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ordem_corte WHERE oc_id = :corte');

        ParamByName('corte').AsInteger := formPrincipal.gridOrdem.Fields[0].Value;
        Open;
    end;

    if dmPrevisto.qyCorteOrdem.FieldByName('oc_corte_aproveitamento').Value = true then
    begin
        with dmPrevisto.qyCorteItensPrev do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   oci.oci_id,');
            SQL.Add('   cp.cp_id,');
            SQL.Add('   cp.cp_descricao,');
            SQL.Add('   (COALESCE(gc.grc_codexterno, '' '') ||'' - '' || TRIM(gc.grc_nome)) AS grc_nome,');
            SQL.Add('   (COALESCE(gc_pa.grc_codexterno, '' '') ||'' - '' || TRIM(gc_pa.grc_nome)) AS grc_nome_pa,');
            SQL.Add('   (TRIM(gt.grt_nome) || '' ('' || TRIM(gt.grt_sigla) || '')'') AS grt_nome,');
            SQL.Add('   oci.*,');
            SQL.Add('   cp.cp_un,');
            SQL.Add('   ocis.descricao AS situacao,');
            SQL.Add('   COALESCE(cm.cm_descricao, '' '') AS cm_descricao,');
            SQL.Add('   gp.gr_nome,');
            SQL.Add('   sgp.sgr_nome');
            SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
            SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id');
            SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
            SQL.Add('   JOIN grade_tamanho AS gt on oci.oci_idgradetam = gt.grt_id');
            SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
            SQL.Add('   JOIN grupo AS gp ON gp.gr_id = cp.cp_idgrupo');
            SQL.Add('   JOIN subgrupo AS sgp ON sgp.sgr_id = cp.cp_idsubgrupo');
            SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
            SQL.Add('   LEFT JOIN composicao_material AS cm ON cm.cm_id = cp.cp_idcomposicao');
            SQL.Add('   WHERE oci.oci_idocorte= :corte AND oci.oci_situacao_id <> ''2''');

            ParamByName('corte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            Open;
        end;

        dmPrevisto.qyCorteItensPrev.First;
        while not dmPrevisto.qyCorteItensPrev.Eof do
        begin
            mensagem :='Produto(s) n�o usando estoque, utilize o estoque do corte!' +#13+#13+
            'PRODUTO(S): '+ dmPrevisto.qyCorteItensPrev.FieldByName('cp_descricao').Value +#13;

            if dmPrevisto.qyCorteItensPrev.FieldByName('oci_situacao_id').Value = '1' then
            begin
                Application.MessageBox(PChar(mensagem), 'Ordem de Corte',MB_OK + MB_ICONINFORMATION);
                exit;
            end;

            dmPrevisto.qyCorteItensPrev.Next;
        end;
    end
    else
    begin
        with dmPrevisto.qyTemEmpPrevisto do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   ce.*,');
            SQL.Add('   cp.cp_id,');
            SQL.Add('   cp.cp_descricao,');
            SQL.Add('   (''Cod Uso: '' || coalesce(gc.grc_codexterno, '' '') ||''    '' || TRIM(gc.grc_nome) || '' ('' || TRIM(gc.grc_sigla) || '')'') AS grc_nome,');
            SQL.Add('   (TRIM(gt.grt_nome) || '' ('' || TRIM(gt.grt_sigla) || '')'') AS grt_nome');
            SQL.Add('   FROM controle_empenho AS ce');
            SQL.Add('   JOIN estoque AS e ON e.es_id = ce.emp_idestoque');
            SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = e.es_codproduto');
            SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = e.es_idgradecor');
            SQL.Add('   JOIN grade_tamanho AS gt ON gt.grt_id = e.es_idgradetam');
            SQL.Add('   WHERE ce.emp_codprocesso= :ficha');
            SQL.Add('   AND ce.emp_situacao<>''C''');
            SQL.Add('   AND ce.emp_idordemcorte= :corte');

            ParamByName('ficha').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
            ParamByName('corte').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            Open;
        end;

        if dmPrevisto.qyTemEmpPrevisto.RecordCount = 0 then
        begin
            Application.MessageBox('Corte previsto n�o pode ser finalizado, pois n�o h� pedido de empenho!', 'Sem Empenho', MB_OK + MB_ICONINFORMATION);
            exit;
        end;
    end;

    processo :=true;

    if dmPrevisto.qyCorteOrdem.FieldByName('oc_prototipo').Value = false then
    begin
         disponivel     :=0;
         totalCons      :=0;
         qtd1           :=0;
         qtd2           :=0;
         qtd3           :=0;
         qtd4           :=0;
         qtd5           :=0;
         qtd6           :=0;
         qtd7           :=0;
         qtd8           :=0;
         qtd9           :=0;
         qtd10          :=0;
         qtd11          :=0;
         qtd12          :=0;
         qtd13          :=0;
         qtd14          :=0;
         qtd15          :=0;

         with dmPrevisto.qyQuantidadeCorte do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   oci.oci_qtdade1,');
            SQL.Add('   oci.oci_qtdade2,');
            SQL.Add('   oci.oci_qtdade3,');
            SQL.Add('   oci.oci_qtdade4,');
            SQL.Add('   oci.oci_qtdade5,');
            SQL.Add('   oci.oci_qtdade6,');
            SQL.Add('   oci.oci_qtdade7,');
            SQL.Add('   oci.oci_qtdade8,');
            SQL.Add('   oci.oci_qtdade9,');
            SQL.Add('   oci.oci_qtdade10,');
            SQL.Add('   oci.oci_qtdade11,');
            SQL.Add('   oci.oci_qtdade12,');
            SQL.Add('   oci.oci_qtdade13,');
            SQL.Add('   oci.oci_qtdade14,');
            SQL.Add('   oci.oci_qtdade15,');
            SQL.Add('   oci.oci_idgradecorprodutoacabado');
            SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
            SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecorprodutoacabado = gc.grc_id');
            SQL.Add('   WHERE');
            SQL.Add('   oci.oci_situacao_id<>''2''');
            SQL.Add('   AND oci.oci_idocorte= :corte');
            SQL.Add('   AND oci.oci_tipo=''P''');

            ParamByName('corte').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            Open;
         end;


         with dmPrevisto.qyGradePecasCor do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM ficha_tecnica_qtdtamanho');
            SQL.Add('   WHERE');
            SQL.Add('   fti_idfichatec= :ficha');
            SQL.Add('   AND fti_cortecidoidgrade= :corProdAcabadoId');

            ParamByName('ficha').AsInteger              :=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
            ParamByName('corProdAcabadoId').AsInteger   :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_idgradecorprodutoacabado').Value;
            Open;
         end;


         with dmPrevisto.qyItensAviamentoFicha do
         begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   cp.cp_id,');
            SQL.Add('   gc.grc_id,');
            SQL.Add('   gt.grt_id,');
            SQL.Add('   cp.cp_descricao,');
            SQL.Add('   (COALESCE(gc.grc_codexterno, '' '') ||'' - '' || TRIM(gc.grc_nome)) AS grc_nome,');
            SQL.Add('   gt.grt_nome,');
            SQL.Add('   fti.*');
            SQL.Add('   FROM ficha_tecnica_itens AS fti');
            SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = fti.fti_idproduto');
            SQL.Add('   JOIN grade_cor AS gc on gc.grc_id = fti.fti_idgradecor');
            SQL.Add('   JOIN grade_cor AS gc_pa on gc_pa.grc_id = fti.fti_cortecidoidgrade');
            SQL.Add('   JOIN grade_tamanho AS gt on gt.grt_id = fti.fti_idgradetam');
            SQL.Add('   WHERE');
            SQL.Add('   fti.fti_idfichatec= :ficha');
            SQL.Add('   AND fti.fti_status=''N''');
            SQL.Add('   AND fti.fti_tecido=''N''');
            SQL.Add('   AND fti.fti_cortecidoidgrade= :idCorProdAcabado');

            ParamByName('ficha').AsInteger              :=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
            ParamByName('idCorProdAcabado').AsInteger   :=dmPrevisto.qyGradePecasCor.FieldByName('fti_cortecidoidgrade').Value;
            Open;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade1').Value > 0  then
         begin
            qtd1 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade1').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr1').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade1').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade2').Value > 0  then
         begin
            qtd2 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade2').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr2').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade2').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade3').Value > 0  then
         begin
            qtd3 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade3').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr3').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade3').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade4').Value > 0  then
         begin
            qtd4 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade4').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr4').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade4').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade5').Value > 0  then
         begin
            qtd5 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade5').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr5').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade5').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade6').Value > 0  then
         begin
            qtd6 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade6').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr6').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade6').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade7').Value > 0  then
         begin
            qtd7 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade7').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr7').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade7').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade8').Value > 0  then
         begin
            qtd8 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade8').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr8').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade8').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade9').Value > 0  then
         begin
            qtd9 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade9').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr9').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade9').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade10').Value > 0  then
         begin
            qtd10 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade10').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr10').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade10').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade11').Value > 0  then
         begin
            qtd11 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade11').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr11').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade11').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade12').Value > 0  then
         begin
            qtd12 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade12').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr12').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade12').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade13').Value > 0  then
         begin
            qtd13 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade13').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr13').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade13').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade14').Value > 0  then
         begin
            qtd14 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade14').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr14').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade14').Value;
         end;

         if dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade15').Value > 0  then
         begin
            qtd15 :=dmPrevisto.qyQuantidadeCorte.FieldByName('oci_qtdade15').Value *
            dmPrevisto.qyItensAviamentoFicha.FieldByName('fti_vlr15').Value /
            dmPrevisto.qyGradePecasCor.FieldByName('fti_qtdade15').Value;
         end;


         totalCons :=qtd1 + qtd2 + qtd3 + qtd4 + qtd5 + qtd6 + qtd7 + qtd8 + qtd9 + qtd10 + qtd11 + qtd12 + qtd13 + qtd14 + qtd15;

         with dmPrevisto.qyEstoqueSemReserProt do
         begin
              Close;
              SQL.Clear;
              SQL.Add('SELECT DISTINCT');
              SQL.Add('     e.es_id,');
              SQL.Add('     e.es_codloja,');
              SQL.Add('     e.es_codproduto,');
              SQL.Add('     e.es_idgradecor,');
              SQL.Add('     e.es_idgradetam,');
              SQL.Add('     cp.cp_descricao,');
              SQL.Add('     gc.grc_nome,');
              SQL.Add('     gt.grt_nome,');
              SQL.Add('     e.es_metragemrolo,');
              SQL.Add('     COALESCE(e.es_custoatual, 0) AS es_custoatual,');
              SQL.Add('     e.es_numrolo,');
              SQL.Add('             (');
              SQL.Add('                   (');
              SQL.Add('                         COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
              SQL.Add('                         COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
              SQL.Add('                   ) -');
              SQL.Add('                   (');
              SQL.Add('                         COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
              SQL.Add('                   ) -');
              SQL.Add('                   (');
              SQL.Add('                         COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
              SQL.Add('                   )');
              SQL.Add('             )AS disponivel');
              SQL.Add('    FROM estoque AS e');
              SQL.Add('    JOIN cadastro_produto As cp On e.es_codproduto = cp.cp_id');
              SQL.Add('    JOIN grade_cor As gc On gc.grc_id = e.es_idgradecor');
              SQL.Add('    JOIN grade_tamanho As gt On gt.grt_id = e.es_idgradetam');
              SQL.Add('    WHERE gc.grc_id= :idCor');
              SQL.Add('    AND gt.grt_id= :idTamanho');
              SQL.Add('    AND cp.cp_id= :idProduto');
              SQL.Add('    AND');
              SQL.Add('           (');
              SQL.Add('                 (');
              SQL.Add('                         COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
              SQL.Add('                         COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
              SQL.Add('                 ) -');
              SQL.Add('                 (');
              SQL.Add('                         COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
              SQL.Add('                 )');
              SQL.Add('           ) > 0');
              SQL.Add('   ORDER BY disponivel ASC');

              ParamByName('idCor').AsInteger      :=dmPrevisto.qyItensAviamentoFicha.FieldByName('grc_id').Value;
              ParamByName('idTamanho').AsInteger  :=dmPrevisto.qyItensAviamentoFicha.FieldByName('grc_id').Value;
              ParamByName('idProduto').AsInteger  :=dmPrevisto.qyItensAviamentoFicha.FieldByName('cp_id').Value;
              Open;
         end;

         if dmPrevisto.qyEstoqueSemReserProt.RecordCount = 0 then
         begin
             produto := 'PRODUTO VIRTUAL';
             msg     := produto +#13+#13+
                        'PRODUTO: '+dmPrevisto.qyItensAviamentoFicha.FieldByName('cp_descricao').Value +#13+
                        'COR: '+dmPrevisto.qyItensAviamentoFicha.FieldByName('grc_nome').Value +#13+
                        'TAMANHO: '+dmPrevisto.qyItensAviamentoFicha.FieldByName('grt_nome').Value;

             Application.MessageBox(PChar(msg), 'Ordem de Corte',MB_OK + MB_ICONINFORMATION);
             processo :=false;
         end
         else
         begin
            dmPrevisto.qyItensAviamentoFicha.First;
            while not dmIniciarCorte.qyAviamentosPorFicha.Eof do
            begin
                disponivel := disponivel + dmIniciarCorte.qyAviamentosPorFicha.FieldByName('disponivel').Value;
                dmPrevisto.qyItensAviamentoFicha.Next;
            end;

            if totalCons > disponivel then
            begin
                 produto := 'PRODUTO SEM ESTOQUE';
                 msg     := produto +#13+#13+
                          'PRODUTO: '+dmPrevisto.qyItensAviamentoFicha.FieldByName('cp_descricao').Value +#13+
                          'COR: '+dmPrevisto.qyItensAviamentoFicha.FieldByName('grc_nome').Value +#13+
                          'TAMANHO: '+dmPrevisto.qyItensAviamentoFicha.FieldByName('grt_nome').Value;

                 Application.MessageBox(PChar(msg), 'Ordem de Corte',MB_OK + MB_ICONINFORMATION);
                 processo :=false;

            end;

         end;

         if processo = false then
         begin
            with dmPrevisto.qyUsuario do
            begin
                Close;
                SQL.Clear;
                SQL.Add('SELECT us_permiteavanco_ref_semestoque FROM usuario');
                SQL.Add('   WHERE us_id = :idUser');

                ParamByName('idUser').AsInteger :=strtoint(formPrincipal.labCodUsuario.Caption);
                Open;
            end;

            if dmPrevisto.qyUsuario.FieldByName('us_permiteavanco_ref_semestoque').Value = true then
            begin
                with application do
                begin
                    if MessageBox('Clique em SIM se deseja permitir o avan�o da produ��o sem material, caso contr�rio clique em N�O', 'Opcao', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                    finalizaPrevisto;
                    exit;
                end;
            end
            else
            begin
              Application.MessageBox('Por este motivo(s) o corte previsto n�o pode ser finalizado!', 'Previsto', MB_OK + MB_ICONINFORMATION);
              exit;
             end;
         end;
    end;
    finalizaPrevisto;
end;

procedure TformPrevisto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FreeAndNil(formPrevisto);
end;

procedure TformPrevisto.FormCreate(Sender: TObject);
begin
    gridPrevisto.ControlStyle := gridPrevisto.ControlStyle + [csClickEvents];
    TForm(gridPrevisto).OnClick := gridPrevistoClick;

end;

procedure TformPrevisto.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    butEditGrade.Font.Color         :=clWindowText;
    butArtigos.Font.Color           :=clWindowText;
    butEmpenho.Font.Color           :=clWindowText;
    butAcao.Font.Color              :=clWindowText;
    butInfoReferencia.Font.Color    :=clNavy;
    butImGradeCor.Font.Color        :=clWindowText;
end;

procedure TformPrevisto.FormResize(Sender: TObject);
begin
//    formPrincipal.dimensionarGrid(gridPrevisto);
end;

procedure TformPrevisto.FormShow(Sender: TObject);

var
    mediaTotal : double;

begin
    labNumCorte.Caption := intToStr(formPrincipal.gridOrdem.Fields[0].Value) +'-00'+ intToStr(formPrincipal.gridOrdem.Fields[1].Value);
    labNumReferencia.Caption := formPrincipal.gridOrdem.Fields[9].Value;
    labNomeDescricao.Caption := formPrincipal.gridOrdem.Fields[10].Value;
    with dmPrevisto.qyOrdemPrototipo do
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
        if formPrincipal.gridOrdem.Fields[8].Value = 'Grande Escala' then
        begin
            if dmPrevisto.qyOrdemPrototipo.RecordCount > 0 then
            begin
                butPrototipo.Visible := true;
                labPrototipo.Visible := true;
                labPrototipo.Caption := 'Prot�tipo: '+intToStr(dmPrevisto.qyOrdemPrototipo.FieldByName('oc_id').Value)+'-00'+
                intToStr(dmPrevisto.qyOrdemPrototipo.FieldByName('oc_ordem').Value);
            end;
            if dmPrevisto.qyOrdemPrototipo.RecordCount = 0 then
            begin
                butPrototipo.Visible := false;
                labPrototipo.Visible := false;
            end;
        end;
        if formPrincipal.gridOrdem.Fields[8].Value = 'Prototipo' then
        begin
            butPrototipo.Visible := false;
            labPrototipo.Visible := false;
        end;
    end;

    with dmPrevisto.qyCodProdAcabadoFicha do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT pa.cad_id FROM produto_acabado AS pa JOIN ficha_tecnica AS ft');
        SQL.Add(' ON ft.fi_idprodutoacabado = pa.cad_id WHERE ft.fi_id = :fichatecnica');

        ParamByName('fichatecnica').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[5].Value);
        Open;

        labCodProdAcabado.Caption := intToStr(dmPrevisto.qyCodProdAcabadoFicha.FieldByName('cad_id').Value);
    end;

    with dmPrevisto.qyStatusPrevisto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT oci_situacao_id, descricao FROM ordem_corte_itens_previsto, ordem_corte_itens_situacao');
        SQL.Add(' WHERE oci_idocorte = :idcorte AND oci_situacao_id = id;');

        ParamByName('idcorte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;

        if dmPrevisto.qyStatusPrevisto.FieldByName('oci_situacao_id').Value = 1 then
        begin
            labStatuSituacao.Caption := dmPrevisto.qyStatusPrevisto.FieldByName('descricao').Value;
            labStatuSituacao.Font.Color := clRed;
        end;

        if dmPrevisto.qyStatusPrevisto.FieldByName('oci_situacao_id').Value = 3 then
        begin
            labStatuSituacao.Caption := 'SOB EMPENHO';
            labStatuSituacao.Font.Color := clOlive;
        end;

        if dmPrevisto.qyStatusPrevisto.FieldByName('oci_situacao_id').Value = 4 then
        begin
            labStatuSituacao.Caption := dmPrevisto.qyStatusPrevisto.FieldByName('descricao').Value;
            labStatuSituacao.Font.Color := clNavy;
        end;
    end;

    if labStatuSituacao.Caption = 'NORMAL' then
    begin
        popupEmpenho.Items.Find('Retirar Empenho').Enabled:=false;
        popupEmpenho.Items.Find('Informa��o').Enabled:=false;
        popupAcao.Items.Find('Reabrir').Enabled:=false;
    end;

    if labStatuSituacao.Caption = 'SOB EMPENHO' then
    begin
        butEditGrade.Enabled:=false;
        popupArtigos.Items.Find('Trocar(somente na ordem de corte)').Enabled:=false;
        popupArtigos.Items.Find('Retirar').Enabled:=false;
        popupEmpenho.Items.Find('Empenhar').Enabled:=false;
        popupAcao.Items.Find('Reabrir').Enabled:=false;
    end;

    if labStatuSituacao.Caption = 'FINALIZADO' then
    begin
        butEditGrade.Enabled:=false;
        popupArtigos.Items.Find('Trocar(somente na ordem de corte)').Enabled:=false;
        popupArtigos.Items.Find('Retirar').Enabled:=false;
        popupEmpenho.Items.Find('Empenhar').Enabled:=false;
        popupEmpenho.Items.Find('Retirar Empenho').Enabled:=false;
        popupAcao.Items.Find('Finalizar').Enabled:=false;
    end;

    if formPrincipal.gridOrdem.Fields[8].Value = 'Prototipo' then
        panelCabecalho.Caption :='Corte Previsto - Prot�tipo'
    else
        panelCabecalho.Caption :='Corte Previsto - Grande Escala';

    with dmPrevisto.qyFichaIdCorte do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_itens');
        SQL.Add(' WHERE fti_idfichatec = :ficha');

        ParamByName('ficha').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
        Open;

        if dmPrevisto.qyFichaIdCorte.RecordCount > 0 then
        begin
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam1').Value = '' then
            begin
                labTam1.Visible:=false;
                spinTamanho1.Visible:=false;
                labIndividual1.Visible:=false;
                labTotal1.Visible:=false;
            end
            else
            begin
                labTam1.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam1').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam2').Value = '' then
            begin
                labTam2.Visible:=false;
                spinTamanho2.Visible:=false;
                labIndividual2.Visible:=false;
                labTotal2.Visible:=false;
            end
            else
            begin
                labTam2.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam2').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam3').Value = '' then
            begin
                labTam3.Visible:=false;
                spinTamanho3.Visible:=false;
                labIndividual3.Visible:=false;
                labTotal3.Visible:=false;
            end
            else
            begin
                labTam3.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam3').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam4').Value = '' then
            begin
                labTam4.Visible:=false;
                spinTamanho4.Visible:=false;
                labIndividual4.Visible:=false;
                labTotal4.Visible:=false;
            end
            else
            begin
                labTam4.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam4').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam5').Value = '' then
            begin
                labTam5.Visible:=false;
                spinTamanho5.Visible:=false;
                labIndividual5.Visible:=false;
                labTotal5.Visible:=false;
            end
            else
            begin
                labTam5.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam5').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam6').Value = '' then
            begin
                labTam6.Visible:=false;
                spinTamanho6.Visible:=false;
                labIndividual6.Visible:=false;
                labTotal6.Visible:=false;
            end
            else
            begin
                labTam6.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam6').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam7').Value = '' then
            begin
                labTam7.Visible:=false;
                spinTamanho7.Visible:=false;
                labIndividual7.Visible:=false;
                labTotal7.Visible:=false;
            end
            else
            begin
                labTam7.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam7').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam8').Value = '' then
            begin
                labTam8.Visible:=false;
                spinTamanho8.Visible:=false;
                labIndividual8.Visible:=false;
                labTotal8.Visible:=false;
            end
            else
            begin
                labTam8.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam8').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam9').Value = '' then
            begin
                labTam9.Visible:=false;
                spinTamanho9.Visible:=false;
                labIndividual9.Visible:=false;
                labTotal9.Visible:=false;
            end
            else
            begin
                labTam9.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam9').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam10').Value = '' then
            begin
                labTam10.Visible:=false;
                spinTamanho10.Visible:=false;
                labIndividual10.Visible:=false;
                labTotal10.Visible:=false;
            end
            else
            begin
                labTam10.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam10').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam11').Value = '' then
            begin
                labTam11.Visible:=false;
                spinTamanho11.Visible:=false;
                labIndividual11.Visible:=false;
                labTotal11.Visible:=false;
            end
            else
            begin
                labTam11.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam11').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam12').Value = '' then
            begin
                labTam12.Visible:=false;
                spinTamanho12.Visible:=false;
                labIndividual12.Visible:=false;
                labTotal12.Visible:=false;
            end
            else
            begin
                labTam12.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam12').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam13').Value = '' then
            begin
                labTam13.Visible:=false;
                spinTamanho13.Visible:=false;
                labIndividual13.Visible:=false;
                labTotal13.Visible:=false;
            end
            else
            begin
                labTam13.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam13').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam14').Value = '' then
            begin
                labTam14.Visible:=false;
                spinTamanho14.Visible:=false;
                labIndividual14.Visible:=false;
                labTotal14.Visible:=false;
            end
            else
            begin
                labTam14.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam14').Value;
            end;
            if dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam15').Value = '' then
            begin
                labTam15.Visible:=false;
                spinTamanho15.Visible:=false;
                labIndividual15.Visible:=false;
                labTotal15.Visible:=false;
            end
            else
            begin
                labTam15.Caption:=dmPrevisto.qyFichaIdCorte.FieldByName('fti_tam15').Value;
            end;
        end;
    end;

    with dmPrevisto.qyGridPrevisto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   oci.oci_id,');
        SQL.Add('   CAST(COALESCE(ocis.descricao, '''') ||'' - ''||');
        SQL.Add('   TRIM(CAST(CASE WHEN oci_tipo = ''P'' THEN ''PRINCIPAL'' ELSE ''SECUNDARIO'' END AS character varying(10))) AS character varying(45)) AS situacao,');
        SQL.Add('   CAST(COALESCE(gc_pa.grc_codexterno, '''') ||'' - '' || TRIM(gc_pa.grc_nome, '' '') AS character varying(18)) AS grc_nome_pa,');
        SQL.Add('   cp.cp_id,');
        SQL.Add('   cp.cp_descricao,');
        SQL.Add('   CAST(COALESCE(gc.grc_codexterno, '' '') ||'' - '' || TRIM(gc.grc_nome)AS character varying(18)) AS grc_nome,');
        SQL.Add('   CAST(TRIM(gt.grt_nome) || '' ('' || TRIM(gt.grt_sigla) || '')'' AS character varying(18)) AS grt_nome,');
        SQL.Add('   oci_vlrtotal,');
        SQL.Add('   oci_qtdade1, oci_qtdade2, oci_qtdade3, oci_qtdade4, oci_qtdade5, oci_qtdade6, oci_qtdade7, oci_qtdade8,');
        SQL.Add('   oci_qtdade9, oci_qtdade10, oci_qtdade11, oci_qtdade12, oci_qtdade13, oci_qtdade14, oci_qtdade15,');
        SQL.Add('   cp.cp_un, oci_tipo, oci_tecido');
        SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
        SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id');
        SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
        SQL.Add('   JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
        SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
        SQL.Add('   WHERE oci.oci_idocorte = :ordemcorte AND oci.oci_situacao_id<>''2''');
        SQL.Add('   ORDER BY CASE WHEN oci_tecido = true THEN 0 ELSE 1  END, oci.oci_idcortecido, oci.oci_tipo ASC');

        ParamByName('ordemcorte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
    end;

    gridPrevisto.Columns[0].Title.Alignment:=taCenter;
    gridPrevisto.Columns[0].Title.Caption:='N� Previsto';
    gridPrevisto.Columns[1].Title.Alignment:=taCenter;
    gridPrevisto.Columns[1].Title.Caption:='Situa��o';
    gridPrevisto.Columns[2].Title.Alignment:=taCenter;
    gridPrevisto.Columns[2].Title.Caption:='Cor do Produto Acabado';
    gridPrevisto.Columns[3].Title.Alignment:=taCenter;
    gridPrevisto.Columns[3].Title.Caption:='C�d Produto';
    gridPrevisto.Columns[4].Title.Alignment:=taCenter;
    gridPrevisto.Columns[4].Title.Caption:='Item';
    gridPrevisto.Columns[5].Title.Alignment:=taCenter;
    gridPrevisto.Columns[5].Title.Caption:='Cor';
    gridPrevisto.Columns[6].Title.Alignment:=taCenter;
    gridPrevisto.Columns[6].Title.Caption:='Tamanho\Largura';
    gridPrevisto.Columns[7].Title.Alignment:=taCenter;
    gridPrevisto.Columns[7].Title.Caption:='Total';

    if labTam1.Visible = true then
    begin
        gridPrevisto.Columns[8].Title.Alignment:=taCenter;
        gridPrevisto.Columns[8].Title.Caption:=labTam1.Caption;
    end
    else
    begin
        gridPrevisto.Columns[8].Visible:=false;
    end;

    if labTam2.Visible = true then
    begin
        gridPrevisto.Columns[9].Title.Alignment:=taCenter;
        gridPrevisto.Columns[9].Title.Caption:=labTam2.Caption;
    end
    else
    begin
        gridPrevisto.Columns[9].Visible:=false;
    end;

    if labTam3.Visible = true then
    begin
        gridPrevisto.Columns[10].Title.Alignment:=taCenter;
        gridPrevisto.Columns[10].Title.Caption:=labTam3.Caption;
    end
    else
    begin
        gridPrevisto.Columns[10].Visible:=false;
    end;

    if labTam4.Visible = true then
    begin
        gridPrevisto.Columns[11].Title.Alignment:=taCenter;
        gridPrevisto.Columns[11].Title.Caption:=labTam4.Caption;
    end
    else
    begin
        gridPrevisto.Columns[11].Visible:=false;
    end;

    if labTam5.Visible = true then
    begin
        gridPrevisto.Columns[12].Title.Alignment:=taCenter;
        gridPrevisto.Columns[12].Title.Caption:=labTam5.Caption;
    end
    else
    begin
        gridPrevisto.Columns[12].Visible:=false;
    end;

    if labTam6.Visible = true then
    begin
        gridPrevisto.Columns[13].Title.Alignment:=taCenter;
        gridPrevisto.Columns[13].Title.Caption:=labTam6.Caption;
    end
    else
    begin
        gridPrevisto.Columns[13].Visible:=false;
    end;

    if labTam7.Visible = true then
    begin
        gridPrevisto.Columns[14].Title.Alignment:=taCenter;
        gridPrevisto.Columns[14].Title.Caption:=labTam7.Caption;
    end
    else
    begin
        gridPrevisto.Columns[14].Visible:=false;
    end;

    if labTam8.Visible = true then
    begin
        gridPrevisto.Columns[15].Title.Alignment:=taCenter;
        gridPrevisto.Columns[15].Title.Caption:=labTam8.Caption;
    end
    else
    begin
        gridPrevisto.Columns[15].Visible:=false;
    end;

    if labTam9.Visible = true then
    begin
        gridPrevisto.Columns[16].Title.Alignment:=taCenter;
        gridPrevisto.Columns[16].Title.Caption:=labTam9.Caption;
    end
    else
    begin
        gridPrevisto.Columns[16].Visible:=false;
    end;

    if labTam10.Visible = true then
    begin
        gridPrevisto.Columns[17].Title.Alignment:=taCenter;
        gridPrevisto.Columns[17].Title.Caption:=labTam10.Caption;
    end
    else
    begin
        gridPrevisto.Columns[17].Visible:=false;
    end;

    if labTam11.Visible = true then
    begin
        gridPrevisto.Columns[18].Title.Alignment:=taCenter;
        gridPrevisto.Columns[18].Title.Caption:=labTam11.Caption;
    end
    else
    begin
        gridPrevisto.Columns[18].Visible:=false;
    end;

    if labTam12.Visible = true then
    begin
        gridPrevisto.Columns[19].Title.Alignment:=taCenter;
        gridPrevisto.Columns[19].Title.Caption:=labTam12.Caption;
    end
    else
    begin
        gridPrevisto.Columns[19].Visible:=false;
    end;

    if labTam13.Visible = true then
    begin
        gridPrevisto.Columns[20].Title.Alignment:=taCenter;
        gridPrevisto.Columns[20].Title.Caption:=labTam13.Caption;
    end
    else
    begin
        gridPrevisto.Columns[20].Visible:=false;
    end;

    if labTam14.Visible = true then
    begin
        gridPrevisto.Columns[21].Title.Alignment:=taCenter;
        gridPrevisto.Columns[21].Title.Caption:=labTam14.Caption;
    end
    else
    begin
        gridPrevisto.Columns[21].Visible:=false;
    end;

    if labTam15.Visible = true then
    begin
        gridPrevisto.Columns[22].Title.Alignment:=taCenter;
        gridPrevisto.Columns[22].Title.Caption:=labTam15.Caption;
    end
    else
    begin
        gridPrevisto.Columns[22].Visible:=false;
    end;
    gridPrevisto.Columns[23].Title.Alignment:=taCenter;
    gridPrevisto.Columns[23].Title.Caption:='Unidade';
    gridPrevisto.Columns[24].Visible:=false;
    gridPrevisto.Columns[25].Visible:=false;

    with dmPrevisto.qyGerMediaPecas do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add(' (');
        SQL.Add('   SUM(oci_qtdade1 +');
        SQL.Add('   oci_qtdade2 +');
        SQL.Add('   oci_qtdade3 +');
        SQL.Add('   oci_qtdade4 +');
        SQL.Add('   oci_qtdade5 +');
        SQL.Add('   oci_qtdade6 +');
        SQL.Add('   oci_qtdade7 +');
        SQL.Add('   oci_qtdade8 +');
        SQL.Add('   oci_qtdade9 +');
        SQL.Add('   oci_qtdade10 +');
        SQL.Add('   oci_qtdade11 +');
        SQL.Add('   oci_qtdade12 +');
        SQL.Add('   oci_qtdade13 +');
        SQL.Add('   oci_qtdade14 +');
        SQL.Add('   oci_qtdade15)');
        SQL.Add(' )AS qtd,');
        SQL.Add(' (SUM(oci_vlrtotal) + SUM(oci_vlrrestante)) AS cons');
        SQL.Add(' FROM ordem_corte_itens_previsto');
        SQL.Add(' WHERE oci_idocorte=:ordemcorte');
        SQL.Add(' AND oci_tecido=TRUE');
        SQL.Add(' AND oci_tipo=''P''');
        SQL.Add(' AND oci_situacao_id<>''2''');

        ParamByName('ordemcorte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;

        labNumTotalGeral.Caption:=intToStr(dmPrevisto.qyGerMediaPecas.FieldByName('qtd').Value);
        mediaTotal:=strtofloat(dmPrevisto.qyGerMediaPecas.FieldByName('cons').Value)/strtofloat(dmPrevisto.qyGerMediaPecas.FieldByName('qtd').Value);
        labNumMediaTotal.Caption:=formatfloat('0.0000',mediaTotal);
    end;
end;

procedure TformPrevisto.gridPrevistoClick(Sender: TObject);

var
    valor : double;
begin
    labItem.Caption:=gridPrevisto.Fields[4].Value+'  Cor: '+gridPrevisto.Fields[5].Value+'  Tamanho: '+gridPrevisto.Fields[6].Value;
    with dmPrevisto.qyPrevistoOciId do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ordem_corte_itens_previsto');
        SQL.Add(' WHERE oci_id = :idPrevisto');

        ParamByName('idPrevisto').AsInteger:=strtoint(gridPrevisto.Fields[0].Value);
        Open;

        if labIndividual1.Visible = true then
        begin
            labIndividual1.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr1').AsFloat);
            spinTamanho1.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade1').Value;
            labTotal1.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade1').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr1').Value));
        end;

        if labIndividual2.Visible = true then
        begin
            labIndividual2.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr2').AsFloat);
            spinTamanho2.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade2').Value;
            labTotal2.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade2').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr2').Value));
        end;

        if labIndividual3.Visible = true then
        begin
            labIndividual3.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr3').AsFloat);
            spinTamanho3.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade3').Value;
            labTotal3.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade3').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr3').Value));
        end;

        if labIndividual4.Visible = true then
        begin
            labIndividual4.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr4').AsFloat);
            spinTamanho4.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade4').Value;
            labTotal4.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade4').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr4').Value));
        end;

        if labIndividual5.Visible = true then
        begin
            labIndividual5.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr5').AsFloat);
            spinTamanho5.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade5').Value;
            labTotal5.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade5').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr5').Value));
        end;

        if labIndividual6.Visible = true then
        begin
            labIndividual6.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr6').AsFloat);
            spinTamanho6.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade6').Value;
            labTotal6.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade6').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr6').Value));
        end;

        if labIndividual7.Visible = true then
        begin
            labIndividual7.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr7').AsFloat);
            spinTamanho7.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade7').Value;
            labTotal7.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade7').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr7').Value));
        end;

        if labIndividual8.Visible = true then
        begin
            labIndividual8.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr8').AsFloat);
            spinTamanho8.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade8').Value;
            labTotal8.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade8').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr8').Value));
        end;

        if labIndividual9.Visible = true then
        begin
            labIndividual9.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr9').AsFloat);
            spinTamanho9.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade9').Value;
            labTotal9.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade9').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr9').Value));
        end;

        if labIndividual10.Visible = true then
        begin
            labIndividual10.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr10').AsFloat);
            spinTamanho10.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade10').Value;
            labTotal10.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade10').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr10').Value));
        end;

        if labIndividual11.Visible = true then
        begin
            labIndividual11.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr11').AsFloat);
            spinTamanho11.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade11').Value;
            labTotal11.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade11').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr11').Value));
        end;

        if labIndividual12.Visible = true then
        begin
            labIndividual12.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr12').AsFloat);
            spinTamanho12.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade12').Value;
            labTotal12.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade12').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr12').Value));
        end;

        if labIndividual13.Visible = true then
        begin
            labIndividual13.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr13').AsFloat);
            spinTamanho13.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade13').Value;
            labTotal13.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade13').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr13').Value));
        end;

        if labIndividual14.Visible = true then
        begin
            labIndividual14.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr14').AsFloat);
            spinTamanho14.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade14').Value;
            labTotal14.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade14').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr14').Value));
        end;

        if labIndividual15.Visible = true then
        begin
            labIndividual15.Caption := formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr15').AsFloat);
            spinTamanho15.Text := dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade15').Value;
            labTotal15.Caption:=formatfloat('0.0000',(dmPrevisto.qyPrevistoOciId.FieldByName('oci_qtdade15').Value * dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlr15').Value));
        end;

        labNumConsTotal.Caption:=formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlrtotal').AsFloat);
        labNumConsRestante.Caption:=formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlrrestante').AsFloat);
        labNumTotal.Caption:=formatfloat('0.0000',dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlrtotal').AsFloat + dmPrevisto.qyPrevistoOciId.FieldByName('oci_vlrrestante').AsFloat);
        labNumUnidade.Caption:=gridPrevisto.Fields[23].Value;
    end;

    with dmPrevisto.qyPrevistoQtdCortes do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT SUM(oci_qtdade1 + oci_qtdade2 + oci_qtdade3 + oci_qtdade4 + oci_qtdade5 + oci_qtdade6 +');
        SQL.Add(' oci_qtdade7 + oci_qtdade8 + oci_qtdade9 + oci_qtdade10 + oci_qtdade11 + oci_qtdade12');
        SQL.Add(' + oci_qtdade13 + oci_qtdade14 + oci_qtdade15)');
        SQL.Add('  AS qtd_cortes FROM ordem_corte_itens_previsto WHERE oci_id = :idPrevisto');

        ParamByName('idPrevisto').AsInteger:=strtoint(gridPrevisto.Fields[0].Value);
        Open;

        labNumQtdCortes.Caption:=dmPrevisto.qyPrevistoQtdCortes.FieldByName('qtd_cortes').Value;
        valor:=strtofloat(labNumTotal.Caption)/strtofloat(dmPrevisto.qyPrevistoQtdCortes.FieldByName('qtd_cortes').Value);
        labNumMedia.Caption:=formatfloat('0.0000',valor);
    end;
end;

procedure TformPrevisto.gridPrevistoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if dmPrevisto.qyGridPrevisto.FieldByName('oci_tipo').Value = 'P' then
      gridPrevisto.Canvas.Font.Color := clBlue
    else
      if dmPrevisto.qyGridPrevisto.FieldByName('oci_tecido').Value = true then
         gridPrevisto.Canvas.Font.Color := clGreen;

    gridPrevisto.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TformPrevisto.Reabrir1Click(Sender: TObject);
begin
    with dmPrevisto.qyUsuario do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT us_reabre_corte_previsto FROM usuario');
        SQL.Add('   WHERE us_id = :idUser');

        ParamByName('idUser').AsInteger :=strtoint(formPrincipal.labCodUsuario.Caption);
        Open;
    end;

    if dmPrevisto.qyUsuario.FieldByName('us_reabre_corte_previsto').Value = true then
    begin
        with dmPrevisto.qyIniciadoRealCortado do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM ordem_corte_itens_real AS oci');
            SQL.Add('   WHERE oci.oci_idocorte= :corte');

            ParamByName('corte').AsInteger  :=formPrincipal.gridOrdem.Fields[0].Value;
            Open;
        end;

        if dmPrevisto.qyIniciadoRealCortado.RecordCount > 0 then
        begin
            Application.MessageBox('Corte Previsto n�o pode ser re-aberto, pois h� um real cortado iniciado!', 'Reabrir Previsto', MB_OK + MB_ICONINFORMATION);
            exit;
        end
        else
        begin

            try

                formPrincipal.IniciaTransacao;

                with dmPrevisto.qyReabrirPrevisto do
                begin
                    Close;
                    SQL.Clear;
                    SQL.Add('UPDATE ordem_corte_itens_previsto SET oci_situacao_id = :situacao, oci_dtfinalizada = :dtfinalizada,');
                    SQL.Add('   oci_hrfinalizada = null, oci_idusufinalizou = null WHERE oci_idocorte = :ordemcorte');

                    ParamByName('ordemcorte').AsInteger         :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
                    ParamByName('situacao').AsInteger           :=3;
                    ParamByName('dtfinalizada').DataType           :=ftDate;
                    ExecSQL;
                end;


                formPrincipal.ComitaTransacao;
                Application.MessageBox('Corte previsto re-aberto com sucesso!', 'Reabrir Previsto', MB_OK + MB_ICONINFORMATION)

            except
                  on E: exception do
                  begin
                      formPrincipal.DesfazTransacao;
                      Application.MessageBox(pchar('Erro ao reabrir o previsto! '+E.Message),'Reabrir Previsto', MB_ICONERROR);
                      exit;
                  end;
            end;
        end;
    end
    else
    begin
        Application.MessageBox('Voc� n�o tem permiss�o de re-abrir Corte Previsto!','Reabrir Previsto', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

end;

procedure TformPrevisto.retirArtigo;
begin
     if formPrincipal.gridOrdem.Fields[14].Value<>'N�O EMPENHADO' then
     begin
          Application.MessageBox('Primeiramente retire o empenho!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
          exit;
     end
     else
        with application do
        begin
             if MessageBox('Deseja realmente retirar este artigo?', 'Ordem de Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
              begin
                  Try

                      formPrincipal.IniciaTransacao;

                      with dmPrevisto.qyRetirArtigo do
                      begin
                          Close;
                          SQL.Clear;
                          SQL.Add('UPDATE ordem_corte_itens_previsto SET oci_dtcancelamento = :dtcancelamento, oci_situacao_id = ''2'', oci_idusuariocanc = :usuario');
                          SQL.Add('   WHERE oci_id = :idPrevisto');

                          ParamByName('idPrevisto').AsInteger         :=strtoint(gridPrevisto.Fields[0].Value);
                          ParamByName('dtcancelamento').AsDateTime    :=now;
                          ParamByName('usuario').AsInteger            :=strtoint(formPrincipal.labCodUsuario.Caption);
                          ExecSQL;
                      end;

                      formPrincipal.ComitaTransacao;
                      dmPrevisto.qyGridPrevisto.Refresh;
                      Application.MessageBox('Item cancelado com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);

                  except
                      on E: exception do
                      begin
                           formPrincipal.DesfazTransacao;
                           Application.MessageBox(pchar('Erro ao retirar artigo.'+E.Message),'Ordem de Corte', MB_ICONERROR);
                           exit;
                      end;
                  end;
              end
             else
                  exit;
        end;
end;

procedure TformPrevisto.TrocarClick(Sender: TObject);
begin
     application.CreateForm(TforMudancArtigo, forMudancArtigo);
     forMudancArtigo.ShowModal;
end;

procedure TformPrevisto.RetirarClick(Sender: TObject);

begin
    with dmPrevisto.qyUsuario do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM usuario WHERE us_id = :id');

        ParamByName('id').AsInteger :=strtoint(formPrincipal.labCodUsuario.Caption);
        Open;
    end;

    if dmPrevisto.qyUsuario.FieldByName('us_idsetor').Value = '1' then
    begin
        retirArtigo;
    end
    else
    begin
        application.CreateForm(TformLogin, formLogin);
        formLogin.ShowModal;
    end;
end;

procedure TformPrevisto.VerartigoscanceladosClick(Sender: TObject);
begin
    application.CreateForm(TformArtCancelados, formArtCancelados);
    formArtCancelados.ShowModal;
end;

procedure TformPrevisto.butAcaoClick(Sender: TObject);
begin
    butAcao.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrevisto.butAcaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butAcao.Font.Color:=clPurple;
end;

procedure TformPrevisto.butArtigosClick(Sender: TObject);
begin
    butArtigos.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrevisto.butArtigosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butArtigos.Font.Color:=clRed;
end;

procedure TformPrevisto.butEditGradeClick(Sender: TObject);
var
  mensagem, tamanho : string;
  qtdade1, qtdade2, qtdade3, qtdade4, qtdade5, qtdade6, qtdade7, qtdade8,
  qtdade9, qtdade10, qtdade11, qtdade12, qtdade13, qtdade14, qtdade15: integer;
begin
    qtdade1       :=spinTamanho1.Value;
    qtdade2       :=spinTamanho2.Value;
    qtdade3       :=spinTamanho3.Value;
    qtdade4       :=spinTamanho4.Value;
    qtdade5       :=spinTamanho5.Value;
    qtdade6       :=spinTamanho6.Value;
    qtdade7       :=spinTamanho7.Value;
    qtdade8       :=spinTamanho8.Value;
    qtdade9       :=spinTamanho9.Value;
    qtdade10      :=spinTamanho10.Value;
    qtdade11      :=spinTamanho11.Value;
    qtdade12      :=spinTamanho12.Value;
    qtdade13      :=spinTamanho13.Value;
    qtdade14      :=spinTamanho14.Value;
    qtdade15      :=spinTamanho15.Value;

    Try

        formPrincipal.IniciaTransacao;

        with dmPrevisto.qyEditGradeCor do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   oci.oci_id,');
            SQL.Add('   oci.oci_idgradecorprodutoacabado');
            SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
            SQL.Add('   WHERE oci.oci_id = :idprevisto AND oci.oci_situacao_id = ''1''');

            ParamByName('idprevisto').AsInteger := strtoint(gridPrevisto.Fields[0].Value);
            Open;
        end;


        with dmPrevisto.qyConsTamFicha do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM ordem_corte AS oc');
            SQL.Add('   JOIN ficha_tecnica_itens AS fti ON fti.fti_idfichatec=oc.oc_idfichatecnica');
            SQL.Add('   JOIN ordem_corte_itens_previsto AS oci ON oci.oci_idocorte = oc.oc_id');
            SQL.Add('   WHERE');
            SQL.Add('   fti.fti_idfichatec=:ficha AND fti.fti_status=''N'' AND oc.oc_id =:corte');
            SQL.Add('   LIMIT 1');

            ParamByName('ficha').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
            ParamByName('corte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            Open;
        end;
              {VERIFICA SE HA CONSUMO NOS TAMANHOS ADICIONADOS}
              if qtdade1 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr1').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam1').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end

              end;

              if qtdade2 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr2').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam2').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade3 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr3').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam3').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade4 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr4').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam4').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade5 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr5').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam5').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit
                  end;
              end;

              if qtdade6 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr6').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam6').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit
                  end;
              end;

              if qtdade7 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr7').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam7').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade8 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr8').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam8').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade9 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr9').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam9').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade10 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr10').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam10').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade11 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr11').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam11').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade12 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr12').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam12').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade13 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr13').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam13').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade14 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr14').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam14').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;

              if qtdade15 > 0 then
              begin
                  if dmPrevisto.qyConsTamFicha.FieldByName('fti_vlr15').Value = 0 then
                  begin
                       tamanho:=dmPrevisto.qyConsTamFicha.FieldByName('oci_tam15').Value;
                       Application.Messagebox(PChar('N�o existe consumo de tecido informado para o tamanho '+ tamanho +' na ficha tecnica'), 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);
                       exit;
                  end;
              end;



        with dmPrevisto.qyEditGradePrevisto do
        begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE ordem_corte_itens_previsto SET oci_qtdade1 =:qtdade1, oci_qtdade2 =:qtdade2, oci_qtdade3 =:qtdade3,');
            SQL.Add(' oci_qtdade4 =:qtdade4, oci_qtdade5 =:qtdade5, oci_qtdade6 =:qtdade6, oci_qtdade7 =:qtdade7, oci_qtdade8 =:qtdade8,');
            SQL.Add(' oci_qtdade9 =:qtdade9, oci_qtdade10 =:qtdade10, oci_qtdade11 =:qtdade11, oci_qtdade12 =:qtdade12, oci_qtdade13 =:qtdade13,');
            SQL.Add(' oci_qtdade14 =:qtdade14, oci_qtdade15 =:qtdade15, oci_idusualterou =:usuario, oci_dtultalteracao =:dtalteracao');
            SQL.Add('WHERE oci_idocorte = :corte AND oci_idgradecorprodutoacabado = :corprod');

            ParamByName('corte').AsInteger                :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            ParamByName('corprod').AsInteger              :=dmPrevisto.qyEditGradeCor.FieldByName('oci_idgradecorprodutoacabado').Value;
            ParamByName('qtdade1').AsInteger              :=spinTamanho1.Value;
            ParamByName('qtdade2').AsInteger              :=spinTamanho2.Value;
            ParamByName('qtdade3').AsInteger              :=spinTamanho3.Value;
            ParamByName('qtdade4').AsInteger              :=spinTamanho4.Value;
            ParamByName('qtdade5').AsInteger              :=spinTamanho5.Value;
            ParamByName('qtdade6').AsInteger              :=spinTamanho6.Value;
            ParamByName('qtdade7').AsInteger              :=spinTamanho7.Value;
            ParamByName('qtdade8').AsInteger              :=spinTamanho8.Value;
            ParamByName('qtdade9').AsInteger              :=spinTamanho9.Value;
            ParamByName('qtdade10').AsInteger             :=spinTamanho10.Value;
            ParamByName('qtdade11').AsInteger             :=spinTamanho11.Value;
            ParamByName('qtdade12').AsInteger             :=spinTamanho12.Value;
            ParamByName('qtdade13').AsInteger             :=spinTamanho13.Value;
            ParamByName('qtdade14').AsInteger             :=spinTamanho14.Value;
            ParamByName('qtdade15').AsInteger             :=spinTamanho15.Value;
            ParamByName('usuario').AsInteger              :=strtoint(formPrincipal.labCodUsuario.Caption);
            ParamByName('dtalteracao').AsDateTime         :=now;
            ExecSQL;

        end;


        formPrincipal.ComitaTransacao;
        Application.MessageBox('Grade atualizada com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);



    except
          on E: exception do
          begin
               formPrincipal.DesfazTransacao;
               Application.MessageBox(pchar('Erro ao editar grade do previsto.'+E.Message),'Ordem de Corte', MB_ICONERROR);
               Exit;
          end;
    end;
end;

procedure TformPrevisto.butEditGradeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butEditGrade.Font.Color:=clGreen;
end;

procedure TformPrevisto.butEmpenhoClick(Sender: TObject);
begin
    butEmpenho.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrevisto.butEmpenhoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butEmpenho.Font.Color:=clNavy;
end;

procedure TformPrevisto.butImGradeCorClick(Sender: TObject);
begin
    application.CreateForm(TformImgGradeCor, formImgGradeCor);
    formImgGradeCor.ShowModal;
end;

procedure TformPrevisto.butImGradeCorMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butImGradeCor.Font.Color:=clDkGray;
end;

procedure TformPrevisto.butInfoReferenciaClick(Sender: TObject);
begin
    application.CreateForm(TformInfoReferencia, formInfoReferencia);
    formInfoReferencia.ShowModal;
end;

procedure TformPrevisto.butInfoReferenciaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butInfoReferencia.Font.Color:=clBlue;
end;

end.
