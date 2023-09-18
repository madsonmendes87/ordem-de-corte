unit UnitPrevisto;

interface

uses
  System.RegularExpressions, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TformPrevisto = class(TForm)
    panelCabecalho: TPanel;
    butSairPrevisto: TSpeedButton;
    radioCorte: TRadioGroup;
    labControleCorte: TLabel;
    labNumCorte: TLabel;
    labHifen: TLabel;
    labOrdem: TLabel;
    radioProdAcabado: TRadioGroup;
    radioEstadoGuia: TRadioGroup;
    labControleProdAcabado: TLabel;
    labReferencia: TLabel;
    labDescricao: TLabel;
    labCodProdAcabado: TLabel;
    labNumReferencia: TLabel;
    labNomeDescricao: TLabel;
    labSituacao: TLabel;
    labStatuSituacao: TLabel;
    butEditGrade: TSpeedButton;
    butArtigos: TSpeedButton;
    butEmpenho: TSpeedButton;
    butAcao: TSpeedButton;
    popupArtigos: TPopupMenu;
    rocar1: TMenuItem;
    Liberar1: TMenuItem;
    Retirar1: TMenuItem;
    N1: TMenuItem;
    Verartigoscancelados1: TMenuItem;
    popupEmpenho: TPopupMenu;
    Empenhar1: TMenuItem;
    Informao1: TMenuItem;
    N2: TMenuItem;
    RetirarEmpenho1: TMenuItem;
    N3: TMenuItem;
    Verartigoscancelados2: TMenuItem;
    RetirarEmpenho2: TMenuItem;
    popupAcao: TPopupMenu;
    Finalizar1: TMenuItem;
    N4: TMenuItem;
    Reabrir1: TMenuItem;
    procedure butSairPrevistoClick(Sender: TObject);
    procedure butEditGradeMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butArtigosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butEmpenhoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butAcaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butArtigosClick(Sender: TObject);
    procedure butEmpenhoClick(Sender: TObject);
    procedure butAcaoClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPrevisto: TformPrevisto;

implementation

{$R *.dfm}

uses UnitProdutoAcabado, UnitPrincipal, UnitDatamodule, UnitHistoricOrdem,
  UnitOrdemCorteCores, UnitConfirmacaoAvancoProducao, UnitVerificaVersao;

procedure TformPrevisto.butSairPrevistoClick(Sender: TObject);
begin
    formPrevisto.Close;
    formPrincipal.habComponentes;
    formPrincipal.gridOrdem.Visible := true;
end;

procedure TformPrevisto.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
    butEditGrade.Font.Color:=clWindowText;
    butArtigos.Font.Color:=clWindowText;
    butEmpenho.Font.Color:=clWindowText;
    butAcao.Font.Color:=clWindowText;
end;

procedure TformPrevisto.butAcaoClick(Sender: TObject);
begin
    butAcao .PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrevisto.butAcaoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butAcao.Font.Color:=clPurple;
end;

procedure TformPrevisto.butArtigosClick(Sender: TObject);
begin
    butArtigos.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrevisto.butArtigosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butArtigos.Font.Color:=clRed;
end;

procedure TformPrevisto.butEditGradeMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butEditGrade.Font.Color:=clGreen;
end;

procedure TformPrevisto.butEmpenhoClick(Sender: TObject);
begin
    butEmpenho.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TformPrevisto.butEmpenhoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butEmpenho.Font.Color:=clNavy;
end;

end.
