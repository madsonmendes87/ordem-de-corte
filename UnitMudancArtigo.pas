unit UnitMudancArtigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TforMudancArtigo = class(TForm)
    gridMudancArtigo: TDBGrid;
    labMotivo: TLabel;
    editMotivo: TEdit;
    butEscolher: TSpeedButton;
    butSalvar: TSpeedButton;
    labNovoArtigo: TLabel;
    editCodigo: TEdit;
    editProduto: TEdit;
    editCor: TEdit;
    ediTamanho: TEdit;
    procedure butSalvarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butEscolherMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridMudancArtigoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure butEscolherClick(Sender: TObject);
    procedure butSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure delRegistro;
    procedure salvaRegistro;
  end;

var
  forMudancArtigo: TforMudancArtigo;

implementation

{$R *.dfm}

uses UnitDatamodule, UnitPrincipal, UnitSelecionArtigos, UnitPrevisto;

procedure TforMudancArtigo.butEscolherClick(Sender: TObject);
begin
    application.CreateForm(TformSelecionArtigo, formSelecionArtigo);
    formSelecionArtigo.ShowModal;
end;

procedure TforMudancArtigo.butEscolherMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butEscolher.Font.Color:=clNavy;
end;

procedure TforMudancArtigo.butSalvarClick(Sender: TObject);
var
    solicitacao, trocAprovada, trocaReprovada  : string;
