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
    rocar1: TMenuItem;
    Liberar1: TMenuItem;
    Retirar1: TMenuItem;
    N1: TMenuItem;
    Verartigoscancelados1: TMenuItem;
    popupEmpenho: TPopupMenu;
    Empenhar1: TMenuItem;
    Informao1: TMenuItem;
    N2: TMenuItem;
    RetirarEmpenho1: TMenuItem;
    N3: TMenuItem;
    Verartigoscancelados2: TMenuItem;
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
    procedure gridPrevistoCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure gridPrevistoClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  formPrevisto: TformPrevisto;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule, UnitHistoricOrdem,
  UnitOrdemCorteCores, UnitConfirmacaoAvancoProducao, UnitVerificaVersao,
  UnitDMHistoricOrdem;

procedure TformPrevisto.butSairPrevistoClick(Sender: TObject);
begin
    formPrevisto.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible := true;
end;

procedure TformPrevisto.FormCreate(Sender: TObject);
begin
    gridPrevisto.ControlStyle := gridPrevisto.ControlStyle + [csClickEvents];
    TForm(gridPrevisto).OnClick := gridPrevistoClick;

end;

procedure TformPrevisto.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    butEditGrade.Font.Color:=clWindowText;
    butArtigos.Font.Color:=clWindowText;
    butEmpenho.Font.Color:=clWindowText;
    butAcao.Font.Color:=clWindowText;
    butInfoReferencia.Font.Color:=clNavy;
    butImGradeCor.Font.Color:=clWindowText;
end;

procedure TformPrevisto.FormResize(Sender: TObject);
begin
    //formPrincipal.dimensionarGrid(gridPrevisto);
end;

