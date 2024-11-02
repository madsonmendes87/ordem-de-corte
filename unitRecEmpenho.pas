unit unitRecEmpenho;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, System.Actions, Vcl.ActnList;

type
  TformRecEmpenho = class(TForm)
    panelCabecalho: TPanel;
    butSairRecEmpenho: TSpeedButton;
    labTipo: TLabel;
    labRef: TLabel;
    comboTipo: TComboBox;
    editRef: TEdit;
    chkMarcarReferencia: TCheckBox;
    panelEscolher: TPanel;
    butReceber: TSpeedButton;
    gridRecEmpenho: TDBGrid;
    qyRecEmpenho: TFDQuery;
    dsRecEmpenho: TDataSource;
    qyReferencia: TFDQuery;
    cdsRecEmpenho: TClientDataSet;
    botaoReceber: TActionList;
    atalhoReceber: TAction;
    qyUsuario: TFDQuery;
    qyEmpCorte: TFDQuery;
    qyContEmpenho: TFDQuery;
    qyEstProducao: TFDQuery;
    cdsRecEmpenhoemp_id: TIntegerField;
    cdsRecEmpenhoemp_idestoque: TIntegerField;
    cdsRecEmpenhoemp_codprocesso: TIntegerField;
    cdsRecEmpenhoemp_idempenhoanterior: TIntegerField;
    cdsRecEmpenhoreferencia: TStringField;
    cdsRecEmpenhodescricao_ref: TStringField;
    cdsRecEmpenhoproduto: TStringField;
    cdsRecEmpenhocor: TStringField;
    cdsRecEmpenhotamanho: TStringField;
    cdsRecEmpenhorolo: TStringField;
    cdsRecEmpenhometragem: TFloatField;
    cdsRecEmpenhoconsumo: TFloatField;
    cdsRecEmpenhounidade: TStringField;
    cdsRecEmpenhofase: TStringField;
    cdsRecEmpenhoselected_item: TStringField;
    cdsRecEmpenhoeprototipo: TStringField;
    cdsRecEmpenhoemp_custo: TFloatField;
    cdsRecEmpenhofa_id: TIntegerField;
    procedure butSairRecEmpenhoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridRecEmpenhoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridRecEmpenhoKeyPress(Sender: TObject; var Key: Char);
    procedure chkMarcarReferenciaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure editRefClick(Sender: TObject);
    procedure editRefChange(Sender: TObject);
    procedure butReceberClick(Sender: TObject);
    procedure atalhoReceberExecute(Sender: TObject);
  private
    { Private declarations }
    procedure gridRecEmpenhoClick(Sender: TObject);
    procedure populaCdsRecEmpenho;
  public
    { Public declarations }
  end;

var
  formRecEmpenho: TformRecEmpenho;

implementation

{$R *.dfm}

uses UnitPrincipal, UnitDatamodule;

