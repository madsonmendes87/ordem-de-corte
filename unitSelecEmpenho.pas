unit unitSelecEmpenho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, System.Math, Vcl.Buttons;

type
  TformSelecEmpenho = class(TForm)
    labNomeCOD: TLabel;
    labCOD: TLabel;
    labNomePROD: TLabel;
    labPROD: TLabel;
    labNomeCOR: TLabel;
    labCor: TLabel;
    labNomeLargura: TLabel;
    labLargura: TLabel;
    labNomeCoRef: TLabel;
    labCoRef: TLabel;
    labNomeConsumo: TLabel;
    labConsumo: TLabel;
    panelFoto: TPanel;
    imagem: TImage;
    dbLCBoxComprador: TDBLookupComboBox;
    butLimpaCompradores: TButton;
    chkMarcarTodas: TCheckBox;
    dbLCBoxFornecedor: TDBLookupComboBox;
    labComprador: TLabel;
    labFornecedor: TLabel;
    butLimpaFornecedores: TButton;
    gridSelecEmpenho: TDBGrid;
    panelSelecionar: TPanel;
    butSelecionar: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure butLimpaCompradoresClick(Sender: TObject);
    procedure butLimpaFornecedoresClick(Sender: TObject);
    procedure chkMarcarTodasClick(Sender: TObject);
    procedure gridSelecEmpenhoKeyPress(Sender: TObject; var Key: Char);
    procedure gridSelecEmpenhoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butSelecionarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
     procedure foto;
     procedure carregarFoto;
  end;

var
  formSelecEmpenho: TformSelecEmpenho;
  arquivoPath : string;

implementation

{$R *.dfm}

uses unitEmpenho, unitDMSelecEmpenho, unitDMPrincipal, unitDMEmpenho;

procedure TformSelecEmpenho.butLimpaCompradoresClick(Sender: TObject);
begin
    dbLCBoxComprador.KeyValue :=Null;
end;

procedure TformSelecEmpenho.butLimpaFornecedoresClick(Sender: TObject);
begin
    dbLCBoxFornecedor.KeyValue :=Null;
end;


procedure TformSelecEmpenho.butSelecionarClick(Sender: TObject);
begin
//    dmSelecEmpenho.cdSelecEmpenho.First;
//    while not dmSelecEmpenho.cdSelecEmpenho.Eof  do
//    begin
//        if dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').Value = true then
//        begin
//            formEmpenho.gridEstoque;
//        end;
//    end;
end;

procedure TformSelecEmpenho.carregarFoto;
begin
    if FileExists(arquivoPath) then
    begin
        imagem.Picture.LoadFromFile(arquivoPath);
    end
    else
        imagem.Picture.LoadFromFile('C:\Sistema DiaERP\foto.jpg');
end;

procedure TformSelecEmpenho.chkMarcarTodasClick(Sender: TObject);
begin
     if chkMarcarTodas.Checked = true then
     begin
        chkMarcarTodas.Caption :='Desmarcar Todas';

        dmSelecEmpenho.cdSelecEmpenho.First;
        while not dmSelecEmpenho.cdSelecEmpenho.Eof do
        begin
            dmSelecEmpenho.cdSelecEmpenho.Edit;
            dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').Value :=true;
            dmSelecEmpenho.cdSelecEmpenho.Next;
        end;
     end
     else
     begin
        chkMarcarTodas.Caption :='Marcar Todas';
        dmSelecEmpenho.cdSelecEmpenho.First;
        while not dmSelecEmpenho.cdSelecEmpenho.Eof do
        begin
            dmSelecEmpenho.cdSelecEmpenho.Edit;
            dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').Value :=false;
            dmSelecEmpenho.cdSelecEmpenho.Next;
        end;
     end;
end;


procedure TformSelecEmpenho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    dmSelecEmpenho.cdSelecEmpenho.EmptyDataSet;
end;