procedure TformPrevisto.FormShow(Sender: TObject);
begin
    labNumCorte.Caption := intToStr(formPrincipal.gridOrdem.Fields[0].Value) +'-00'+ intToStr(formPrincipal.gridOrdem.Fields[1].Value);
    labNumReferencia.Caption := formPrincipal.gridOrdem.Fields[9].Value;
    labNomeDescricao.Caption := formPrincipal.gridOrdem.Fields[10].Value;
    with dmOrdemCorte.qyOrdemPrototipo do
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
            if dmOrdemCorte.qyOrdemPrototipo.RecordCount > 0 then
            begin
                butPrototipo.Visible := true;
                labPrototipo.Visible := true;
                labPrototipo.Caption := 'Prot�tipo: '+intToStr(dmOrdemCorte.qyOrdemPrototipo.FieldByName('oc_id').Value)+'-00'+
                intToStr(dmOrdemCorte.qyOrdemPrototipo.FieldByName('oc_ordem').Value);
            end;
            if dmOrdemCorte.qyOrdemPrototipo.RecordCount = 0 then
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

    with dmOrdemCorte.qyCodProdAcabadoFicha do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT pa.cad_id FROM produto_acabado AS pa JOIN ficha_tecnica AS ft');
        SQL.Add(' ON ft.fi_idprodutoacabado = pa.cad_id WHERE ft.fi_id = :fichatecnica');
        ParamByName('fichatecnica').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[5].Value);
        Open;
        labCodProdAcabado.Caption := intToStr(dmOrdemCorte.qyCodProdAcabadoFicha.FieldByName('cad_id').Value);
    end;
    with dmOrdemCorte.qyStatusPrevisto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT oci_situacao_id, descricao FROM ordem_corte_itens_previsto, ordem_corte_itens_situacao');
        SQL.Add(' WHERE oci_idocorte = :idcorte AND oci_situacao_id = id;');
        ParamByName('idcorte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
        if dmOrdemCorte.qyStatusPrevisto.FieldByName('oci_situacao_id').Value = 1 then
        begin
            labStatuSituacao.Caption := dmOrdemCorte.qyStatusPrevisto.FieldByName('descricao').Value;
            labStatuSituacao.Font.Color := clRed;
        end;
        if dmOrdemCorte.qyStatusPrevisto.FieldByName('oci_situacao_id').Value = 3 then
        begin
            labStatuSituacao.Caption := 'SOB EMPENHO';
            labStatuSituacao.Font.Color := clOlive;
        end;
        if dmOrdemCorte.qyStatusPrevisto.FieldByName('oci_situacao_id').Value = 4 then
        begin
            labStatuSituacao.Caption := dmOrdemCorte.qyStatusPrevisto.FieldByName('descricao').Value;
            labStatuSituacao.Font.Color := clNavy;
        end;
    end;
    if formPrincipal.gridOrdem.Fields[8].Value = 'Prototipo' then
       panelCabecalho.Caption := 'Corte Previsto - Prot�tipo'
    else
        panelCabecalho.Caption := 'Corte Previsto - Grande Escala';

    with dmOrdemCorte.qyFichaIdCorte do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ficha_tecnica_itens');
        SQL.Add(' WHERE fti_idfichatec = :ficha');
        ParamByName('ficha').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
        Open;
        if dmOrdemCorte.qyFichaIdCorte.RecordCount > 0 then
        begin
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam1').Value = '' then
            begin
                labTam1.Visible:=false;
                spinTamanho1.Visible:=false;
                labIndividual1.Visible:=false;
                labTotal1.Visible:=false;
            end
            else
            begin
                labTam1.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam1').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam2').Value = '' then
            begin
                labTam2.Visible:=false;
                spinTamanho2.Visible:=false;
                labIndividual2.Visible:=false;
                labTotal2.Visible:=false;
            end
            else
            begin
                labTam2.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam2').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam3').Value = '' then
            begin
                labTam3.Visible:=false;
                spinTamanho3.Visible:=false;
                labIndividual3.Visible:=false;
                labTotal3.Visible:=false;
            end
            else
            begin
                labTam3.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam3').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam4').Value = '' then
            begin
                labTam4.Visible:=false;
                spinTamanho4.Visible:=false;
                labIndividual4.Visible:=false;
                labTotal4.Visible:=false;
            end
            else
            begin
                labTam4.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam4').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam5').Value = '' then
            begin
                labTam5.Visible:=false;
                spinTamanho5.Visible:=false;
                labIndividual5.Visible:=false;
                labTotal5.Visible:=false;
            end
            else
            begin
                labTam5.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam5').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam6').Value = '' then
            begin
                labTam6.Visible:=false;
                spinTamanho6.Visible:=false;
                labIndividual6.Visible:=false;
                labTotal6.Visible:=false;
            end
            else
            begin
                labTam6.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam6').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam7').Value = '' then
            begin
                labTam7.Visible:=false;
                spinTamanho7.Visible:=false;
                labIndividual7.Visible:=false;
                labTotal7.Visible:=false;
            end
            else
            begin
                labTam7.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam7').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam8').Value = '' then
            begin
                labTam8.Visible:=false;
                spinTamanho8.Visible:=false;
                labIndividual8.Visible:=false;
                labTotal8.Visible:=false;
            end
            else
            begin
                labTam8.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam8').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam9').Value = '' then
            begin
                labTam9.Visible:=false;
                spinTamanho9.Visible:=false;
                labIndividual9.Visible:=false;
                labTotal9.Visible:=false;
            end
            else
            begin
                labTam9.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam9').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam10').Value = '' then
            begin
                labTam10.Visible:=false;
                spinTamanho10.Visible:=false;
                labIndividual10.Visible:=false;
                labTotal10.Visible:=false;
            end
            else
            begin
                labTam10.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam10').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam11').Value = '' then
            begin
                labTam11.Visible:=false;
                spinTamanho11.Visible:=false;
                labIndividual11.Visible:=false;
                labTotal11.Visible:=false;
            end
            else
            begin
                labTam11.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam11').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam12').Value = '' then
            begin
                labTam12.Visible:=false;
                spinTamanho12.Visible:=false;
                labIndividual12.Visible:=false;
                labTotal12.Visible:=false;
            end
            else
            begin
                labTam12.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam12').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam13').Value = '' then
            begin
                labTam13.Visible:=false;
                spinTamanho13.Visible:=false;
                labIndividual13.Visible:=false;
                labTotal13.Visible:=false;
            end
            else
            begin
                labTam13.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam13').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam14').Value = '' then
            begin
                labTam14.Visible:=false;
                spinTamanho14.Visible:=false;
                labIndividual14.Visible:=false;
                labTotal14.Visible:=false;
            end
            else
            begin
                labTam14.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam14').Value;
            end;
            if dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam15').Value = '' then
            begin
                labTam15.Visible:=false;
                spinTamanho15.Visible:=false;
                labIndividual15.Visible:=false;
                labTotal15.Visible:=false;
            end
            else
            begin
                labTam15.Caption:=dmOrdemCorte.qyFichaIdCorte.FieldByName('fti_tam15').Value;
            end;
        end;
    end;

    with dmOrdemCorte.qyGridPrevisto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   oci.oci_id,');
        SQL.Add('   ocis.descricao AS situacao,');
        SQL.Add('   CAST(COALESCE(gc_pa.grc_codexterno, '' '') ||'' - '' || TRIM(gc_pa.grc_nome, '' '') ||'' - '' ||');
        SQL.Add('   TRIM(CAST(CASE WHEN oci_tipo = ''P'' THEN ''PRINCIPAL'' ELSE ''SECUNDARIO'' END AS character varying(10))) AS character varying(45)) AS grc_nome_pa,');
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
end;

