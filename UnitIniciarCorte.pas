unit UnitIniciarCorte;

interface

uses
  System.RegularExpressions, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls;

type
  TformIniciarCorte = class(TForm)
    panelIniciarCorte: TPanel;
    butSairInicioCorte: TSpeedButton;
    labNumOrd: TLabel;
    labNumeroOrd: TLabel;
    labCodigo: TLabel;
    editCodigo: TEdit;
    labF2: TLabel;
    labReferencia: TLabel;
    editReferencia: TEdit;
    labFicha: TLabel;
    editFicha: TEdit;
    labDescricao: TLabel;
    editDescReferencia: TEdit;
    ActionList1: TActionList;
    acaoCores: TAction;
    butEscolherCores: TButton;
    labSituacao: TLabel;
    labNormal: TLabel;
    labComplementar: TLabel;
    labNaoComp: TLabel;
    labAproveitamento: TLabel;
    labNaoAprov: TLabel;
    labOrdCorte: TLabel;
    labCortePrevisto: TLabel;
    labRealCortado: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    editObservacao: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    labTipoCorte: TLabel;
    butNovo: TBitBtn;
    butSalvar: TBitBtn;
    butRemover: TBitBtn;
    butEditar: TBitBtn;
    butDesistir: TBitBtn;
    Label18: TLabel;
    Label20: TLabel;
    editDtSolicitacao: TDBEdit;
    editHrSolicitacao: TDBEdit;
    editDtFinSolicitacao: TDBEdit;
    editHrFinSolicitacao: TDBEdit;
    editDtIniPrevisto: TDBEdit;
    editHrIniPrevisto: TDBEdit;
    editDtFimPrevisto: TDBEdit;
    editHrFimPrevisto: TDBEdit;
    editDtIniRealCortado: TDBEdit;
    editHrIniRealCortado: TDBEdit;
    editDtFimRealCortado: TDBEdit;
    editHrFimRealCortado: TDBEdit;
    procedure butSairInicioCorteClick(Sender: TObject);
    procedure acaoCoresExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure editObservacaoKeyPress(Sender: TObject; var Key: Char);
    procedure editDtSolicitacaoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    function isDataValida(Value: String): Boolean;
  end;

var
  formIniciarCorte: TformIniciarCorte;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule;



procedure TformIniciarCorte.acaoCoresExecute(Sender: TObject);
begin
    ShowMessage('Teste de escolher cores');
end;

procedure TformIniciarCorte.butSairInicioCorteClick(Sender: TObject);
begin
    formIniciarCorte.Close;
    formPrincipal.butVerCorte.Enabled := true;
    formPrincipal.butCortePrevisto.Enabled := true;
    formPrincipal.butHistoricOrdem.Enabled := true;
end;



procedure TformIniciarCorte.editDtSolicitacaoExit(Sender: TObject);
begin
    isDataValida(editDtSolicitacao.Text);
end;

procedure TformIniciarCorte.editObservacaoKeyPress(Sender: TObject;
  var Key: Char);
begin
      isDataValida(editDtSolicitacao.Text);
end;

procedure TformIniciarCorte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //Release;
    //formIniciarCorte := nil;
    FreeAndNil(formIniciarCorte);
end;

procedure TformIniciarCorte.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 113 then
     begin

          try
             application.CreateForm(TformProdutoAcabado, formProdutoAcabado);
             formProdutoAcabado.ShowModal;
          finally
             FreeAndNil(formProdutoAcabado);
          end;
     end;
end;

function TformIniciarCorte.isDataValida(Value: String): Boolean;

var
    ano, mes, dia, dateAsmmddyyy : String;
    stringListDate : TStringList;
    match : Boolean;
begin
//      if (StrToDate(Value) < NOW()) then
//      application.MessageBox('Digite uma data valida','Aten��o',MB_OK+MB_ICONEXCLAMATION);
    match := TRegEx.IsMatch( Value, '[0-9] {1,2} - [0-9] {1,2} - [0-9] {4}');
    if not match then
    begin
      Result := False;
      exit;
    end;
    stringListDate := TStringList.Create;
    stringListDate.Delimiter := '-';
    stringListDate.DelimitedText := Value;
    dia := stringListDate[ 0 ];
    mes := stringListDate[ 1 ];
    ano := stringListDate[ 2 ];
    dateAsmmddyyy := dia + '/' + mes + '/' + ano;
    Result := true;
    try
      StrToDate(dateAsmmddyyy);
    except
      Result := false;
    end;



//  const
//    Format = '^([0-9]\\/[0-9]\\/[0-9])$'; // express�o regular
//    begin
//        if (match:=TRegEx.IsMatch(Value, Format)) then // valida o formato
//          if (StrToDate(Value) < NOW()) then // Converte e verifica se � menor que data atudal
//              isDataValida := TRUE // retorna true
//          else
//             raise EDataNascimento.Create('Data de Nascimento maior que data atual') // senao cria uma exception
//          else
//              raise EDataNascimento.Create('Data de Nascimento invalida');// senao cria uma exception
//    end;
end;

end.
