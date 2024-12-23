﻿unit UnitSelecionArtigos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtDlgs, Jpeg;

type
  TformSelecionArtigo = class(TForm)
    panelDivisa: TPanel;
    panelDivisaSup: TPanel;
    labFiltrarPor: TLabel;
    comboFiltro: TComboBox;
    labDadosConsulta: TLabel;
    editSearch: TEdit;
    labTipoProduto: TLabel;
    butLimpaTiProduto: TButton;
    labGradeCor: TLabel;
    dbLkComboGrc: TDBLookupComboBox;
    butLimpaGrc: TButton;
    labGradeTamanho: TLabel;
    dbLkComboGradeTam: TDBLookupComboBox;
    butLimpaGraTam: TButton;
    butPesquisar: TSpeedButton;
    panelSelecionar: TPanel;
    butSelecionar: TSpeedButton;
    gridSelecArtigo: TDBGrid;
    labCodigo: TLabel;
    labProduto: TLabel;
    labCor: TLabel;
    labTamanho: TLabel;
    dbLkComboTiProd: TDBLookupComboBox;
    panelFoto1: TPanel;
    panelFoto2: TPanel;
    labFotoRetirar1: TLabel;
    labFotoRetirar2: TLabel;
    labFotoRetirar3: TLabel;
    labFotoSubstituir1: TLabel;
    labFotoSubstituir2: TLabel;
    labFotoSubstituir3: TLabel;
    imageRetirar: TImage;
    imageSubstituir: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure butLimpaTiProdutoClick(Sender: TObject);
    procedure butLimpaGrcClick(Sender: TObject);
    procedure butLimpaGraTamClick(Sender: TObject);
    procedure butPesquisarClick(Sender: TObject);
    procedure butSelecionarClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butSelecionarMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure labFotoRetirar1Click(Sender: TObject);
    procedure labFotoRetirar2Click(Sender: TObject);
    procedure labFotoRetirar3Click(Sender: TObject);
    procedure editSearchKeyPress(Sender: TObject; var Key: Char);
    procedure comboFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure labFotoSubstituir1Click(Sender: TObject);
    procedure labFotoSubstituir2Click(Sender: TObject);
    procedure labFotoSubstituir3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure gridSelecArtigoClick(Sender: TObject);
  public
    { Public declarations }
    procedure fotoRetirar;
    procedure fotoSubstituir;
    procedure carregarImagemSubstituir;
    procedure carregarImagemRetirar;
  end;

var
  formSelecionArtigo: TformSelecionArtigo;
  arquivoPath : string;

implementation

{$R *.dfm}

uses UnitMudancArtigo, UnitDatamodule, UnitPrincipal, unitDMPrincipal,
  unitDMSelecionArtigo;

procedure TformSelecionArtigo.butLimpaGraTamClick(Sender: TObject);
begin
    dbLkComboGradeTam.KeyValue :=Null;
end;

procedure TformSelecionArtigo.butLimpaGrcClick(Sender: TObject);
begin
    dbLkComboGrc.KeyValue :=Null;
end;

procedure TformSelecionArtigo.butLimpaTiProdutoClick(Sender: TObject);
begin
    dbLkComboTiProd.KeyValue :=Null;
end;