procedure TformPrevisto.gridPrevistoCellClick(Column: TColumn);
begin
      //labIndividual1.Caption := gridPrevisto.Fields[2].Value;
end;

procedure TformPrevisto.gridPrevistoClick(Sender: TObject);

var
    numTotal : real;
    numQtdCortes : integer;
begin
    labItem.Caption:=gridPrevisto.Fields[4].Value+'  Cor:'+gridPrevisto.Fields[5].Value+'  Tamanho:'+gridPrevisto.Fields[6].Value;
    with dmOrdemCorte.qyPrevistoOciId do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM ordem_corte_itens_previsto');
        SQL.Add(' WHERE oci_id = :idPrevisto');
        ParamByName('idPrevisto').AsInteger:=strtoint(gridPrevisto.Fields[0].Value);
        Open;
        if labIndividual1.Visible = true then
        begin
            labIndividual1.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr1').AsFloat);
            spinTamanho1.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade1').Value;
            labTotal1.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade1').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr1').Value));
        end;
        if labIndividual2.Visible = true then
        begin
            labIndividual2.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr2').AsFloat);
            spinTamanho2.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade2').Value;
            labTotal2.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade2').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr2').Value));
        end;
        if labIndividual3.Visible = true then
        begin
            labIndividual3.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr3').AsFloat);
            spinTamanho3.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade3').Value;
            labTotal3.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade3').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr3').Value));
        end;
        if labIndividual4.Visible = true then
        begin
            labIndividual4.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr4').AsFloat);
            spinTamanho4.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade4').Value;
            labTotal4.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade4').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr4').Value));
        end;
        if labIndividual5.Visible = true then
        begin
            labIndividual5.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr5').AsFloat);
            spinTamanho5.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade5').Value;
            labTotal5.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade5').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr5').Value));
        end;
        if labIndividual6.Visible = true then
        begin
            labIndividual6.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr6').AsFloat);
            spinTamanho6.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade6').Value;
            labTotal6.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade6').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr6').Value));
        end;
        if labIndividual7.Visible = true then
        begin
            labIndividual7.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr7').AsFloat);
            spinTamanho7.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade7').Value;
            labTotal7.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade7').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr7').Value));
        end;
        if labIndividual8.Visible = true then
        begin
            labIndividual8.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr8').AsFloat);
            spinTamanho8.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade8').Value;
            labTotal8.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade8').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr8').Value));
        end;
        if labIndividual9.Visible = true then
        begin
            labIndividual9.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr9').AsFloat);
            spinTamanho9.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade9').Value;
            labTotal9.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade9').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr9').Value));
        end;
        if labIndividual10.Visible = true then
        begin
            labIndividual10.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr10').AsFloat);
            spinTamanho10.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade10').Value;
            labTotal10.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade10').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr10').Value));
        end;
        if labIndividual11.Visible = true then
        begin
            labIndividual11.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr11').AsFloat);
            spinTamanho11.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade11').Value;
            labTotal11.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade11').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr11').Value));
        end;
        if labIndividual12.Visible = true then
        begin
            labIndividual12.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr12').AsFloat);
            spinTamanho12.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade12').Value;
            labTotal12.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade12').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr12').Value));
        end;
        if labIndividual13.Visible = true then
        begin
            labIndividual13.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr13').AsFloat);
            spinTamanho13.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade13').Value;
            labTotal13.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade13').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr13').Value));
        end;
        if labIndividual14.Visible = true then
        begin
            labIndividual14.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr14').AsFloat);
            spinTamanho14.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade14').Value;
            labTotal14.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade14').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr14').Value));
        end;
        if labIndividual15.Visible = true then
        begin
            labIndividual15.Caption := formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr15').AsFloat);
            spinTamanho15.Text := dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade15').Value;
            labTotal15.Caption:=formatfloat('0.0000',(dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_qtdade15').Value * dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlr15').Value));
        end;
        labNumConsTotal.Caption:=formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlrtotal').AsFloat);
        labNumConsRestante.Caption:=formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlrrestante').AsFloat);
        labNumTotal.Caption:=formatfloat('0.0000',dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlrtotal').AsFloat + dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlrrestante').AsFloat);
        //numTotal:=strtofloat(labNumTotal.Caption);
        numTotal:=dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlrtotal').Value + dmOrdemCorte.qyPrevistoOciId.FieldByName('oci_vlrrestante').Value;
        //numQtdCortes:=dmOrdemCorte.qyPrevistoQtdCortes.FieldByName('qtd_cortes').Value;
        labNumMedia.Caption:=formatfloat('0.0000',numTotal/numQtdCortes);
    end;

    with dmOrdemCorte.qyPrevistoQtdCortes do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT SUM(oci_qtdade1 + oci_qtdade2 + oci_qtdade3 + oci_qtdade4 + oci_qtdade5 + oci_qtdade6 +');
        SQL.Add(' oci_qtdade7 + oci_qtdade8 + oci_qtdade9 + oci_qtdade10 + oci_qtdade11 + oci_qtdade12');
        SQL.Add(' + oci_qtdade13 + oci_qtdade14 + oci_qtdade15)');
        SQL.Add('  AS qtd_cortes FROM ordem_corte_itens_previsto WHERE oci_id = :idPrevisto');
        ParamByName('idPrevisto').AsInteger:=strtoint(gridPrevisto.Fields[0].Value);
        Open;
        labNumQtdCortes.Caption:=dmOrdemCorte.qyPrevistoQtdCortes.FieldByName('qtd_cortes').Value;
        numQtdCortes:=dmOrdemCorte.qyPrevistoQtdCortes.FieldByName('qtd_cortes').Value;
    end;
end;

procedure TformPrevisto.gridPrevistoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if dmOrdemCorte.qyGridPrevisto.FieldByName('oci_tipo').Value = 'P' then
      gridPrevisto.Canvas.Font.Color := clBlue
    else
      if dmOrdemCorte.qyGridPrevisto.FieldByName('oci_tecido').Value = true then
         gridPrevisto.Canvas.Font.Color := clGreen;
    gridPrevisto.DefaultDrawColumnCell(Rect, DataCol, Column, State);
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

procedure TformPrevisto.butImGradeCorMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butImGradeCor.Font.Color:=clDkGray;
end;

procedure TformPrevisto.butInfoReferenciaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butInfoReferencia.Font.Color:=clBlue;
end;

end.