procedure TformRecEmpenho.atalhoReceberExecute(Sender: TObject);
begin

    if chkMarcarReferencia.Checked = false then
    begin
        Application.MessageBox('Marque a referência que deseja receber!', 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    if cdsRecEmpenho.IsEmpty = true then
    begin
        Application.MessageBox('Não há empenho para receber!', 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
    end;

    with qyUsuario do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT us_recebe_empenho_corte FROM usuario');
        SQL.Add('   WHERE us_id = :cod');

        ParamByName('cod').AsInteger :=strtoint(formPrincipal.labCodUsuario.Caption);
        Open;
    end;

    if qyUsuario.FieldByName('us_recebe_empenho_corte').Value = false then
    begin
        Application.MessageBox('Você não tem permissão para receber empenho!', 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
    end
    else
    begin
          Try

              formPrincipal.IniciaTransacao;

              cdsRecEmpenho.First;
              while not cdsRecEmpenho.eof do
              begin
                  if cdsRecEmpenho.FieldByName('selected_item').Value = true  then
                  begin
                      with qyEmpCorte do
                      begin
                          Close;
                          SQL.Clear;
                          SQL.Add('UPDATE ordem_corte_empenho SET oce_identradaempenho = :emp_id, oce_situacao = :situacao');
                          SQL.Add('   WHERE oce_idsaidaempenho = :empenhoanterior');

                          ParamByName('emp_id').AsInteger             :=strtoint(gridRecEmpenho.Fields[0].Value);
                          ParamByName('situacao').AsString            :='R';
                          ParamByName('empenhoanterior').AsInteger    :=strtoint(gridRecEmpenho.Fields[3].Value);
                          ExecSQL;;
                      end;


                      with qyContEmpenho do
                      begin
                          Close;
                          SQL.Clear;
                          SQL.Add('UPDATE controle_empenho SET emp_situacao = :situacao, emp_dtsaidaent = :data, emp_hrsaidaent = :hora');
                          SQL.Add('   WHERE emp_id = :empenho');

                          ParamByName('situacao').AsString      :='P';
                          ParamByName('data').AsDateTime        :=now;
                          ParamByName('hora').AsTime            :=now;
                          ParamByName('empenho').AsInteger      :=strtoint(gridRecEmpenho.Fields[0].Value);
                          ExecSQL;
                      end;


                      with qyEstProducao do
                      begin
                          Close;
                          SQL.Clear;
                          SQL.Add('INSERT INTO estoque_producao (');
                          SQL.Add('   ep_idfichatecnica, ep_idestoque, ep_custo, ep_idfase, ep_idusuariorecebimento, ep_datarecebimento,');
                          SQL.Add('   ep_situacao, ep_entrada, ep_transfsaida, ep_empenhosaida, ep_empenhoentrada, ep_transfentrada,');
                          SQL.Add('   ep_transfsaidaalmox) ');
                          SQL.Add('VALUES(');
                          SQL.Add('   :ficha, :idestoque, :custo, :fase, :idusuariorecebimento, :dtrecebimento,');
                          SQL.Add('   :situacao, :entrada, :transfsaida, :empenhosaida, :empenhoentrada, :transfentrada,');
                          SQL.Add('   :transfsaidaalmox)');

                          ParamByName('ficha').AsInteger                          :=cdsRecEmpenho.FieldByName('emp_codprocesso').Value;
                          ParamByName('idestoque').AsInteger                      :=cdsRecEmpenho.FieldByName('emp_idestoque').Value;
                          ParamByName('custo').AsFloat                            :=cdsRecEmpenho.FieldByName('emp_custo').Value;
                          ParamByName('fase').AsInteger                           :=cdsRecEmpenho.FieldByName('fa_id').Value;
                          ParamByName('idusuariorecebimento').AsInteger           :=strtoint(formPrincipal.labCodUsuario.Caption);
                          ParamByName('dtrecebimento').AsDateTime                 :=now;
                          ParamByName('situacao').AsString                        :='N';
                          ParamByName('entrada').AsFloat                          :=cdsRecEmpenho.FieldByName('consumo').Value;
                          ParamByName('transfsaida').AsFloat                      :=0;
                          ParamByName('empenhosaida').AsFloat                     :=0;
                          ParamByName('empenhoentrada').AsFloat                   :=0;
                          ParamByName('transfentrada').AsFloat                    :=0;
                          ParamByName('transfsaidaalmox').AsFloat                 :=0;
                          ExecSQL;
                      end;
                  end;
                  cdsRecEmpenho.Next;
              end;
              formPrincipal.ComitaTransacao;
              Application.MessageBox('Empenho recebido com sucesso.','Empenho',MB_OK + MB_ICONINFORMATION);
              qyRecEmpenho.Refresh;
              cdsRecEmpenho.EmptyDataSet;
              populaCdsRecEmpenho;

          except
               on E: exception do
               begin
                 formPrincipal.DesfazTransacao;
                 Application.MessageBox(pchar('Erro ao receber o empenho! '+E.Message),'Erro', MB_ICONERROR);
                 exit;
               end;
          end;
    end;


end;

procedure TformRecEmpenho.butReceberClick(Sender: TObject);
begin
    atalhoReceberExecute(Sender);
end;

procedure TformRecEmpenho.butSairRecEmpenhoClick(Sender: TObject);
begin
    formRecEmpenho.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible :=true;
end;

procedure TformRecEmpenho.chkMarcarReferenciaClick(Sender: TObject);
begin
    if chkMarcarReferencia.Checked = true then
     begin
        chkMarcarReferencia.Caption :='Desmarcar Por Referencia';

        with qyReferencia do
        begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT');
            SQL.Add('   ce.emp_id,');
            SQL.Add('   pa.cad_idreferencia');
            SQL.Add('   FROM controle_empenho AS ce');
            SQL.Add('   JOIN ficha_tecnica AS ft ON ft.fi_id = ce.emp_codprocesso');
            SQL.Add('   JOIN produto_acabado AS pa ON pa.cad_id = ft.fi_idprodutoacabado');
            SQL.Add('   WHERE ce.emp_id = :empenho');

            ParamByName('empenho').AsInteger  :=strtoint(gridRecEmpenho.Fields[0].Value);
            Open;
        end;

        while not cdsRecEmpenho.Eof do
        begin
            if cdsRecEmpenho.FieldByName('referencia').Value = qyReferencia.FieldByName('cad_idreferencia').Value then
            begin
                cdsRecEmpenho.Edit;
                cdsRecEmpenho.FieldByName('selected_item').Value :=true;
            end;
          cdsRecEmpenho.Next;
        end;
        cdsRecEmpenho.First;
    end
    else
    begin
        chkMarcarReferencia.Caption :='Marcar Por Referencia';

        while not cdsRecEmpenho.Eof do
        begin
            if cdsRecEmpenho.FieldByName('referencia').Value = qyReferencia.FieldByName('cad_idreferencia').Value then
            begin
                cdsRecEmpenho.Edit;
                cdsRecEmpenho.FieldByName('selected_item').Value :=false;
            end;
          cdsRecEmpenho.Next;
        end;
        cdsRecEmpenho.First;
    end;
end;

procedure TformRecEmpenho.editRefChange(Sender: TObject);
begin
    if comboTipo.Text = 'PRODUCAO' then
    begin
        with cdsRecEmpenho do
        begin
            Close;
            Filtered  :=False;
            Filter    :='eprototipo LIKE ''False''AND referencia LIKE' + UpperCase(QuotedStr('%'+editRef.Text+'%'));
            Filtered  :=True;
            Open;
        end;
    end
    else
    begin
        with cdsRecEmpenho do
        begin
            Close;
            Filtered  :=False;
            Filter    :='eprototipo LIKE ''True''AND referencia LIKE' + UpperCase(QuotedStr('%'+editRef.Text+'%'));
            Filtered  :=True;
            Open;
        end;
    end;
end;

procedure TformRecEmpenho.editRefClick(Sender: TObject);
begin
    if comboTipo.Text = 'PRODUCAO' then
    begin
        with cdsRecEmpenho do
        begin
            Close;
            Filtered  :=False;
            Filter    :='eprototipo LIKE ''False''';
            Filtered  :=True;
            Open;
        end;
    end
    else
    begin
        with cdsRecEmpenho do
        begin
            Close;
            Filtered  :=False;
            Filter    :='eprototipo LIKE ''True''';
            Filtered  :=True;
            Open;
        end;
    end;
end;


procedure TformRecEmpenho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    cdsRecEmpenho.EmptyDataSet;
end;

procedure TformRecEmpenho.FormCreate(Sender: TObject);
begin
    gridRecEmpenho.ControlStyle    :=gridRecEmpenho.ControlStyle + [csClickEvents];
    TForm(gridRecEmpenho).OnClick  :=gridRecEmpenhoClick;
end;

procedure TformRecEmpenho.FormShow(Sender: TObject);
begin
    panelCabecalho.Caption  :='Recebimento de Empenho de Materiais';

    qyRecEmpenho.Active :=true;


    gridRecEmpenho.Columns[0].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[0].Title.Caption               :='Empenho';
    gridRecEmpenho.Columns[0].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[1].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[1].Title.Caption               :='Estoque';
    gridRecEmpenho.Columns[1].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[2].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[2].Title.Caption               :='Processo';
    gridRecEmpenho.Columns[2].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[3].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[3].Title.Caption               :='Empenho Anterior';
    gridRecEmpenho.Columns[3].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[4].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[4].Title.Caption               :='Referência';
    gridRecEmpenho.Columns[4].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[5].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[5].Title.Caption               :='Descrição Referência';
    gridRecEmpenho.Columns[5].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[6].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[6].Title.Caption               :='Produto';
    gridRecEmpenho.Columns[6].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[7].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[7].Title.Caption               :='Cor';
    gridRecEmpenho.Columns[7].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[8].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[8].Title.Caption               :='Tamanho';
    gridRecEmpenho.Columns[8].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[9].Title.Alignment             :=taCenter;
    gridRecEmpenho.Columns[9].Title.Caption               :='Rolo';
    gridRecEmpenho.Columns[9].Title.Font.Style            :=[fsBold];
    gridRecEmpenho.Columns[10].Title.Alignment            :=taCenter;
    gridRecEmpenho.Columns[10].Title.Caption              :='Metragem';
    gridRecEmpenho.Columns[10].Title.Font.Style           :=[fsBold];
    gridRecEmpenho.Columns[11].Title.Alignment            :=taCenter;
    gridRecEmpenho.Columns[11].Title.Caption              :='Consumo';
    gridRecEmpenho.Columns[11].Title.Font.Style           :=[fsBold];
    gridRecEmpenho.Columns[12].Title.Alignment            :=taCenter;
    gridRecEmpenho.Columns[12].Title.Caption              :='Unidade';
    gridRecEmpenho.Columns[12].Title.Font.Style           :=[fsBold];
    gridRecEmpenho.Columns[13].Visible                    :=false;
    gridRecEmpenho.Columns[14].Visible                    :=false;
    gridRecEmpenho.Columns[15].Visible                    :=false;
    gridRecEmpenho.Columns[16].Visible                    :=false;
    gridRecEmpenho.Columns[17].Visible                    :=false;

    populaCdsRecEmpenho;
end;

procedure TformRecEmpenho.gridRecEmpenhoClick(Sender: TObject);
begin
    //cdsRecEmpenho.RecNo := strtoint(gridRecEmpenho.columns[0]/gridRecEmpenho.cells[row,0]);
end;

procedure TformRecEmpenho.gridRecEmpenhoDrawColumnCell(Sender: TObject;
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
    if cdsRecEmpenho.IsEmpty then
       exit;

    if cdsRecEmpenho.FieldByName('selected_item').Value = true then
        gridRecEmpenho.Canvas.Brush.Color :=clYellow
    else
        gridRecEmpenho.Canvas.Brush.Color :=clWhite;


    gridRecEmpenho.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TformRecEmpenho.gridRecEmpenhoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = #32 then
    begin
        if cdsRecEmpenho.FieldByName('selected_item').Value = false then
        begin
            cdsRecEmpenho.Edit;
            cdsRecEmpenho.FieldByName('selected_item').Value :=true;
        end
        else
        begin
            cdsRecEmpenho.Edit;
            cdsRecEmpenho.FieldByName('selected_item').Value :=false;
        end;
    end;
end;

procedure TformRecEmpenho.populaCdsRecEmpenho;
begin
    qyRecEmpenho.First;
    while not qyRecEmpenho.eof do
    begin
        cdsRecEmpenho.Open();
        cdsRecEmpenho.Append;
        cdsRecEmpenho.FieldByName('emp_id').AsInteger                           :=qyRecEmpenho.FieldByName('emp_id').Value;
        cdsRecEmpenho.FieldByName('emp_idestoque').AsInteger                    :=qyRecEmpenho.FieldByName('emp_idestoque').Value;
        cdsRecEmpenho.FieldByName('emp_codprocesso').AsInteger                  :=qyRecEmpenho.FieldByName('emp_codprocesso').Value;
        cdsRecEmpenho.FieldByName('emp_idempenhoanterior').AsInteger            :=qyRecEmpenho.FieldByName('emp_idempenhoanterior').Value;
        cdsRecEmpenho.FieldByName('referencia').AsString                        :=qyRecEmpenho.FieldByName('cad_idreferencia').Value;
        cdsRecEmpenho.FieldByName('descricao_ref').AsString                     :=qyRecEmpenho.FieldByName('cad_descricao').Value;
        cdsRecEmpenho.FieldByName('produto').AsString                           :=qyRecEmpenho.FieldByName('cp_descricao').Value;
        cdsRecEmpenho.FieldByName('cor').AsString                               :=qyRecEmpenho.FieldByName('grc_nome').Value;
        cdsRecEmpenho.FieldByName('tamanho').AsString                           :=qyRecEmpenho.FieldByName('grt_nome').Value;
        cdsRecEmpenho.FieldByName('rolo').AsString                              :=qyRecEmpenho.FieldByName('es_numrolo').Value;
        cdsRecEmpenho.FieldByName('metragem').AsFloat                           :=qyRecEmpenho.FieldByName('es_metragemrolo').Value;
        cdsRecEmpenho.FieldByName('consumo').AsFloat                            :=qyRecEmpenho.FieldByName('emp_consumo').Value;
        cdsRecEmpenho.FieldByName('unidade').AsString                           :=qyRecEmpenho.FieldByName('cp_un').Value;
        cdsRecEmpenho.FieldByName('fase').AsString                              :=qyRecEmpenho.FieldByName('fa_nome').Value;
        cdsRecEmpenho.FieldByName('selected_item').AsString                     :=qyRecEmpenho.FieldByName('selected_item').Value;
        cdsRecEmpenho.FieldByName('eprototipo').AsString                        :=qyRecEmpenho.FieldByName('emp_eprototipo').Value;
        cdsRecEmpenho.FieldByName('emp_custo').AsFloat                          :=qyRecEmpenho.FieldByName('emp_custo').Value;
        cdsRecEmpenho.FieldByName('fa_id').AsInteger                            :=qyRecEmpenho.FieldByName('fa_id').Value;
        cdsRecEmpenho.Post;
        qyRecEmpenho.Next;
    end;
    cdsRecEmpenho.First;

end;

end.
