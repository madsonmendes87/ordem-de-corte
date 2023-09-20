unit UnitPrevisto;

interface

uses
  System.RegularExpressions, Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.Actions, Vcl.ActnList, Data.DB, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus, Vcl.Samples.Spin;

type
  TformPrevisto = class(TForm)
    panelCabecalho: TPanel;
    butSairPrevisto: TSpeedButton;
    radioCorte: TRadioGroup;
    labControleCorte: TLabel;
    labNumCorte: TLabel;
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
    radioArtigos: TRadioGroup;
    labItem: TLabel;
    labQuantidade: TLabel;
    spinTamanho1: TSpinEdit;
    spinTamanho2: TSpinEdit;
    spinTamanho3: TSpinEdit;
    spinTamanho4: TSpinEdit;
    spinTamanho5: TSpinEdit;
    spinTamanho6: TSpinEdit;
    spinTamanho7: TSpinEdit;
    spinTamanho8: TSpinEdit;
    spinTamanho9: TSpinEdit;
    spinTamanho10: TSpinEdit;
    spinTamanho11: TSpinEdit;
    spinTamanho12: TSpinEdit;
    spinTamanho13: TSpinEdit;
    spinTamanho14: TSpinEdit;
    spinTamanho15: TSpinEdit;
    labTam1: TLabel;
    labTam2: TLabel;
    labTam3: TLabel;
    labTam4: TLabel;
    labTam5: TLabel;
    labTam6: TLabel;
    labTam7: TLabel;
    labTam8: TLabel;
    labTam9: TLabel;
    labTam10: TLabel;
    labTam11: TLabel;
    labTam12: TLabel;
    labTam13: TLabel;
    labTam14: TLabel;
    labTam15: TLabel;
    labConsumo: TLabel;
    labIndividual: TLabel;
    labTotal: TLabel;
    labIndividual1: TLabel;
    labIndividual2: TLabel;
    labIndividual3: TLabel;
    labIndividual4: TLabel;
    labIndividual5: TLabel;
    labIndividual6: TLabel;
    labIndividual7: TLabel;
    labIndividual8: TLabel;
    labIndividual9: TLabel;
    labindividual10: TLabel;
    labIndividual11: TLabel;
    labIndividual12: TLabel;
    labIndividual13: TLabel;
    labIndividual14: TLabel;
    labIndividual15: TLabel;
    labTotal1: TLabel;
    labTotal2: TLabel;
    labTotal3: TLabel;
    labTotal4: TLabel;
    labTotal5: TLabel;
    labTotal6: TLabel;
    labTotal7: TLabel;
    labTotal8: TLabel;
    labTotal9: TLabel;
    labTotal10: TLabel;
    labTotal11: TLabel;
    labTotal12: TLabel;
    labTotal13: TLabel;
    labTotal14: TLabel;
    labTotal15: TLabel;
    panelInfo1: TPanel;
    panelInfo2: TPanel;
    labQtdCortes: TLabel;
    labNumQtdCortes: TLabel;
    labMedia: TLabel;
    labNumMedia: TLabel;
    labConsTotal: TLabel;
    labNumConsTotal: TLabel;
    labPlus: TLabel;
    labConsRestante: TLabel;
    labNumConsRestante: TLabel;
    labNomeTotal: TLabel;
    labIgual: TLabel;
    labNumTotal: TLabel;
    labUnidade: TLabel;
    labNumUnidade: TLabel;
    labTotalGeralPecas: TLabel;
    labNumTotalGeral: TLabel;
    labMediaGeralPecas: TLabel;
    labNumMediaTotal: TLabel;
    butInfoReferencia: TSpeedButton;
    butImGradeCor: TSpeedButton;
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
    procedure butInfoReferenciaMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure butImGradeCorMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);


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
    butInfoReferencia.Font.Color:=clNavy;
    butImGradeCor.Font.Color:=clWindowText;
end;

procedure TformPrevisto.butAcaoClick(Sender: TObject);
begin
    butAcao.PopupMenu.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
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

procedure TformPrevisto.butImGradeCorMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butImGradeCor.Font.Color:=clDkGray;
end;

procedure TformPrevisto.butInfoReferenciaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butInfoReferencia.Font.Color:=clBlue;
end;

end.