begin
    solicitacao:= 'J� EXISTE UMA SOLICITA��O DE MUDAN�A PARA ESTE ARTIGO:' +#13+#13+
          'PRODUTO: '+ gridMudancArtigo.Fields[3].Value+#13+
          'COR: '+ gridMudancArtigo.Fields[4].Value+#13+
          'TAMANHO: '+ gridMudancArtigo.Fields[5].Value+#13+#13+
          'DESEJA SOBRESCREVE-LO?';

    trocAprovada:= 'J� HOUVE UMA TROCA PARA ESTE ARTIGO:' +#13+#13+
          'PRODUTO: '+ gridMudancArtigo.Fields[3].Value+#13+
          'COR: '+ gridMudancArtigo.Fields[4].Value+#13+
          'TAMANHO: '+ gridMudancArtigo.Fields[5].Value+#13+#13+
          'DESEJA REALMENTE CONTINUAR O PROCEDIMENTO?';

    trocaReprovada:= 'J� HOUVE UMA TROCA PARA ESTE ARTIGO:' +#13+#13+
          'PRODUTO: '+ gridMudancArtigo.Fields[3].Value+#13+
          'COR: '+ gridMudancArtigo.Fields[4].Value+#13+
          'TAMANHO: '+ gridMudancArtigo.Fields[5].Value+#13+#13+
          'POREM FOI REPROVADA. DESEJA REALMENTE CONTINUAR O PROCEDIMENTO?';


    if editCodigo.Text = '' then
    begin
        Application.MessageBox('Informe o artigo para substitui��o!', 'Aten��o',MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    if editMotivo.Text = '' then
    begin
        Application.MessageBox('Informe o motivo da mudan�a!','Aten��o', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    with dmOrdemCorte.qyEstilistaFicha do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM usuario AS u');
        SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_idestilista = u.us_codestilista');
        SQL.Add('   WHERE ft.fi_id = :ficha');

        ParamByName('ficha').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
        Open;
    end;

    with dmOrdemCorte.qyTemSolicTroca do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM producao_troca_item');
        SQL.Add('   WHERE');
        SQL.Add('   pti_iditemcorteprevisto = :itemPrevisto');

        ParamByName('itemPrevisto').AsInteger:=strtoint(gridMudancArtigo.Fields[6].Value);
        Open;
    end;

    if dmOrdemCorte.qyTemSolicTroca.RecordCount > 0 then
    begin
        if dmOrdemCorte.qyTemSolicTroca.FieldByName('pti_status').Value = 'E' then
        begin
            with application do
            begin
                 if MessageBox(PCHar(solicitacao), 'Aten��o', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                 begin
                    delRegistro;
                 end;
            end;
        end;

        if dmOrdemCorte.qyTemSolicTroca.FieldByName('pti_status').Value = 'A' then
        begin
            with application do
            begin
                 if MessageBox(PCHar(trocAprovada), 'Aten��o', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                 begin
                    delRegistro;
                 end;
            end;
        end;

        if dmOrdemCorte.qyTemSolicTroca.FieldByName('pti_status').Value = 'R' then
        begin
            with application do
            begin
                 if MessageBox(PCHar(trocaReprovada), 'Aten��o', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                 begin
                    delRegistro;
                 end;
            end;
        end;
    end
    else
        ShowMessage('Passou das verifica��es');


end;

procedure TforMudancArtigo.butSalvarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butSalvar.Font.Color:=clGreen;
end;

procedure TforMudancArtigo.delRegistro;
begin
    with dmOrdemCorte.qySelecArtigoDel do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM producao_troca_item WHERE pti_iditemcorteprevisto = :idPrevisto');
        ParamByName('idPrevisto').AsInteger :=gridMudancArtigo.Fields[6].Value;
        Open;
    end;

    Try

        formPrincipal.IniciaTransacao;

        with dmOrdemCorte.qyDelItemReserva do
        begin
             Close;
             SQL.Clear;
             SQL.Add('DELETE FROM producao_troca_item_reserva WHERE ptir_iditemtroca = :idItemTroca');
             ParamByName('idItemTroca').AsInteger :=dmOrdemCorte.qySelecArtigoDel.FieldByName('pti_id').Value;
             ExecSQL;
        end;

        formPrincipal.ComitaTransacao;

    except
          on E: exception do
          begin
               formPrincipal.DesfazTransacao;
               Application.MessageBox(pchar('Erro ao executar procedimento.'+E.Message),'Erro', MB_ICONERROR);
               Exit;
          end;
    end;

     Try

        formPrincipal.IniciaTransacao;


        with dmOrdemCorte.qyDeletArtigo do
        begin
             Close;
             SQL.Clear;
             SQL.Add('DELETE FROM producao_troca_item WHERE pti_iditemcorteprevisto = :idPrevisto');
             ParamByName('idPrevisto').AsInteger :=gridMudancArtigo.Fields[6].Value;
             ExecSQL;
        end;

        formPrincipal.ComitaTransacao;
        Application.MessageBox('Registro realizado com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);

    except
          on E: exception do
          begin
               formPrincipal.DesfazTransacao;
               Application.MessageBox(pchar('Erro ao executar procedimento.'+E.Message),'Erro', MB_ICONERROR);
               Exit;
          end;
    end;

end;

procedure TforMudancArtigo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action :=CaFree;
end;

procedure TforMudancArtigo.FormMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butEscolher.Font.Color:=clWindowText;
    butSalvar.Font.Color:=clWindowText;
end;

procedure TforMudancArtigo.FormShow(Sender: TObject);
begin
    with dmOrdemCorte.qyMudancArtigo do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   cp.cp_id,');
        SQL.Add('   CAST(COALESCE(gc_pa.grc_codexterno, '' '') ||'' - '' || TRIM(gc_pa.grc_nome, '' '') AS character varying(18)) AS grc_nome_pa,');
        SQL.Add('   oci_vlrtotal,');
        SQL.Add('   cp.cp_descricao,');
        SQL.Add('   CAST(COALESCE(gc.grc_codexterno, '' '') ||'' - '' || TRIM(gc.grc_nome)AS character varying(18)) AS grc_nome,');
        SQL.Add('   gt.grt_nome,');
        SQL.Add('   oci.oci_id, oci.oci_tecido, oci.oci_tipo, gc.grc_id, gt.grt_id');
        SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
        SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id');
        SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
        SQL.Add('   JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
        SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
        SQL.Add('   WHERE oci.oci_idocorte = :corte AND oci.oci_situacao_id<>''2''');
        SQL.Add('   ORDER BY CASE WHEN oci_tecido = true THEN 0 ELSE 1  END, oci.oci_idcortecido, oci.oci_tipo ASC');

        ParamByName('corte').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
    end;

    gridMudancArtigo.Columns[0].Title.Alignment:=taCenter;
    gridMudancArtigo.Columns[0].Title.Caption:='C�digo';
    gridMudancArtigo.Columns[0].Title.Font.Style     :=[fsBold];
    gridMudancArtigo.Columns[1].Title.Alignment:=taCenter;
    gridMudancArtigo.Columns[1].Title.Caption:='Cor do Produto Acabado';
    gridMudancArtigo.Columns[1].Title.Font.Style     :=[fsBold];
    gridMudancArtigo.Columns[2].Title.Alignment:=taCenter;
    gridMudancArtigo.Columns[2].Title.Caption:='Consumo';
    gridMudancArtigo.Columns[2].Title.Font.Style     :=[fsBold];
    gridMudancArtigo.Columns[3].Title.Alignment:=taCenter;
    gridMudancArtigo.Columns[3].Title.Caption:='Produto';
    gridMudancArtigo.Columns[3].Title.Font.Style     :=[fsBold];
    gridMudancArtigo.Columns[4].Title.Alignment:=taCenter;
    gridMudancArtigo.Columns[4].Title.Caption:='Cor';
    gridMudancArtigo.Columns[4].Title.Font.Style     :=[fsBold];
    gridMudancArtigo.Columns[5].Title.Alignment:=taCenter;
    gridMudancArtigo.Columns[5].Title.Caption:='Tamanho/Largura';
    gridMudancArtigo.Columns[5].Title.Font.Style     :=[fsBold];
    gridMudancArtigo.Columns[6].Title.Alignment:=taCenter;
    gridMudancArtigo.Columns[6].Title.Caption:='Item Previsto';
    gridMudancArtigo.Columns[6].Title.Font.Style     :=[fsBold];
    gridMudancArtigo.Columns[7].Visible:=false;
    gridMudancArtigo.Columns[8].Visible:=false;
    gridMudancArtigo.Columns[9].Visible:=false;
    gridMudancArtigo.Columns[10].Visible:=false;
end;

procedure TforMudancArtigo.gridMudancArtigoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if dmOrdemCorte.qyMudancArtigo.FieldByName('oci_tipo').Value = 'P' then
      gridMudancArtigo.Canvas.Font.Color := clBlue
    else
      if dmOrdemCorte.qyMudancArtigo.FieldByName('oci_tecido').Value = true then
         gridMudancArtigo.Canvas.Font.Color := clGreen;

    gridMudancArtigo.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TforMudancArtigo.salvaRegistro;
begin
    //Insere na tabela producao_troca_item
    Try

        formPrincipal.IniciaTransacao;

        with dmOrdemCorte.qyDelItemReserva do
        begin
             Close;
             SQL.Clear;
             SQL.Add('INSERT INTO producao_troca_item (');
             SQL.Add('    pti_idfichatecnica, pti_idprodutoretirar, pti_idgradecor_retirar, pti_idgradetam_retirar, pti_idproduto_adicionar');
             SQL.Add('    pti_idgradecor_adiciomar, pti_idgradetam_adicionar, pti_idusuariosolicitacao, pti_motivosolicitacao, pti_dtsolicitacao');
             ParamByName('idItemTroca').AsInteger :=dmOrdemCorte.qySelecArtigoDel.FieldByName('pti_id').Value;
             ExecSQL;
        end;

        formPrincipal.ComitaTransacao;

    except
          on E: exception do
          begin
               formPrincipal.DesfazTransacao;
               Application.MessageBox(pchar('Erro ao executar procedimento.'+E.Message),'Erro', MB_ICONERROR);
               Exit;
          end;
    end;

    //Insere na tabela producao_troca_item_reserva
     Try

        formPrincipal.IniciaTransacao;


        with dmOrdemCorte.qyDeletArtigo do
        begin
             Close;
             SQL.Clear;
             SQL.Add('DELETE FROM producao_troca_item WHERE pti_iditemcorteprevisto = :idPrevisto');
             ParamByName('idPrevisto').AsInteger :=gridMudancArtigo.Fields[6].Value;
             ExecSQL;
        end;

        formPrincipal.ComitaTransacao;
        Application.MessageBox('Registro realizado com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);

    except
          on E: exception do
          begin
               formPrincipal.DesfazTransacao;
               Application.MessageBox(pchar('Erro ao executar procedimento.'+E.Message),'Erro', MB_ICONERROR);
               Exit;
          end;
    end;
end;

end.