procedure TformSelecionArtigo.butPesquisarClick(Sender: TObject);
begin
      with dmSelecionArtigo.qySelecArtigo do
      begin
          Close;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('      cc.comp_nome,');
          SQL.Add('      cp.cp_id,');
          SQL.Add('      cp.cp_descricao AS produto,');
          SQL.Add('      CAST(COALESCE(gc.grc_codexterno, '''') ||'' - '' || TRIM(gc.grc_nome)AS character varying(18)) AS grc_nome,');
          SQL.Add('      gt.grt_nome,');
          SQL.Add('      (SUM(');
          SQL.Add('                     (');
          SQL.Add('                                       COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
          SQL.Add('                                       COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
          SQL.Add('                     ) -');
          SQL.Add('                     (');
          SQL.Add('                                       COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
          SQL.Add('                     )');
          SQL.Add('                     -(');
          SQL.Add('                                       COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
          SQL.Add('                     )');
          SQL.Add('           )');
          SQL.Add('     )AS disponivel,');
          SQL.Add('     cp.cp_un,');
          SQL.Add('     cp.cp_nomefoto1,');
	        SQL.Add('     cp.cp_nomefoto2,');
	        SQL.Add('     cp.cp_nomefoto3,');
	        SQL.Add('     pgc.pgc_nomefoto,');
          SQL.Add('     cp.cp_qtdadefracionada,');
	        SQL.Add('     cp.cp_rolopeca,');
          SQL.Add('     cp.cp_idtipoproduto,');
          SQL.Add('     gc.grc_id,');
	        SQL.Add('     gt.grt_id');
          SQL.Add('     FROM estoque AS e');
          SQL.Add('     JOIN cadastro_produto As cp on e.es_codproduto = cp.cp_id');
          SQL.Add('     JOIN grade_cor As gc on gc.grc_id = e.es_idgradecor');
          SQL.Add('     JOIN grade_tamanho As gt on gt.grt_id = e.es_idgradetam');
          SQL.Add('     LEFT JOIN itens_grade_nfentrada AS igf ON igf.ig_codproduto=cp.cp_id');
          SQL.Add('     AND igf.ig_gradecor=gc.grc_id');
          SQL.Add('     AND igf.ig_gradetam=gt.grt_id');
          SQL.Add('     AND igf.ig_numrolo=e.es_numrolo');
          SQL.Add('     AND igf.ig_metragemrolo=e.es_metragemrolo');
          SQL.Add('     LEFT JOIN cadastro_compradores AS cc ON cc.comp_id = igf.ig_idcomprador');
          SQL.Add('     LEFT JOIN produto_gradecor AS pgc ON pgc.pgc_idcodproduto = cp.cp_id  AND pgc.pgc_idgradecor = gc.grc_id');
          SQL.Add('     WHERE cp.cp_direto = TRUE');
          SQL.Add('     AND cp.cp_desativado = FALSE');
          if comboFiltro.Text = 'CODIGO PRODUTO' then
          begin
                SQL.Add('AND cp.cp_id = :codProduto');
                ParamByName('codProduto').AsInteger :=strtointdef(editSearch.Text,0);
          end;
          if comboFiltro.Text = 'DESCRICAO' then
          begin
                SQL.Add('AND cp.cp_descricao = :descricao');
                ParamByName('descricao').AsString :=editSearch.Text;
          end;
          if dbLkComboTiProd.KeyValue <> Null then
          begin
                SQL.Add('AND cp.cp_idtipoproduto = :tipoProd');
                ParamByName('tipoProd').AsInteger  :=dbLkComboTiProd.KeyValue;
          end;
          if dbLkComboGrc.KeyValue <> Null then
          begin
                SQL.Add('AND gc.grc_id = :idCor');
                ParamByName('idCor').AsInteger :=dbLkComboGrc.KeyValue;
          end;
          if dbLkComboGradeTam.KeyValue<>Null then
          begin
                SQL.Add('AND gt.grt_id = :idTam');
                ParamByName('idTam').AsInteger :=dbLkComboGradeTam.KeyValue;
          end;
          SQL.Add('     GROUP BY');
          SQL.Add('             cp.cp_id,');
          SQL.Add('             gc.grc_id,');
          SQL.Add('             gt.grt_id,');
          SQL.Add('             cp.cp_descricao,');
          SQL.Add('             gc.grc_nome,');
          SQL.Add('             gc.grc_codexterno,');
          SQL.Add('             gc.grc_sigla,');
          SQL.Add('             gt.grt_nome,');
          SQL.Add('             gt.grt_sigla,');
          SQL.Add('             cp.cp_nomefoto1,');
          SQL.Add('             cp.cp_nomefoto2,');
          SQL.Add('             cp.cp_nomefoto3,');
          SQL.Add('             cp.cp_qtdadefracionada,');
          SQL.Add('             cc.comp_nome,');
          SQL.Add('             pgc.pgc_nomefoto');
          SQL.Add(' ORDER BY cp.cp_descricao,gc.grc_nome, gt.grt_nome ASC  LIMIT 20');
          Open;
      end;

      if dmSelecionArtigo.qySelecArtigo.RecordCount >0 then
      begin
          fotoSubstituir;
          arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto1').Value;
          carregarImagemSubstituir;
      end;
end;

procedure TformSelecionArtigo.butSelecionarClick(Sender: TObject);
var
    msg:string;
begin
    if dmSelecionArtigo.qySelecArtigo.RecordCount = 0 then
    begin
        Application.MessageBox('Selecione o artigo para realizar troca!','Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    with dmSelecionArtigo.qyComparArtigo1 do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   cp.cp_id, gc.grc_id, gt.grt_id');
        SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
        SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id');
        SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
        SQL.Add('   JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
        SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
        SQL.Add('   WHERE oci.oci_idocorte = :corte AND oci.oci_situacao_id<>''2''');
        SQL.Add('   AND cp.cp_id = :idProduto AND oci_id = :idPrevisto');

        ParamByName('corte').AsInteger      :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        ParamByName('idProduto').AsInteger  :=strtoint(forMudancArtigo.gridMudancArtigo.Fields[0].Value);
        ParamByName('idPrevisto').AsInteger  :=strtoint(forMudancArtigo.gridMudancArtigo.Fields[6].Value);
        Open;
    end;

    with dmSelecionArtigo.qyComparArtigo2 do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   cp.cp_id, gc.grc_id, gt.grt_id');
        SQL.Add('   FROM estoque AS e');
        SQL.Add('   JOIN cadastro_produto AS cp ON e.es_codproduto = cp.cp_id');
        SQL.Add('   JOIN grade_cor As gc on gc.grc_id = e.es_idgradecor');
        SQL.Add('   JOIN grade_tamanho As gt on gt.grt_id = e.es_idgradetam');
        SQL.Add('   WHERE cp.cp_id = :idProduto AND grc_id = :idCor AND grt_id = :idTamanho');

        ParamByName('idProduto').AsInteger      :=strtoint(gridSelecArtigo.Fields[1].Value);
        ParamByName('idCor').AsInteger          :=dmSelecionArtigo.qySelecArtigo.FieldByName('grc_id').Value;
        ParamByName('idTamanho').AsInteger      :=dmSelecionArtigo.qySelecArtigo.FieldByName('grt_id').Value;
        Open;
    end;