procedure TformSelecEmpenho.FormShow(Sender: TObject);
begin
    labCOD.Caption          :=formEmpenho.gridArtigo.Fields[3].Value;
    labPROD.Caption         :=formEmpenho.gridArtigo.Fields[7].Value;
    labCor.Caption          :=formEmpenho.gridArtigo.Fields[8].Value;
    labLargura.Caption      :=formEmpenho.gridArtigo.Fields[9].Value;
    labCoRef.Caption        :=formEmpenho.gridArtigo.Fields[10].Value;
    labConsumo.Caption      :=formEmpenho.gridArtigo.Fields[11].Value;

    foto;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+dmSelecEmpenho.qyFoto.FieldByName('cp_nomefoto1').Value;
    carregarFoto;

    with dmSelecEmpenho.qyTecido do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT');
        SQL.Add('   e.es_id,');
        SQL.Add('   cc.comp_nome,');
        SQL.Add('   cp.cp_descricao,');
        SQL.Add('   CAST(COALESCE(gc.grc_codexterno, '''') ||'' - '' || TRIM(gc.grc_nome)AS character varying(18)) AS grc_nome,');
        SQL.Add('   gt.grt_nome,');
        SQL.Add('   (');
        SQL.Add('         (');
        SQL.Add('               COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
        SQL.Add('               COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
        SQL.Add('         ) -');
        SQL.Add('         (');
        SQL.Add('               COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
        SQL.Add('         ) -');
        SQL.Add('         (');
        SQL.Add('               COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
        SQL.Add('         )');
        SQL.Add('   )AS disponivel,');
        SQL.Add('   e.es_numrolo,');
        SQL.Add('   CAST((igf.ig_quantidade || '' '' ||  cp.cp_unestoque) AS character varying(18)) AS entrada_em_metro,');
        SQL.Add('   COALESCE(e.es_custoatual, 0) AS es_custoatual,');
        SQL.Add('   f.for_nome,');
        SQL.Add('   f.for_apelido,');
        SQL.Add('   (false) AS selected_item');
        SQL.Add('   FROM estoque AS e');
        SQL.Add('   JOIN cadastro_produto AS cp ON e.es_codproduto = cp.cp_id');
        SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = e.es_idgradecor');
        SQL.Add('   JOIN grade_tamanho AS gt ON gt.grt_id = e.es_idgradetam');
        SQL.Add('   LEFT JOIN itens_grade_nfentrada AS igf ON igf.ig_codproduto=cp.cp_id');
        SQL.Add('   AND igf.ig_gradecor=gc.grc_id');
        SQL.Add('   AND igf.ig_gradetam=gt.grt_id');
        SQL.Add('   AND igf.ig_numrolo=e.es_numrolo');
        SQL.Add('   AND igf.ig_metragemrolo=e.es_metragemrolo');
        SQL.Add('   LEFT JOIN nota_fiscal_entrada AS nfe ON igf.ig_idnfent=nfe.nfe_id');
        SQL.Add('   LEFT JOIN cadastro_compradores AS cc ON cc.comp_id = igf.ig_idcomprador');
        SQL.Add('   LEFT JOIN fornecedor AS f ON f.for_codigo = nfe.nfe_codforn');
        SQL.Add('   LEFT JOIN itens_xml AS ixml ON ixml.pnfe_idnfe=nfe.nfe_id');
        SQL.Add('   AND ixml.pnfe_coditem=igf.ig_codproduto');
        SQL.Add('   WHERE gc.grc_id = :idCor');
        SQL.Add('   AND cp.cp_id = :idTecido');
        SQL.Add('   AND');
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
        SQL.Add('           ) > 0');
        SQL.Add(' ORDER BY e.es_numrolo, disponivel ASC');

        ParamByName('idCor').AsInteger      :=dmEmpenho.qyArtigoEmpenho.FieldByName('grc_id').Value;
        ParamByName('idTecido').AsInteger   :=dmEmpenho.qyArtigoEmpenho.FieldByName('cp_id').Value;
        Open;
    end;

    gridSelecEmpenho.Columns[0].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[0].Title.Caption             :='Estoque';
    gridSelecEmpenho.Columns[0].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[1].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[1].Title.Caption             :='Comprador';
    gridSelecEmpenho.Columns[1].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[2].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[2].Title.Caption             :='Produto';
    gridSelecEmpenho.Columns[2].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[3].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[3].Title.Caption             :='Cor';
    gridSelecEmpenho.Columns[3].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[4].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[4].Title.Caption             :='Largura';
    gridSelecEmpenho.Columns[4].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[5].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[5].Title.Caption             :='Dispon�vel';
    gridSelecEmpenho.Columns[5].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[6].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[6].Title.Caption             :='N� Rolo';
    gridSelecEmpenho.Columns[6].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[7].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[7].Title.Caption             :='Entrada Fornecedor';
    gridSelecEmpenho.Columns[7].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[8].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[8].Title.Caption             :='Custo';
    gridSelecEmpenho.Columns[8].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[9].Title.Alignment           :=taCenter;
    gridSelecEmpenho.Columns[9].Title.Caption             :='Raz�o Social';
    gridSelecEmpenho.Columns[9].Title.Font.Style          :=[fsBold];
    gridSelecEmpenho.Columns[10].Title.Alignment          :=taCenter;
    gridSelecEmpenho.Columns[10].Title.Caption            :='Nome Fantasia';
    gridSelecEmpenho.Columns[10].Title.Font.Style         :=[fsBold];
    gridSelecEmpenho.Columns[11].Visible                  :=false;


    dmSelecEmpenho.qyTecido.First;
    while not dmSelecEmpenho.qyTecido.eof do
    begin
        dmSelecEmpenho.cdSelecEmpenho.Open();
        dmSelecEmpenho.cdSelecEmpenho.Append;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('es_id').AsInteger                         :=dmSelecEmpenho.qyTecido.FieldByName('es_id').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('comp_nome').AsString                      :=dmSelecEmpenho.qyTecido.FieldByName('comp_nome').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('cp_descricao').AsString                   :=dmSelecEmpenho.qyTecido.FieldByName('cp_descricao').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('grc_nome').AsString                       :=dmSelecEmpenho.qyTecido.FieldByName('grc_nome').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('grt_nome').AsString                       :=dmSelecEmpenho.qyTecido.FieldByName('grt_nome').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('disponivel').AsFloat                      :=dmSelecEmpenho.qyTecido.FieldByName('disponivel').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('es_numrolo').AsString                     :=dmSelecEmpenho.qyTecido.FieldByName('es_numrolo').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('entrada_em_metro').AsString               :=dmSelecEmpenho.qyTecido.FieldByName('es_numrolo').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('es_custoatual').AsFloat                   :=dmSelecEmpenho.qyTecido.FieldByName('es_custoatual').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('for_nome').AsString                       :=dmSelecEmpenho.qyTecido.FieldByName('for_nome').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('for_apelido').AsString                    :=dmSelecEmpenho.qyTecido.FieldByName('for_apelido').Value;
        dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').AsBoolean                 :=dmSelecEmpenho.qyTecido.FieldByName('selected_item').Value;
        dmSelecEmpenho.cdSelecEmpenho.Post;
        dmSelecEmpenho.qyTecido.Next;
    end;
    dmSelecEmpenho.cdSelecEmpenho.First;
end;

procedure TformSelecEmpenho.foto;
begin
    with dmSelecEmpenho.qyFoto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT cp_nomefoto1 FROM cadastro_produto');
        SQL.Add('   WHERE cp_id = :idProduto');
        ParamByName('idProduto').AsInteger := strtoint(formEmpenho.gridArtigo.Fields[3].Value);
        Open;
    end;
end;

procedure TformSelecEmpenho.gridSelecEmpenhoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
    inherited;
    if ((Sender as TDBGrid).DataSource.Dataset.IsEmpty) then
    exit;

    if Column.FieldName = 'selected_item' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);

      if ((Sender as TDBGrid).DataSource.Dataset.FieldByName('selected_item').AsBoolean = true) then
        Check := DFCS_CHECKED
      else
        Check := 0;

      R := Rect;
      InflateRect(R, -2, -2); { Diminue o tamanho do CheckBox }
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON,
        DFCS_BUTTONCHECK or Check);
    end;

    inherited;
    if dmSelecEmpenho.cdSelecEmpenho.IsEmpty then
       exit;

    if dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').Value = true then
        gridSelecEmpenho.Canvas.Brush.Color :=clYellow
    else
        gridSelecEmpenho.Canvas.Brush.Color :=clWhite;


    gridSelecEmpenho.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TformSelecEmpenho.gridSelecEmpenhoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #32 then
    begin
        if dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').Value = false then
        begin
            dmSelecEmpenho.cdSelecEmpenho.Edit;
            dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').Value :=true;
        end
        else
        begin
            dmSelecEmpenho.cdSelecEmpenho.Edit;
            dmSelecEmpenho.cdSelecEmpenho.FieldByName('selected_item').Value :=false;
        end;
    end;
end;

end.
