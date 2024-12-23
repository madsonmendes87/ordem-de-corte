unit unitRealCortado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.ExtCtrls, Vcl.Buttons,
  System.Actions, Vcl.ActnList;

type
  TformRealCortado = class(TForm)
    butSairRealCortado: TSpeedButton;
    labControleCorte: TLabel;
    labNumCorte: TLabel;
    labControleProdAcabado: TLabel;
    labReferencia: TLabel;
    labDescricao: TLabel;
    labCodProdAcabado: TLabel;
    labNumReferencia: TLabel;
    labNomeDescricao: TLabel;
    labSituacao: TLabel;
    labStatuSituacao: TLabel;
    butSalvar: TSpeedButton;
    butArtigos: TSpeedButton;
    butCortado: TSpeedButton;
    butAcao: TSpeedButton;
    labItem: TLabel;
    labQuantidade: TLabel;
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
    labPrevisto: TLabel;
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
    butInfoReferencia: TSpeedButton;
    butImGradeCor: TSpeedButton;
    butPrototipo: TSpeedButton;
    labPrototipo: TLabel;
    panelCabecalho: TPanel;
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
    panelInfo1: TPanel;
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
    panelInfo2: TPanel;
    labTotalGeralPecas: TLabel;
    labNumTotalGeral: TLabel;
    labMediaGeralPecas: TLabel;
    labNumMediaTotal: TLabel;
    popupArtigos: TPopupMenu;
    adicionarPrimario: TMenuItem;
    Liberar1: TMenuItem;
    adicionarSecundario: TMenuItem;
    N3: TMenuItem;
    retirarArtigo: TMenuItem;
    popupCortado: TPopupMenu;
    consumoCortado: TMenuItem;
    Informao1: TMenuItem;
    retirarCortado: TMenuItem;
    popupAcao: TPopupMenu;
    sobras: TMenuItem;
    N4: TMenuItem;
    empenho: TMenuItem;
    divisoria: TPanel;
    labRealCortado: TLabel;
    labRealTam1: TLabel;
    labQuantReal: TLabel;
    spinTamReal1: TSpinEdit;
    labRealTam2: TLabel;
    spinTamReal2: TSpinEdit;
    labRealTam3: TLabel;
    spinTamReal3: TSpinEdit;
    labRealTam4: TLabel;
    spinTamReal4: TSpinEdit;
    labRealTam5: TLabel;
    spinTamReal5: TSpinEdit;
    labRealTam6: TLabel;
    spinTamReal6: TSpinEdit;
    labRealTam7: TLabel;
    spinTamReal7: TSpinEdit;
    labRealTam8: TLabel;
    spinTamReal8: TSpinEdit;
    labRealTam9: TLabel;
    spinTamReal9: TSpinEdit;
    labRealTam10: TLabel;
    spinTamReal10: TSpinEdit;
    labRealTam11: TLabel;
    spinTamReal11: TSpinEdit;
    labRealTam12: TLabel;
    spinTamReal12: TSpinEdit;
    labRealTam13: TLabel;
    spinTamReal13: TSpinEdit;
    labRealTam14: TLabel;
    spinTamReal14: TSpinEdit;
    labRealTam15: TLabel;
    spinTamReal15: TSpinEdit;
    labNomeCorte: TLabel;
    labNomeProdAcabado: TLabel;
    labNomEstadoGuia: TLabel;
    gridRealCortado: TDBGrid;
    butNovo: TSpeedButton;
    butOrdemCorte: TSpeedButton;
    butReceberTecido: TSpeedButton;
    N1: TMenuItem;
    verArtigosCancelados: TMenuItem;
    estoqueCorte: TMenuItem;
    N2: TMenuItem;
    devolverAlmoxarifado: TMenuItem;
    informacoes: TMenuItem;
    N5: TMenuItem;
    empenhar: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    finalizar: TMenuItem;
    N8: TMenuItem;
    reabrirGuia: TMenuItem;
    actionReal: TActionList;
    acaoNovoRealCortado: TAction;
    acaoOrdemCorte: TAction;
    acaoSalvarRealCortado: TAction;
    acaoReceberTecido: TAction;
    acaoFinalizarRealCortado: TAction;
    acaoReabriRealCortado: TAction;
    acaoRetirarCortado: TAction;
    acaoConsumoCortado: TAction;
    procedure FormShow(Sender: TObject);
    procedure butSairRealCortadoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure gridRealCortadoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure butArtigosClick(Sender: TObject);
    procedure butCortadoClick(Sender: TObject);
    procedure butAcaoClick(Sender: TObject);
    procedure butNovoClick(Sender: TObject);
    procedure butOrdemCorteClick(Sender: TObject);
    procedure acaoNovoRealCortadoExecute(Sender: TObject);
    procedure acaoOrdemCorteExecute(Sender: TObject);
    procedure acaoSalvarRealCortadoExecute(Sender: TObject);
    procedure butSalvarClick(Sender: TObject);
    procedure acaoReceberTecidoExecute(Sender: TObject);
    procedure butReceberTecidoClick(Sender: TObject);
    procedure consumoCortadoClick(Sender: TObject);
    procedure retirarCortadoClick(Sender: TObject);
    procedure finalizarClick(Sender: TObject);
    procedure reabrirGuiaClick(Sender: TObject);
    procedure acaoFinalizarRealCortadoExecute(Sender: TObject);
    procedure acaoReabriRealCortadoExecute(Sender: TObject);
    procedure acaoConsumoCortadoExecute(Sender: TObject);
    procedure acaoRetirarCortadoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure gridRealCortadoClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  formRealCortado: TformRealCortado;