if dmSelecionArtigo.qyComparArtigo1.FieldByName('cp_id').Value = dmSelecionArtigo.qyComparArtigo2.FieldByName('cp_id').Value then
begin
       if dmSelecionArtigo.qyComparArtigo1.FieldByName('grc_id').Value = dmSelecionArtigo.qyComparArtigo2.FieldByName('grc_id').Value then
       begin
            if dmSelecionArtigo.qyComparArtigo1.FieldByName('grt_id').Value = dmSelecionArtigo.qyComparArtigo2.FieldByName('grt_id').Value then
            begin
                Application.MessageBox('Você está tentando substituir o item por ele mesmo!', 'Aviso', MB_OK + MB_ICONINFORMATION);
                exit;
            end;
       end;
end;

    with dmSelecionArtigo.qyEstoqueArtigo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT');
        SQL.Add('   e.es_id,');
        SQL.Add('   e.es_codloja,');
        SQL.Add('   e.es_codproduto,');
        SQL.Add('   e.es_idgradecor,');
        SQL.Add('   e.es_idgradetam,');
        SQL.Add('   cp.cp_descricao,');
        SQL.Add('   gc.grc_nome,');
        SQL.Add('   gt.grt_nome,');
        SQL.Add('   e.es_metragemrolo,');
        SQL.Add('   COALESCE(e.es_custoatual, 0) AS es_custoatual,');
        SQL.Add('   e.es_numrolo,');
        SQL.Add('           (');
        SQL.Add('                 (');
        SQL.Add('                       COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
        SQL.Add('                       COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
        SQL.Add('                 ) -');
        SQL.Add('                 (');
        SQL.Add('                       COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
        SQL.Add('                 ) -');
        SQL.Add('                 (');
        SQL.Add('                       COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
        SQL.Add('                 )');
        SQL.Add('           )AS disponivel');
        SQL.Add('   FROM estoque AS e');
        SQL.Add('   JOIN cadastro_produto AS cp ON e.es_codproduto = cp.cp_id');
        SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = e.es_idgradecor');
        SQL.Add('   JOIN grade_tamanho AS gt ON gt.grt_id = e.es_idgradetam');
        SQL.Add('   WHERE gc.grc_id = :idCor');
        SQL.Add('   AND gt.grt_id = :idTamanho');
        SQL.Add('   AND cp.cp_id = :idProduto');
        SQL.Add('   AND');
        SQL.Add('          (');
        SQL.Add('                (');
        SQL.Add('                       COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
        SQL.Add('                       COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
        SQL.Add('                ) -');
        SQL.Add('                (');
        SQL.Add('                       COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
        SQL.Add('                ) -');
        SQL.Add('                (');
        SQL.Add('                       COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
        SQL.Add('                )');
        SQL.Add('          ) > 0');
        SQL.Add('   ORDER BY disponivel ASC       ');

        ParamByName('idCor').AsInteger      :=dmSelecionArtigo.qySelecArtigo.FieldByName('grc_id').Value;
        ParamByName('idTamanho').AsInteger  :=dmSelecionArtigo.qySelecArtigo.FieldByName('grt_id').Value;
        ParamByName('idProduto').AsInteger  :=dmSelecionArtigo.qySelecArtigo.FieldByName('cp_id').Value;
        Open;
    end;

    if dmSelecionArtigo.qyEstoqueArtigo.RecordCount = 0 then
    begin
       Application.MessageBox('Estoque indisponivel para troca, verifique o saldo disponivel!','Atenção',MB_OK + MB_ICONINFORMATION);
       exit;
    end;

    msg:= 'EFETUAR TROCA?'+#13+#13+
          forMudancArtigo.gridMudancArtigo.Fields[3].Value +' '+forMudancArtigo.gridMudancArtigo.Fields[4].Value+#13+
          '                                   ↑↓'+#13+
          gridSelecArtigo.Fields[2].Value+' '+gridSelecArtigo.Fields[3].Value;

    with Application do
    begin
        if MessageBox(PChar(msg), 'Ordem Corte', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
        begin
            forMudancArtigo.editCodigo.Text     :=gridSelecArtigo.Fields[1].Value;
            forMudancArtigo.editProduto.Text    :=gridSelecArtigo.Fields[2].Value;
            forMudancArtigo.editCor.Text        :=gridSelecArtigo.Fields[3].Value;
            forMudancArtigo.ediTamanho.Text     :=gridSelecArtigo.Fields[4].Value;
            forMudancArtigo.labIdCor.Caption    :=dmSelecionArtigo.qySelecArtigo.FieldByName('grc_id').Value;
            forMudancArtigo.labIdTam.Caption    :=dmSelecionArtigo.qySelecArtigo.FieldByName('grt_id').Value;
            Close;
        end;
    end;
end;

procedure TformSelecionArtigo.butSelecionarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butSelecionar.Font.Color :=clLime;
end;

procedure TformSelecionArtigo.carregarImagemRetirar;
begin
    if FileExists(arquivoPath) then
    begin
        imageRetirar.Picture.LoadFromFile(arquivoPath);
    end
    else
        imageRetirar.Picture.LoadFromFile('C:\Sistema DiaERP\foto.jpg');
end;

procedure TformSelecionArtigo.carregarImagemSubstituir;
begin
    if FileExists(arquivoPath) then
    begin
        imageSubstituir.Picture.LoadFromFile(arquivoPath);
    end
    else
        imageSubstituir.Picture.LoadFromFile('C:\Sistema DiaERP\foto.jpg');
end;

procedure TformSelecionArtigo.comboFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
       editSearch.SetFocus;
end;

procedure TformSelecionArtigo.editSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
       butPesquisarClick(Sender);
end;

procedure TformSelecionArtigo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action :=CaFree;
end;

procedure TformSelecionArtigo.FormCreate(Sender: TObject);
begin
    gridSelecArtigo.ControlStyle := gridSelecArtigo.ControlStyle + [csClickEvents];
    TForm(gridSelecArtigo).OnClick := gridSelecArtigoClick;
end;

procedure TformSelecionArtigo.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butSelecionar.Font.Color  :=clWhite;
end;

procedure TformSelecionArtigo.FormShow(Sender: TObject);
begin
    labCodigo.Caption                               :=forMudancArtigo.gridMudancArtigo.Fields[0].Value;
    labProduto.Caption                              :=forMudancArtigo.gridMudancArtigo.Fields[3].Value;
    labCor.Caption                                  :=forMudancArtigo.gridMudancArtigo.Fields[4].Value;
    labTamanho.Caption                              :=forMudancArtigo.gridMudancArtigo.Fields[5].Value;
    dmSelecionArtigo.qySelecArtigo.Active           :=false;

    gridSelecArtigo.Columns[0].Title.Alignment      :=taCenter;
    gridSelecArtigo.Columns[0].Title.Caption        :='Comprador';
    gridSelecArtigo.Columns[0].Title.Font.Style     :=[fsBold];
    gridSelecArtigo.Columns[1].Title.Alignment      :=taCenter;
    gridSelecArtigo.Columns[1].Title.Caption        :='Código';
    gridSelecArtigo.Columns[1].Title.Font.Style     :=[fsBold];
    gridSelecArtigo.Columns[2].Title.Alignment      :=taCenter;
    gridSelecArtigo.Columns[2].Title.Caption        :='Produto';
    gridSelecArtigo.Columns[2].Title.Font.Style     :=[fsBold];
    gridSelecArtigo.Columns[3].Title.Alignment      :=taCenter;
    gridSelecArtigo.Columns[3].Title.Caption        :='Cor';
    gridSelecArtigo.Columns[3].Title.Font.Style     :=[fsBold];
    gridSelecArtigo.Columns[4].Title.Alignment      :=taCenter;
    gridSelecArtigo.Columns[4].Title.Caption        :='Largura/Tamanho';
    gridSelecArtigo.Columns[4].Title.Font.Style     :=[fsBold];
    gridSelecArtigo.Columns[5].Title.Alignment      :=taCenter;
    gridSelecArtigo.Columns[5].Title.Caption        :='Disponível';
    gridSelecArtigo.Columns[5].Title.Font.Style     :=[fsBold];
    gridSelecArtigo.Columns[6].Title.Alignment      :=taCenter;
    gridSelecArtigo.Columns[6].Title.Caption        :='UN';
    gridSelecArtigo.Columns[6].Title.Font.Style     :=[fsBold];

    fotoRetirar;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto1').Value;
    carregarImagemRetirar;
end;

procedure TformSelecionArtigo.fotoRetirar;
begin
    with dmSelecionArtigo.qyFotoProduto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT cp_nomefoto1, cp_nomefoto2, cp_nomefoto3 FROM cadastro_produto');
        SQL.Add('   WHERE cp_id = :idProduto');
        ParamByName('idProduto').AsInteger := strtoint(forMudancArtigo.gridMudancArtigo.Fields[0].Value);
        Open;
    end;
end;

procedure TformSelecionArtigo.fotoSubstituir;
begin
    with dmSelecionArtigo.qyFotoProduto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT cp_nomefoto1, cp_nomefoto2, cp_nomefoto3 FROM cadastro_produto');
        SQL.Add('   WHERE cp_id = :idProduto');
        ParamByName('idProduto').AsInteger := strtoint(gridSelecArtigo.Fields[1].Value);
        Open;
    end;
end;

procedure TformSelecionArtigo.gridSelecArtigoClick(Sender: TObject);
begin
    fotoSubstituir;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto1').Value;
    carregarImagemSubstituir;
end;

procedure TformSelecionArtigo.labFotoSubstituir1Click(Sender: TObject);
begin
    fotoSubstituir;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto1').Value;
    carregarImagemSubstituir;
end;

procedure TformSelecionArtigo.labFotoSubstituir2Click(Sender: TObject);
begin
    fotoSubstituir;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto2').Value;
    carregarImagemSubstituir;
end;

procedure TformSelecionArtigo.labFotoSubstituir3Click(Sender: TObject);
begin
    fotoSubstituir;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto3').Value;
    carregarImagemSubstituir;
end;

procedure TformSelecionArtigo.labFotoRetirar1Click(Sender: TObject);
begin
    fotoRetirar;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto1').Value;
    carregarImagemRetirar;
end;

procedure TformSelecionArtigo.labFotoRetirar2Click(Sender: TObject);
begin
    fotoRetirar;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto2').Value;
    carregarImagemRetirar;
end;

procedure TformSelecionArtigo.labFotoRetirar3Click(Sender: TObject);
begin
    fotoRetirar;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecionArtigo.qyFotoProduto.FieldByName('cp_nomefoto3').Value;
    carregarImagemRetirar;
end;

end.
