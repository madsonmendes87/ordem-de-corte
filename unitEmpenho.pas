unit unitEmpenho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons, System.Actions, Vcl.ActnList;

type
  TformEmpenho = class(TForm)
    labArtigo: TLabel;
    gridArtigo: TDBGrid;
    labConsumosInf: TLabel;
    editConsumo: TEdit;
    butConsumo: TSpeedButton;
    panelButConsumo: TPanel;
    panelEmpMais: TPanel;
    butEmpMais: TSpeedButton;
    panelButMais: TPanel;
    editConsumoMais: TEdit;
    butConsumoMais: TSpeedButton;
    panelConsumoNaoMais: TPanel;
    butConsumoNaoMais: TSpeedButton;
    panelEscolher: TPanel;
    butEscolher: TSpeedButton;
    gridEstoque: TDBGrid;
    panelRetirar: TPanel;
    butRetirar: TSpeedButton;
    panelFinalizar: TPanel;
    butFinalizar: TSpeedButton;
    actionEmpenho: TActionList;
    acaoEscolher: TAction;
    acaoConsumo: TAction;
    acaoEmpMais: TAction;
    acaoEmpNaoMais: TAction;
    acaoConsumoMais: TAction;
    acaoRetirar: TAction;
    acaoFinalizar: TAction;
    procedure editConsumoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure butEmpMaisClick(Sender: TObject);
    procedure butConsumoNaoMaisClick(Sender: TObject);
    procedure acaoEscolherExecute(Sender: TObject);
    procedure butEscolherClick(Sender: TObject);
    procedure acaoConsumoExecute(Sender: TObject);
    procedure butConsumoClick(Sender: TObject);
    procedure acaoEmpMaisExecute(Sender: TObject);
    procedure acaoEmpNaoMaisExecute(Sender: TObject);
    procedure acaoConsumoMaisExecute(Sender: TObject);
    procedure butConsumoMaisClick(Sender: TObject);
    procedure acaoRetirarExecute(Sender: TObject);
    procedure butRetirarClick(Sender: TObject);
    procedure acaoFinalizarExecute(Sender: TObject);
    procedure butFinalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEmpenho: TformEmpenho;

implementation

{$R *.dfm}

uses UnitPrevisto, unitDMEmpenho, UnitPrincipal, unitSelecEmpenho;



procedure TformEmpenho.acaoConsumoExecute(Sender: TObject);
begin
    if butConsumo.Visible = true then
    begin
        ShowMessage('Cliquei no botao add consumo ');
    end;
end;

procedure TformEmpenho.acaoConsumoMaisExecute(Sender: TObject);
begin
    if panelButMais.Visible = true then
    begin
        ShowMessage('Cliquei no botao consumo mais ');
    end;
end;

procedure TformEmpenho.acaoEmpMaisExecute(Sender: TObject);
begin
    if butEmpMais.Visible = true then
    begin
        panelEmpMais.Visible                  :=false;
        editConsumoMais.Visible               :=true;
        panelButMais.Visible                  :=true;
        panelConsumoNaoMais.Visible           :=true;
    end;
end;

procedure TformEmpenho.acaoEmpNaoMaisExecute(Sender: TObject);
begin
    if butConsumoNaoMais.Visible = true then
    begin
        panelEmpMais.Visible                  :=true;
        editConsumoMais.Visible               :=false;
        panelButMais.Visible                  :=false;
        panelConsumoNaoMais.Visible           :=false;
    end;
end;

procedure TformEmpenho.acaoEscolherExecute(Sender: TObject);
begin
    if butEscolher.Visible = true then
    begin
        application.CreateForm(TformSelecEmpenho,formSelecEmpenho);
        formSelecEmpenho.ShowModal;
    end;
end;

procedure TformEmpenho.acaoFinalizarExecute(Sender: TObject);
begin
    if butFinalizar.Visible = true then
    begin
        ShowMessage('Cliquei no botao finalizar ');
    end;
end;

procedure TformEmpenho.acaoRetirarExecute(Sender: TObject);
begin
    if butRetirar.Visible = true then
    begin
        ShowMessage('Cliquei no botao retirar ');
    end;
end;

procedure TformEmpenho.butConsumoClick(Sender: TObject);
begin
    acaoConsumoExecute(Sender);
end;

procedure TformEmpenho.butConsumoMaisClick(Sender: TObject);
begin
    acaoConsumoMaisExecute(Sender);
end;

procedure TformEmpenho.butConsumoNaoMaisClick(Sender: TObject);
begin
    acaoEmpNaoMaisExecute(Sender);
//    panelEmpMais.Visible                  :=true;
//    editConsumoMais.Visible               :=false;
//    panelButMais.Visible                  :=false;
//    panelConsumoNaoMais.Visible           :=false;
end;

procedure TformEmpenho.butEmpMaisClick(Sender: TObject);
begin
    acaoEmpMaisExecute(Sender);
//    panelEmpMais.Visible                  :=false;
//    editConsumoMais.Visible               :=true;
//    panelButMais.Visible                  :=true;
//    panelConsumoNaoMais.Visible           :=true;
end;

procedure TformEmpenho.butEscolherClick(Sender: TObject);
begin
      acaoEscolherExecute(Sender);
end;

procedure TformEmpenho.butFinalizarClick(Sender: TObject);
begin
    acaoFinalizarExecute(Sender);
end;

procedure TformEmpenho.butRetirarClick(Sender: TObject);
begin
    acaoRetirarExecute(Sender);
end;