implementation

{$R *.dfm}

uses unitDMPrincipal, UnitPrincipal, unitDMRealCortado, unitDMPrevisto,
  unitRefRealCortado;

procedure TformRealCortado.acaoConsumoCortadoExecute(Sender: TObject);
begin
    if popupCortado.Items.Find('Consumo Cortado').Enabled = true then
    begin
        ShowMessage('Cliquei no consumo cortado!');
    end;
end;

procedure TformRealCortado.acaoFinalizarRealCortadoExecute(
  Sender: TObject);
begin
    if popupAcao.Items.Find('Finalizar').Enabled = true then
    begin
        ShowMessage('Cliquei no FINALIZAR');
    end;
end;

procedure TformRealCortado.acaoNovoRealCortadoExecute(Sender: TObject);
begin
    if butNovo.Enabled = true then
    begin
        butNovo.Enabled           :=false;
        butOrdemCorte.Enabled     :=true;
        butReceberTecido.Enabled  :=true;
        butSalvar.Enabled         :=true;
    end;
end;

procedure TformRealCortado.acaoOrdemCorteExecute(Sender: TObject);
begin
    if butOrdemCorte.Enabled = true then
    begin
        application.CreateForm(TformRefRealCortado, formRefRealCortado);
        formRefRealCortado.ShowModal;
    end;
end;

procedure TformRealCortado.acaoReabriRealCortadoExecute(Sender: TObject);
begin
    if popupAcao.Items.Find('Reabrir').Enabled = true then
    begin
        ShowMessage('Cliquei no REABRIR');
    end;
end;

procedure TformRealCortado.acaoReceberTecidoExecute(Sender: TObject);
begin
    if butReceberTecido.Enabled = true then
    begin
        ShowMessage('Estou recebendo o tecido!');
    end;
end;

procedure TformRealCortado.acaoRetirarCortadoExecute(Sender: TObject);
begin
    if popupCortado.Items.Find('Retirar Cortado').Enabled = true then
    begin
        ShowMessage('Cliquei no retirar cortado!');
    end;
end;

procedure TformRealCortado.acaoSalvarRealCortadoExecute(Sender: TObject);
begin
    if butSalvar.Enabled = true then
    begin
        ShowMessage('Cliquei no botao salvar');
    end;
end;

procedure TformRealCortado.butAcaoClick(Sender: TObject);
begin
    butAcao.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformRealCortado.butArtigosClick(Sender: TObject);
begin
    butArtigos.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformRealCortado.butCortadoClick(Sender: TObject);
begin
    butCortado.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformRealCortado.butNovoClick(Sender: TObject);
begin
    acaoNovoRealCortadoExecute(Sender);
end;

procedure TformRealCortado.butOrdemCorteClick(Sender: TObject);
begin
    acaoOrdemCorteExecute(Sender);
end;

procedure TformRealCortado.butReceberTecidoClick(Sender: TObject);
begin
    acaoReceberTecidoExecute(Sender);
end;

procedure TformRealCortado.butSairRealCortadoClick(Sender: TObject);
begin
    formRealCortado.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible :=true;
end;

procedure TformRealCortado.butSalvarClick(Sender: TObject);
begin
    acaoSalvarRealCortadoExecute(Sender);
end;

procedure TformRealCortado.consumoCortadoClick(Sender: TObject);
begin
//    ShowMessage('Cliquei no consumo cortado!');
    acaoConsumoCortadoExecute(Sender);
end;

procedure TformRealCortado.finalizarClick(Sender: TObject);
begin
//    ShowMessage('Cliquei no FINALIZAR');
    acaoFinalizarRealCortadoExecute(Sender);
end;

procedure TformRealCortado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FreeAndNil(formRealCortado);
    dmRealCortado.qyGridRealCortado.Active  :=false;
