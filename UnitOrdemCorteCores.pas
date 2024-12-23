unit UnitOrdemCorteCores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Stan.Def,FireDAC.Stan.Pool,FireDAC.Stan.Async,FireDAC.Phys,FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,FireDAC.VCLUI.Wait,FireDAC.Comp.UI,FireDAC.Comp.Client,
  FireDAC.Phys.MSAcc,FireDAC.Phys.MSAccDef,FireDAC.Stan.Param,
  FireDAC.DatS,FireDAC.DApt.Intf,FireDAC.DApt,FireDAC.Comp.DataSet;

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
    butFecharCores: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure butAddClick(Sender: TObject);
    procedure butAddTodasClick(Sender: TObject);
    procedure butRetirarClick(Sender: TObject);
    procedure butRetirarTodasClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure butFecharCoresClick(Sender: TObject);
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
  UnitHistoricOrdem, UnitPrincipal, UnitProdutoAcabado, UnitPrevisto;

procedure TformOrdemCorteCores.butAddClick(Sender: TObject);
begin
    with dmOrdemCorte.qyIdCorte do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT oc_id FROM ordem_corte ORDER BY oc_id DESC LIMIT 1');
        Open;
    end;

      if not dmOrdemCorte.qyCores.IsEmpty then
      begin
           dmOrdemCorte.tbCorteCores.Open();
           dmOrdemCorte.tbCorteCores.Append;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idordemcorte').AsInteger := dmOrdemCorte.qyIdCorte.FieldByName('oc_id').AsInteger;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idcor').AsInteger := strtoint(gridCoresReferencia.Fields[0].AsString);
           dmOrdemCorte.tbCorteCores.FieldByName('occ_data').AsDateTime := now;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idusuario').AsInteger := strtoInt(formPrincipal.labCodUsuario.Caption);
           dmOrdemCorte.tbCorteCores.FieldByName('occ_status').AsBoolean := true;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_fezreserva').AsBoolean := false;
           dmOrdemCorte.tbCorteCores.Post;
           dmOrdemCorte.qyCores.Refresh;
           dmOrdemCorte.qyCoresNoCorte.Refresh;
           Application.MessageBox('Cor adicionada com sucesso!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION + MB_APPLMODAL);
      end
      else
          Application.MessageBox('N�o h� cores para adicionar!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION);

end;

procedure TformOrdemCorteCores.butAddTodasClick(Sender: TObject);
begin
      if dmOrdemCorte.qyCores.IsEmpty then
      begin
         Application.MessageBox('N�o h� cores para adicionar!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION);
         exit;
      end
      else

      while not dmOrdemCorte.qyCores.IsEmpty do
      begin
           dmOrdemCorte.tbCorteCores.Open();
           dmOrdemCorte.tbCorteCores.Append;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idordemcorte').AsInteger := dmOrdemCorte.qyIdCorte.FieldByName('oc_id').AsInteger;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idcor').Value := strtoint(gridCoresReferencia.Fields[0].Value);
           dmOrdemCorte.tbCorteCores.FieldByName('occ_data').Value := now;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_idusuario').Value := 16;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_status').Value := true;
           dmOrdemCorte.tbCorteCores.FieldByName('occ_fezreserva').Value := true;
           dmOrdemCorte.tbCorteCores.Post;
           dmOrdemCorte.qyCores.Refresh;
           dmOrdemCorte.qyCoresNoCorte.Refresh;
      end;
      Application.MessageBox('Cores adicionadas com sucesso!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION);
end;

procedure TformOrdemCorteCores.butFecharCoresClick(Sender: TObject);
begin
      if dmOrdemCorte.qyCoresNoCorte.IsEmpty then
         Application.MessageBox('Escolha no m�nimo uma cor!','Cores no Corte', MB_OK + MB_ICONINFORMATION)
      else
          formOrdemCorteCores.Close;
end;

procedure TformOrdemCorteCores.butRetirarClick(Sender: TObject);
begin
    if not dmOrdemCorte.qyCoresNoCorte.IsEmpty then
    begin
        with application do
        begin
            if MessageBox('Caso haja um corte previsto para esta cor, ser� removido tamb�m. Deseja realmente concluir o procedimento?', 'Ordem Corte', MB_ICONQUESTION + MB_YESNO) = IDYES then
            with dmOrdemCorte.tbCorteCores do
            begin
                Close;
                SQL.Clear;
                SQL.Add('DELETE FROM ordem_corte_cores');
                SQL.Add(' WHERE occ_idordemcorte = :corte AND occ_idcor = :cor');
                ParamByName('corte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
                ParamByName('cor').AsInteger := strtoint(gridCoresCorte.Fields[0].Value);
                ExecSQL;
                dmOrdemCorte.qyCores.Refresh;
                dmOrdemCorte.qyCoresNoCorte.Refresh;
                Application.MessageBox('Cor removida com sucesso!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION);
            end;
        end;
    end
    else
        Application.MessageBox('N�o h� cores para retirar!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION);
end;

procedure TformOrdemCorteCores.butRetirarTodasClick(Sender: TObject);
begin
       if dmOrdemCorte.qyCoresNoCorte.IsEmpty then
      begin
         Application.MessageBox('N�o h� cores para retirar!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION);
         exit;
      end;
      while not dmOrdemCorte.qyCoresNoCorte.IsEmpty do
      begin
          with dmOrdemCorte.tbCorteCores do
          begin
              Close;
              SQL.Clear;
              SQL.Add('DELETE FROM ordem_corte_cores');
              SQL.Add(' WHERE occ_idordemcorte = :corte AND occ_idcor = :cor');
              ParamByName('corte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
              ParamByName('cor').AsInteger := strtoint(gridCoresCorte.Fields[0].Value);
              ExecSQL;
              dmOrdemCorte.qyCores.Refresh;
              dmOrdemCorte.qyCoresNoCorte.Refresh;
          end;
      end;
      Application.MessageBox('Cores removidas com sucesso!', 'Cores no Corte', MB_OK + MB_ICONINFORMATION);
end;

procedure TformOrdemCorteCores.FormCreate(Sender: TObject);
begin
      SetWindowLong(formOrdemCorteCores.Handle, GWL_STYLE, GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION);
      Height := ClientHeight;
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
