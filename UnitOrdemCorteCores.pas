unit UnitOrdemCorteCores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TformOrdemCorteCores = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    gridCoresReferencia: TDBGrid;
    gridCoresCorte: TDBGrid;
    butAdd: TBitBtn;
    butAddTodas: TBitBtn;
    butRetirar: TBitBtn;
    butRetirarTodas: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure butAddClick(Sender: TObject);
    procedure butAddTodasClick(Sender: TObject);
    procedure butRetirarClick(Sender: TObject);
    procedure butRetirarTodasClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOrdemCorteCores: TformOrdemCorteCores;

implementation

{$R *.dfm}

uses UnitIniciarCorte, UnitDatamodule, UnitDMHistoricOrdem,
  UnitHistoricOrdem, UnitPrincipal, UnitProdutoAcabado;

procedure TformOrdemCorteCores.butAddClick(Sender: TObject);
begin
      if not dmOrdemCorte.qyCores.IsEmpty then
      begin
           dmOrdemCorte.tbCorteCores.Open();
           dmOrdemCorte.tbCorteCores.Append;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idordemcorte').Value := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idcor').Value := strtoint(gridCoresReferencia.Fields[0].Value);
           dmOrdemCorte.tbCorteCores.FieldByName('occ_data').Value := now;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idusuario').Value := 16;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_status').Value := true;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_fezreserva').Value := true;
           dmOrdemCorte.tbCorteCores.Post;
           dmOrdemCorte.qyCores.Refresh;
           dmOrdemCorte.qyCoresNoCorte.Refresh;
           Application.MessageBox('Cor adicionada com sucesso!', 'Cores no Corte', mb_iconexclamation + mb_ok + mb_applmodal);
      end
      else
          Application.MessageBox('N�o h� cores para adicionar!', 'Cores no Corte', mb_ok + mb_iconexclamation);

end;

procedure TformOrdemCorteCores.butAddTodasClick(Sender: TObject);
begin
      Application.MessageBox('Adicionar todas ativado!', 'Cores no Corte', mb_ok + mb_iconexclamation);
end;

procedure TformOrdemCorteCores.butRetirarClick(Sender: TObject);
begin
      Application.MessageBox('Retirar clicado', 'Cores no Corte', mb_ok + mb_iconexclamation);
end;

procedure TformOrdemCorteCores.butRetirarTodasClick(Sender: TObject);
begin
      Application.MessageBox('Retirar todas', 'Cores no Corte', mb_ok + mb_iconexclamation);
end;

procedure TformOrdemCorteCores.FormResize(Sender: TObject);
begin
      formPrincipal.dimensionarGrid(gridCoresReferencia);
      formPrincipal.dimensionarGrid(gridCoresCorte);
end;

procedure TformOrdemCorteCores.FormShow(Sender: TObject);
begin
      With dmOrdemCorte.qyCores do
      begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT gc.grc_id, gc.grc_codexterno, gc.grc_nome, gc.grc_sigla');
				    SQL.Add('   FROM ficha_tecnica_itens AS fti');
				    SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = fti.fti_cortecidoidgrade');
				    SQL.Add('WHERE fti.fti_idfichatec = :ficha');
            SQL.Add('AND fti.fti_status<>''C''');
            SQL.Add('AND NOT EXISTS (');
            SQL.Add('   SELECT * FROM ordem_corte_cores AS occ');
            SQL.Add('   WHERE occ.occ_idordemcorte = :ordemCorte AND gc.grc_id = occ.occ_idcor');
            SQL.Add(')');
            SQL.Add('AND NOT EXISTS (');
            SQL.Add('   SELECT * FROM ordem_corte_itens_previsto AS oci');
            SQL.Add('   WHERE oci.oci_idocorte = :ordemCorte AND gc.grc_id = oci.oci_idgradecorprodutoacabado');
            SQL.Add(')');
            SQL.Add('GROUP BY ');
            SQL.Add('   gc.grc_id, gc.grc_codexterno, gc.grc_nome, gc.grc_sigla');
            ParamByName('ficha').AsInteger := strtoint(formIniciarCorte.editFicha.Text);
            ParamByName('ordemCorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            Open;
      end;
      gridCoresReferencia.Columns[0].Title.Caption := 'Codigo';
      gridCoresReferencia.Columns[0].Title.Font.Style := [fsBold];
      gridCoresReferencia.Columns[1].Title.Caption := 'Cod Uso';
      gridCoresReferencia.Columns[1].Title.Font.Style := [fsBold];
      gridCoresReferencia.Columns[2].Title.Caption := 'COR';
      gridCoresReferencia.Columns[2].Title.Font.Style := [fsBold];
      gridCoresReferencia.Columns[3].Title.Caption := 'Sigla';
      gridCoresReferencia.Columns[3].Title.Font.Style := [fsBold];

      With dmOrdemCorte.qyCoresNoCorte do
      begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT gc.grc_id, gc.grc_codexterno, gc.grc_nome, gc.grc_sigla');
            SQL.Add('   FROM ordem_corte_cores AS occ');
            SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = occ.occ_idcor');
            SQL.Add('   WHERE occ_idordemcorte = :ordemCorte');
            ParamByName('ordemCorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            Open;
      end;
      gridCoresCorte.Columns[0].Title.Caption := 'Codigo';
      gridCoresCorte.Columns[0].Title.Font.Style := [fsBold];
      gridCoresCorte.Columns[1].Title.Caption := 'Cod Uso';
      gridCoresCorte.Columns[1].Title.Font.Style := [fsBold];
      gridCoresCorte.Columns[2].Title.Caption := 'COR';
      gridCoresCorte.Columns[2].Title.Font.Style := [fsBold];
      gridCoresCorte.Columns[3].Title.Caption := 'Sigla';
      gridCoresCorte.Columns[3].Title.Font.Style := [fsBold];
end;

end.
