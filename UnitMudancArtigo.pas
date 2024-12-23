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
    labIdTam: TLabel;
    labIdCor: TLabel;
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

uses UnitDatamodule, UnitPrincipal, UnitSelecionArtigos, UnitPrevisto,
unitDMMudancArtigo;

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

    with dmMudancArtigo.qyEstilistaFicha do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM usuario AS u');
        SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_idestilista = u.us_codestilista');
        SQL.Add('   WHERE ft.fi_id = :ficha');

        ParamByName('ficha').AsInteger:=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
        Open;
    end;

    with dmMudancArtigo.qyTemSolicTroca do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM producao_troca_item');
        SQL.Add('   WHERE');
        SQL.Add('   pti_iditemcorteprevisto = :itemPrevisto');

        ParamByName('itemPrevisto').AsInteger:=strtoint(gridMudancArtigo.Fields[6].Value);
        Open;
    end;

    if dmMudancArtigo.qyTemSolicTroca.RecordCount > 0 then
    begin
        if dmMudancArtigo.qyTemSolicTroca.FieldByName('pti_status').Value = 'E' then
        begin
            with application do
            begin
                 if MessageBox(PCHar(solicitacao), 'Aten��o', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                 begin
                    delRegistro;
                    salvaRegistro;
                 end;
            end;
        end;

        if dmMudancArtigo.qyTemSolicTroca.FieldByName('pti_status').Value = 'A' then
        begin
            with application do
            begin
                 if MessageBox(PCHar(trocAprovada), 'Aten��o', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                 begin
                    delRegistro;
                    salvaRegistro;
                 end;
            end;
        end;

        if dmMudancArtigo.qyTemSolicTroca.FieldByName('pti_status').Value = 'R' then
        begin
            with application do
            begin
                 if MessageBox(PCHar(trocaReprovada), 'Aten��o', MB_ICONQUESTION + MB_YESNO + MB_APPLMODAL) = IDYES then
                 begin
                    delRegistro;
                    salvaRegistro;
                 end;
            end;
        end;
    end
    else
       salvaRegistro;
end;

procedure TforMudancArtigo.butSalvarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butSalvar.Font.Color:=clGreen;
end;

procedure TforMudancArtigo.delRegistro;
begin
    with dmMudancArtigo.qySelecArtigoDel do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM producao_troca_item WHERE pti_iditemcorteprevisto = :idPrevisto');
        ParamByName('idPrevisto').AsInteger :=gridMudancArtigo.Fields[6].Value;
        Open;
    end;

    Try

        formPrincipal.IniciaTransacao;

        with dmMudancArtigo.qyDelItemReserva do
        begin
             Close;
             SQL.Clear;
             SQL.Add('DELETE FROM producao_troca_item_reserva WHERE ptir_iditemtroca = :idItemTroca');
             ParamByName('idItemTroca').AsInteger :=dmMudancArtigo.qySelecArtigoDel.FieldByName('pti_id').Value;
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


        with dmMudancArtigo.qyDeletArtigo do
        begin
             Close;
             SQL.Clear;
             SQL.Add('DELETE FROM producao_troca_item WHERE pti_iditemcorteprevisto = :idPrevisto');
             ParamByName('idPrevisto').AsInteger :=gridMudancArtigo.Fields[6].Value;
             ExecSQL;
        end;

        formPrincipal.ComitaTransacao;
        //Application.MessageBox('Registro realizado com sucesso!', 'Ordem de Corte', MB_OK + MB_ICONINFORMATION);

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
    with dmMudancArtigo.qyMudancArtigo do
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
    if dmMudancArtigo.qyMudancArtigo.FieldByName('oci_tipo').Value = 'P' then
      gridMudancArtigo.Canvas.Font.Color := clBlue
    else
      if dmMudancArtigo.qyMudancArtigo.FieldByName('oci_tecido').Value = true then
         gridMudancArtigo.Canvas.Font.Color := clGreen;

    gridMudancArtigo.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TforMudancArtigo.salvaRegistro;
begin
    with dmMudancArtigo.qyETecidoCorProd do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   oci.oci_id, oci.oci_tecido, gc_pa.grc_id');
        SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
        SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
        SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
        SQL.Add('WHERE oci.oci_id = :idPrevisto AND oci.oci_situacao_id<>''2''');

        ParamByName('idPrevisto').AsInteger :=strtoint(gridMudancArtigo.Fields[6].Value);
        Open;
    end;

    //Insere na tabela producao_troca_item

    Try

        formPrincipal.IniciaTransacao;

        with dmMudancArtigo.qyInserirTrocaItem do
        begin
             Close;
             SQL.Clear;
             SQL.Add('INSERT INTO producao_troca_item (');
             SQL.Add('    pti_idfichatecnica, pti_idproduto_retirar, pti_idgradecor_retirar, pti_idgradetam_retirar, pti_idproduto_adicionar,');
             SQL.Add('    pti_idgradecor_adicionar, pti_idgradetam_adicionar, pti_idusuariosolicitacao, pti_motivosolicitacao, pti_dtsolicitacao,');
             SQL.Add('    pti_idusuarioconfirmacao, pti_status, pti_prototipo, pti_consumototal, pti_tecido, pti_idgradecorprodutoacabado,');
             SQL.Add('    pti_iditemcorteprevisto, pti_marcacao)');
             SQL.Add('VALUES(');
             SQL.Add('    :fichaTecnica, :idProdutoRetirar, :idCoRetirar, :idTamRetirar, :idProdutoAdd, :idCorAdd, :idTamAdd, :idUsuarioSol, :motivoSol,');
             SQL.Add('    :dataSol, :idUsuarioConf, :status, :eprototipo, :consumoTotal, :etecido, :idCorProdAcabado, :itemCortePrevisto, :marcacao)');

             ParamByName('fichaTecnica').AsInteger            :=strtoint(formPrincipal.gridOrdem.Fields[5].Value);
             ParamByName('idProdutoRetirar').AsInteger        :=strtoint(gridMudancArtigo.Fields[0].Value);
             ParamByName('idCoRetirar').AsInteger             :=dmMudancArtigo.qyMudancArtigo.FieldByName('grc_id').Value;
             ParamByName('idTamRetirar').AsInteger            :=dmMudancArtigo.qyMudancArtigo.FieldByName('grt_id').Value;
             ParamByName('idProdutoAdd').AsInteger            :=strtoint(editCodigo.Text);
             ParamByName('idCorAdd').AsInteger                :=strtoint(labIdCor.Caption);
             ParamByName('idTamAdd').AsInteger                :=strtoint(labIdTam.Caption);
             ParamByName('idUsuarioSol').AsInteger            :=strtoint(formPrincipal.labCodUsuario.Caption);
             ParamByName('motivoSol').AsString                :=editMotivo.Text;
             ParamByName('dataSol').AsDateTime                :=now;
             ParamByName('idUsuarioConf').AsInteger           :=dmMudancArtigo.qyEstilistaFicha.FieldByName('us_id').Value;
             ParamByName('status').AsString                   :='E';    //Inicia com status: EM ESPERA
             if formPrincipal.gridOrdem.Fields[8].Value = 'Prototipo' then
                ParamByName('eprototipo').AsBoolean           :=true
             else
                ParamByName('eprototipo').AsBoolean           :=false;
             ParamByName('consumoTotal').AsFloat              :=strtofloat(gridMudancArtigo.Fields[2].Value);
             ParamByName('etecido').AsBoolean                 :=dmMudancArtigo.qyETecidoCorProd.FieldByName('oci_tecido').Value;
             ParamByName('idCorProdAcabado').AsInteger        :=dmMudancArtigo.qyETecidoCorProd.FieldByName('grc_id').Value;
             ParamByName('itemCortePrevisto').AsInteger       :=strtoint(gridMudancArtigo.Fields[6].Value);
             ParamByName('marcacao').AsString                 :='N';
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


    // Insere na tabela producao_troca_item_reserva

    with dmMudancArtigo.qyConsumoTroca do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT pti_id, pti_consumototal, pti_prototipo, pti_idgradecor_retirar, pti_idgradetam_retirar,');
        SQL.Add('   pti_idgradecor_adicionar, pti_idgradetam_adicionar');
        SQL.Add('   FROM producao_troca_item ORDER BY pti_id DESC LIMIT 1');
        Open;
    end;

    if dmMudancArtigo.qyConsumoTroca.FieldByName('pti_prototipo').Value = true then
    begin
         with dmMudancArtigo.qyEstoqueSemReserProt do
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

              ParamByName('idCor').AsInteger      :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradecor_adicionar').Value;
              ParamByName('idTamanho').AsInteger  :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradetam_adicionar').Value;;
              ParamByName('idProduto').AsInteger  :=strtoint(editCodigo.Text);
              Open;
         end;

        // Insere linha do artigo adicional
        Try

            formPrincipal.IniciaTransacao;


            with dmMudancArtigo.qyInserirTrocaItemReserva do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('INSERT INTO producao_troca_item_reserva (');
                 SQL.Add('      ptir_iditemtroca, ptir_idestoque, ptir_consumo, ptir_tipo)');
                 SQL.Add('VALUES (');
                 SQL.Add('      :itemTroca, :idEstoque, :consumo, :tipo)');

                 ParamByName('itemTroca').AsInteger     :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_id').Value;
                 ParamByName('idEstoque').AsInteger     :=dmMudancArtigo.qyEstoqueSemReserProt.FieldByName('es_id').Value;
                 ParamByName('consumo').AsFloat         :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_consumototal').Value;
                 ParamByName('tipo').AsString           :='A'; //Adicional
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

        with dmMudancArtigo.qyEstoqueSemReserProt2 do
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

              ParamByName('idCor').AsInteger      :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradecor_retirar').Value;
              ParamByName('idTamanho').AsInteger  :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradetam_retirar').Value;
              ParamByName('idProduto').AsInteger  :=strtoint(gridMudancArtigo.Fields[0].Value);
              Open;
        end;

        // Insere linha do artigo retirada
        Try

            formPrincipal.IniciaTransacao;


            with dmMudancArtigo.qyInserirTrocaItemReserva do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('INSERT INTO producao_troca_item_reserva (');
                 SQL.Add('      ptir_iditemtroca, ptir_idestoque, ptir_consumo, ptir_tipo)');
                 SQL.Add('VALUES (');
                 SQL.Add('      :itemTroca, :idEstoque, :consumo, :tipo)');

                 ParamByName('itemTroca').AsInteger     :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_id').Value;
                 ParamByName('idEstoque').AsInteger     :=dmMudancArtigo.qyEstoqueSemReserProt2.FieldByName('es_id').Value;
                 ParamByName('consumo').AsFloat         :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_consumototal').Value;
                 ParamByName('tipo').AsString           :='R'; //Retirada
                 ExecSQL;
            end;

            formPrincipal.ComitaTransacao;

        except
              on E: exception do
              begin
                   formPrincipal.DesfazTransacao;
                   Application.MessageBox(pchar('Erro ao executar procedimento#.'+E.Message),'Erro', MB_ICONERROR);
                   Exit;
              end;
        end;
    end
    else
    begin
        with dmMudancArtigo.qyEstoqueComReserva do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT DISTINCT');
            SQL.Add('   e.es_id,');
            SQL.Add('   e.es_codloja,');
            SQL.Add('   e.es_codproduto,');
            SQL.Add('   e.es_idgradecor,');
            SQL.Add('   e.es_idgradetam,');
            SQL.Add('   e.es_metragemrolo,');
            SQL.Add('   COALESCE(e.es_custoatual, 0) AS es_custoatual,');
            SQL.Add('   e.es_numrolo,');
            SQL.Add('   cp.cp_descricao,');
            SQL.Add('   gc.grc_nome,');
            SQL.Add('   gt.grt_nome,');
            SQL.Add('   cp.cp_rolopeca,');
            SQL.Add('   (');
            SQL.Add('       (');
            SQL.Add('             COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.0000) +');
            SQL.Add('             COALESCE(e.es_enttransf, 0.0000) - COALESCE(e.es_saidatransf, 0.0000)');
            SQL.Add('       ) -');
            SQL.Add('       (');
            SQL.Add('             COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
            SQL.Add('       ) -');
            SQL.Add('       (');
            SQL.Add('             COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
            SQL.Add('       ) -');
            SQL.Add('       (');
            SQL.Add('             COALESCE(e.es_saidareserva, 0.0000) - COALESCE(e.es_entreserva, 0.0000)');
            SQL.Add('       )');
            SQL.Add('   )AS disponivel');
            SQL.Add('   FROM estoque AS e');
            SQL.Add('   JOIN cadastro_produto AS cp ON e.es_codproduto = cp.cp_id');
            SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = e.es_idgradecor');
            SQL.Add('   JOIN grade_tamanho AS gt ON gt.grt_id = e.es_idgradetam');
            SQL.Add('   WHERE');
            SQL.Add('   gc.grc_id= :idCor');
            SQL.Add('   AND gt.grt_id= :idTamanho');
            SQL.Add('   AND cp.cp_id= :idProduto');
            SQL.Add('   AND');
            SQL.Add('   (');
            SQL.Add('       (');
            SQL.Add('            COALESCE(e.es_entradaforn, 0.0000) - COALESCE(e.es_saidaforn, 0.000) +');
            SQL.Add('            COALESCE(e.es_enttransf, 0.000) - COALESCE(e.es_saidatransf, 0.0000)');
            SQL.Add('       ) -');
            SQL.Add('       (');
            SQL.Add('            COALESCE(e.es_saidaempenho, 0.0000) - COALESCE(e.es_entempenho, 0.0000)');
            SQL.Add('       ) -');
            SQL.Add('       (');
            SQL.Add('            COALESCE(e.es_saidabalanco, 0.0000) - COALESCE(e.es_entbalanco, 0.0000)');
            SQL.Add('       ) -');
            SQL.Add('       (');
            SQL.Add('            COALESCE(e.es_saidareserva, 0.0000) - COALESCE(e.es_entreserva, 0.0000)');
            SQL.Add('       )');
            SQL.Add('   ) > 0');

            ParamByName('idCor').AsInteger      :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradecor_adicionar').Value;
            ParamByName('idTamanho').AsInteger  :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradetam_adicionar').Value;;
            ParamByName('idProduto').AsInteger  :=strtoint(editCodigo.Text);
            Open;
        end;

        // Insere linha do artigo adicional
        Try

            formPrincipal.IniciaTransacao;


            with dmMudancArtigo.qyInserirTrocaItemReserva do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('INSERT INTO producao_troca_item_reserva (');
                 SQL.Add('      ptir_iditemtroca, ptir_idestoque, ptir_consumo, ptir_tipo)');
                 SQL.Add('VALUES (');
                 SQL.Add('      :itemTroca, :idEstoque, :consumo, :tipo)');

                 ParamByName('itemTroca').AsInteger     :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_id').Value;
                 ParamByName('idEstoque').AsInteger     :=dmMudancArtigo.qyEstoqueComReserva.FieldByName('es_id').Value;
                 ParamByName('consumo').AsFloat         :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_consumototal').Value;
                 ParamByName('tipo').AsString           :='A'; //Adicional
                 ExecSQL;
            end;

            formPrincipal.ComitaTransacao;

        except
              on E: exception do
              begin
                   formPrincipal.DesfazTransacao;
                   Application.MessageBox(pchar('Erro ao executar procedimento1.'+E.Message),'Erro', MB_ICONERROR);
                   Exit;
              end;
        end;


        with dmMudancArtigo.qyEstoqueComReserva2 do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT e.es_id FROM estoque AS e');
            SQL.Add('   JOIN cadastro_produto AS cp ON e.es_codproduto = cp.cp_id');
            SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = e.es_idgradecor');
            SQL.Add('   JOIN grade_tamanho AS gt ON gt.grt_id = e.es_idgradetam');
            SQL.Add('   WHERE');
            SQL.Add('   gc.grc_id= :idCor');
            SQL.Add('   AND gt.grt_id= :idTamanho');
            SQL.Add('   AND cp.cp_id= :idProduto');

            ParamByName('idCor').AsInteger      :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradecor_retirar').Value;
            ParamByName('idTamanho').AsInteger  :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_idgradetam_retirar').Value;
            ParamByName('idProduto').AsInteger  :=strtoint(gridMudancArtigo.Fields[0].Value);
            Open;
        end;


        // Insere linha do artigo retirada
        Try

            formPrincipal.IniciaTransacao;


            with dmMudancArtigo.qyInserirTrocaItemReserva do
            begin
                 Close;
                 SQL.Clear;
                 SQL.Add('INSERT INTO producao_troca_item_reserva (');
                 SQL.Add('      ptir_iditemtroca, ptir_idestoque, ptir_consumo, ptir_tipo)');
                 SQL.Add('VALUES (');
                 SQL.Add('      :itemTroca, :idEstoque, :consumo, :tipo)');

                 ParamByName('itemTroca').AsInteger     :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_id').Value;
                 ParamByName('idEstoque').AsInteger     :=dmMudancArtigo.qyEstoqueComReserva2.FieldByName('es_id').Value;
                 ParamByName('consumo').AsFloat         :=dmMudancArtigo.qyConsumoTroca.FieldByName('pti_consumototal').Value;
                 ParamByName('tipo').AsString           :='R'; //Retirada
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

    end;
end;

end.