end;

procedure TformRealCortado.FormCreate(Sender: TObject);
begin
    gridRealCortado.ControlStyle    :=gridRealCortado.ControlStyle + [csClickEvents];
    TForm(gridRealCortado).OnClick  :=gridRealCortadoClick;
end;

procedure TformRealCortado.FormShow(Sender: TObject);

begin
//     labNumCorte.Caption := intToStr(formPrincipal.gridOrdem.Fields[0].Value) +'-00'+ intToStr(formPrincipal.gridOrdem.Fields[1].Value);
end;

procedure TformRealCortado.gridRealCortadoClick(Sender: TObject);

var
    valor : double;

begin
    labItem.Caption:=gridRealCortado.Fields[4].Value+'  Cor: '+gridRealCortado.Fields[6].Value+'  Tamanho: '+gridRealCortado.Fields[7].Value;

    with dmRealCortado.qyRealCortadoOciId do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   oci.oci_id,');
        SQL.Add('   oci.oci_iditemficha, oci.oci_vlrtotal, oci.oci_vlr_sobra,');
        SQL.Add('   ocp.oci_id, ocp.oci_qtdade1, ocp.oci_qtdade2, ocp.oci_qtdade3, ocp.oci_qtdade4, ocp.oci_qtdade5,');
        SQL.Add('   ocp.oci_qtdade6, ocp.oci_qtdade7, ocp.oci_qtdade8, ocp.oci_qtdade9, ocp.oci_qtdade10, ocp.oci_qtdade11,');
        SQL.Add('   ocp.oci_qtdade12, ocp.oci_qtdade13, ocp.oci_qtdade14, ocp.oci_qtdade15, ocp.oci_vlr1, ocp.oci_vlr2,');
        SQL.Add('   ocp.oci_vlr3, ocp.oci_vlr4, ocp.oci_vlr5, ocp.oci_vlr6, ocp.oci_vlr7, ocp.oci_vlr8, ocp.oci_vlr9,');
        SQL.Add('   ocp.oci_vlr10, ocp.oci_vlr11, ocp.oci_vlr12, ocp.oci_vlr13, ocp.oci_vlr14, ocp.oci_vlr15');
        SQL.Add('   FROM ordem_corte_itens_real AS oci');
        SQL.Add('   JOIN ordem_corte_itens_previsto AS ocp ON ocp.oci_iditemficha = oci.oci_iditemficha');
        SQL.Add('   WHERE oci.oci_id = :idRealCortado AND ocp.oci_idocorte = :ordem');

        ParamByName('idRealCortado').AsInteger:=strtoint(gridRealCortado.Fields[0].Value);
        ParamByName('ordem').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;

        with dmRealCortado.qyRealQtdGrade do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT * FROM ordem_corte_itens_real');
            SQL.Add('   WHERE oci_id = :idReal');

            ParamByName('idReal').AsInteger :=strtoint(gridRealCortado.Fields[0].Value);
            Open;

            if labIndividual1.Visible = true then
            begin
                labIndividual1.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr1').AsFloat);
                spinTamanho1.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade1').Value;
                spinTamReal1.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade1').Value;
                labTotal1.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade1').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr1').Value));
            end;

            if labIndividual2.Visible = true then
            begin
                labIndividual2.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr2').AsFloat);
                spinTamanho2.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade2').Value;
                spinTamReal2.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade2').Value;
                labTotal2.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade2').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr2').Value));
            end;

            if labIndividual3.Visible = true then
            begin
                labIndividual3.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr3').AsFloat);
                spinTamanho3.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade3').Value;
                spinTamReal3.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade3').Value;
                labTotal3.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade3').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr3').Value));
            end;

            if labIndividual4.Visible = true then
            begin
                labIndividual4.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr4').AsFloat);
                spinTamanho4.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade4').Value;
                spinTamReal4.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade4').Value;
                labTotal4.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade4').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr4').Value));
            end;

            if labIndividual5.Visible = true then
            begin
                labIndividual5.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr5').AsFloat);
                spinTamanho5.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade5').Value;
                spinTamReal5.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade5').Value;
                labTotal5.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade5').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr5').Value));
            end;

            if labIndividual6.Visible = true then
            begin
                labIndividual6.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr6').AsFloat);
                spinTamanho6.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade6').Value;
                spinTamReal6.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade6').Value;
                labTotal6.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade6').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr6').Value));
            end;

            if labIndividual7.Visible = true then
            begin
                labIndividual7.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr7').AsFloat);
                spinTamanho7.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade7').Value;
                spinTamReal7.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade7').Value;
                labTotal7.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade7').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr7').Value));
            end;

            if labIndividual8.Visible = true then
            begin
                labIndividual8.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr8').AsFloat);
                spinTamanho8.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade8').Value;
                spinTamReal8.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade8').Value;
                labTotal8.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade8').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr8').Value));
            end;

            if labIndividual9.Visible = true then
            begin
                labIndividual9.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr9').AsFloat);
                spinTamanho9.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade9').Value;
                spinTamReal9.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade9').Value;
                labTotal9.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade9').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr9').Value));
            end;

            if labIndividual10.Visible = true then
            begin
                labIndividual10.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr10').AsFloat);
                spinTamanho10.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade10').Value;
                spinTamReal10.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade10').Value;
                labTotal10.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade10').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr10').Value));
            end;

            if labIndividual11.Visible = true then
            begin
                labIndividual11.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr11').AsFloat);
                spinTamanho11.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade11').Value;
                spinTamReal11.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade11').Value;
                labTotal11.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade11').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr11').Value));
            end;

            if labIndividual12.Visible = true then
            begin
                labIndividual12.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr12').AsFloat);
                spinTamanho12.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade12').Value;
                spinTamReal12.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade12').Value;
                labTotal12.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade12').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr12').Value));
            end;

            if labIndividual13.Visible = true then
            begin
                labIndividual13.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr13').AsFloat);
                spinTamanho13.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade13').Value;
                spinTamReal13.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade13').Value;
                labTotal13.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade13').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr13').Value));
            end;

            if labIndividual14.Visible = true then
            begin
                labIndividual14.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr14').AsFloat);
                spinTamanho14.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade14').Value;
                spinTamReal14.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade14').Value;
                labTotal14.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade14').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr14').Value));
            end;

            if labIndividual15.Visible = true then
            begin
                labIndividual15.Caption := formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr15').AsFloat);
                spinTamanho15.Text :=dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade15').Value;
                spinTamReal15.Text :=dmRealCortado.qyRealQtdGrade.FieldByName('oci_qtdade15').Value;
                labTotal15.Caption:=formatfloat('0.0000',(dmRealCortado.qyRealCortadoOciId.FieldByName('oci_qtdade15').Value * dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr15').Value));
            end;

            labNumConsTotal.Caption:=formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlrtotal').AsFloat);
            labNumConsRestante.Caption:=formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr_sobra').AsFloat);
            labNumTotal.Caption:=formatfloat('0.0000',dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlrtotal').AsFloat + dmRealCortado.qyRealCortadoOciId.FieldByName('oci_vlr_sobra').AsFloat);
            labNumUnidade.Caption:=gridRealCortado.Fields[25].Value;
        end;
    end;

    with dmRealCortado.qyRealQtdCortes do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT SUM(oci_qtdade1 + oci_qtdade2 + oci_qtdade3 + oci_qtdade4 + oci_qtdade5 + oci_qtdade6 +');
        SQL.Add(' oci_qtdade7 + oci_qtdade8 + oci_qtdade9 + oci_qtdade10 + oci_qtdade11 + oci_qtdade12');
        SQL.Add(' + oci_qtdade13 + oci_qtdade14 + oci_qtdade15)');
        SQL.Add('  AS qtd_cortes FROM ordem_corte_itens_real WHERE oci_id = :idRealCortado');

        ParamByName('idRealCortado').AsInteger:=strtoint(gridRealCortado.Fields[0].Value);
        Open;

        labNumQtdCortes.Caption:=dmRealCortado.qyRealQtdCortes.FieldByName('qtd_cortes').Value;
        valor:=strtofloat(labNumTotal.Caption)/strtofloat(dmRealCortado.qyRealQtdCortes.FieldByName('qtd_cortes').Value);
        labNumMedia.Caption:=formatfloat('0.0000',valor);
    end;
end;

procedure TformRealCortado.gridRealCortadoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if dmRealCortado.qyGridRealCortado.FieldByName('oci_tipo').Value = 'P' then
      gridRealCortado.Canvas.Font.Color := clBlue
    else
      if dmRealCortado.qyGridRealCortado.FieldByName('oci_tecido').Value = true then
         gridRealCortado.Canvas.Font.Color := clGreen;

    gridRealCortado.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TformRealCortado.reabrirGuiaClick(Sender: TObject);
begin
//      ShowMessage('Cliquei no REABRIR');
    acaoReabriRealCortadoExecute(Sender);
end;

procedure TformRealCortado.retirarCortadoClick(Sender: TObject);
begin
//    ShowMessage('Cliquei no retirar cortado!');
    acaoRetirarCortadoExecute(Sender);
end;

end.