procedure TformEmpenho.editConsumoKeyPress(Sender: TObject; var Key: Char);
begin
    if not(Key in['0'..'9',',',#8]) then
      Key:=#0;

end;

procedure TformEmpenho.FormShow(Sender: TObject);
begin
    if formPrevisto.panelCabecalho.Caption = 'Corte Previsto - Prot�tipo' then
    begin
        panelEmpMais.Visible              :=false;
        editConsumoMais.Visible           :=false;
        panelButMais.Visible              :=false;
        panelConsumoNaoMais.Visible       :=false;
    end;

    if formPrevisto.panelCabecalho.Caption = 'Corte Previsto - Grande Escala' then
    begin
        editConsumoMais.Visible           :=false;
        panelButMais.Visible              :=false;
        panelConsumoNaoMais.Visible       :=false;
    end;

    with dmEmpenho.qyArtigoEmpenho do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   oci.oci_id,');
        SQL.Add('   oci.oci_iditemficha,');
        SQL.Add('   oci.oci_tecido,');
        SQL.Add('   cp.cp_id,');
        SQL.Add('   gc.grc_id,');
        SQL.Add('   gt.grt_id,');
        SQL.Add('   oci.oci_idgradecorprodutoacabado,');
        SQL.Add('   cp.cp_descricao,');
        SQL.Add('   CAST(COALESCE(gc.grc_codexterno, '''') ||''-'' || TRIM(gc.grc_nome)AS character varying(18)) AS grc_nome,');
        SQL.Add('   grt_nome,');
        SQL.Add('   CAST(COALESCE(gc_pa.grc_codexterno, '''') ||'' - '' || TRIM(gc_pa.grc_nome)AS character varying(18)) AS grc_nome_pa,');
        SQL.Add('   oci.oci_vlrtotal,');
        SQL.Add('   (oci.oci_vlrtotal) AS oci_restante,');
        SQL.Add('   (SELECT');
        SQL.Add('         COALESCE(');
        SQL.Add('               SUM (');
        SQL.Add('                        (');
        SQL.Add('                                COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
        SQL.Add('                                COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
        SQL.Add('                        ) -');
        SQL.Add('                        (');
        SQL.Add('                                COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
        SQL.Add('                        ) -');
        SQL.Add('                        (');
        SQL.Add('                                COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
        SQL.Add('                        )');
        SQL.Add('                   )');
        SQL.Add('           , 0.0000)');
        SQL.Add('           FROM estoque AS e');
        SQL.Add('           JOIN cadastro_produto AS cp_i ON e.es_codproduto = cp_i.cp_id');
        SQL.Add('           JOIN grade_cor AS gc_i On gc_i.grc_id = e.es_idgradecor');
        SQL.Add('           WHERE gc_i.grc_id=gc.grc_id');
        SQL.Add('           AND cp_i.cp_id=cp.cp_id');
        SQL.Add('           AND(');
        SQL.Add('                    (');
        SQL.Add('                           COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
        SQL.Add('                           COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
        SQL.Add('                    ) -');
        SQL.Add('                    (');
        SQL.Add('                           COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
        SQL.Add('                    ) -');
        SQL.Add('                    (');
        SQL.Add('                           COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
        SQL.Add('                    )');
        SQL.Add('               )>0');
        SQL.Add('   )AS disponivel,');
        SQL.Add('   cp.cp_un');
        SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
        SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id');
        SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
        SQL.Add('   JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
        SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
        SQL.Add('   WHERE oci.oci_idocorte =:corte AND oci.oci_situacao_id = ''1'' AND oci.oci_tecido = true');

        ParamByName('corte').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
    end;

    gridArtigo.Columns[0].Visible:=false;
    gridArtigo.Columns[1].Visible:=false;
    gridArtigo.Columns[2].Visible:=false;
    gridArtigo.Columns[3].Title.Alignment         :=taCenter;
    gridArtigo.Columns[3].Title.Caption           :='C�digo';
    gridArtigo.Columns[3].Title.Font.Style        :=[fsBold];
    gridArtigo.Columns[4].Visible:=false;
    gridArtigo.Columns[5].Visible:=false;
    gridArtigo.Columns[6].Visible:=false;
    gridArtigo.Columns[7].Title.Alignment         :=taCenter;
    gridArtigo.Columns[7].Title.Caption           :='Artigo';
    gridArtigo.Columns[7].Title.Font.Style        :=[fsBold];
    gridArtigo.Columns[8].Title.Alignment         :=taCenter;
    gridArtigo.Columns[8].Title.Caption           :='Cor';
    gridArtigo.Columns[8].Title.Font.Style        :=[fsBold];
    gridArtigo.Columns[9].Title.Alignment         :=taCenter;
    gridArtigo.Columns[9].Title.Caption           :='Largura';
    gridArtigo.Columns[9].Title.Font.Style        :=[fsBold];
    gridArtigo.Columns[10].Title.Alignment        :=taCenter;
    gridArtigo.Columns[10].Title.Caption          :='Cor Refer�ncia';
    gridArtigo.Columns[10].Title.Font.Style       :=[fsBold];
    gridArtigo.Columns[11].Title.Alignment        :=taCenter;
    gridArtigo.Columns[11].Title.Caption          :='Consumo';
    gridArtigo.Columns[11].Title.Font.Style       :=[fsBold];
    gridArtigo.Columns[12].Title.Alignment        :=taCenter;
    gridArtigo.Columns[12].Title.Caption          :='Restante';
    gridArtigo.Columns[12].Title.Font.Style       :=[fsBold];
    gridArtigo.Columns[13].Title.Alignment        :=taCenter;
    gridArtigo.Columns[13].Title.Caption          :='Dispon�vel';
    gridArtigo.Columns[13].Title.Font.Style       :=[fsBold];
    gridArtigo.Columns[14].Title.Alignment        :=taCenter;
    gridArtigo.Columns[14].Title.Caption          :='UN';
    gridArtigo.Columns[14].Title.Font.Style       :=[fsBold];
end;

end.
