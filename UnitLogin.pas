unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TformLogin = class(TForm)
    panelCabLogin: TPanel;
    imageLogin: TImage;
    panelUsuario: TPanel;
    editLoginUsuario: TEdit;
    labUsuLogin: TLabel;
    panelEditUsuario: TPanel;
    editLoginSenha: TEdit;
    labSenhaLogin: TLabel;
    panelEditSenha: TPanel;
    paneLiberar: TPanel;
    butLoginLiberar: TSpeedButton;
    panelFechar: TPanel;
    butLoginFechar: TSpeedButton;
    qyUsuario: TFDQuery;
    qyUsuArtNProgramado: TFDQuery;
    procedure editLoginUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure butLoginLiberarClick(Sender: TObject);
    procedure butLoginFecharClick(Sender: TObject);
    procedure editLoginSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure butLoginLiberarMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure butLoginFecharMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

{$R *.dfm}

uses unitArtCancelados, UnitConfirmacaoAvancoProducao, UnitDatamodule,
  UnitDMHistoricOrdem, UnitHistoricOrdem, UnitOrdemCorteCores,
  UnitPrevisto, UnitPrincipal, UnitProdutoAcabado, UnitVerificaVersao, System.Hash;




procedure TformLogin.butLoginFecharMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butLoginFechar.Font.Color:=clWindowText;
end;

procedure TformLogin.butLoginLiberarClick(Sender: TObject);
var
    password : String;
begin
    if TRIM(editLoginUsuario.Text) =''  then
    begin
        editLoginUsuario.SetFocus;
        Application.MessageBox('Digite o nome do usu�rio', 'Aten��o', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if TRIM(editLoginSenha.Text) ='' then
    begin
        editLoginSenha.SetFocus;
        Application.MessageBox('Digite a senha do usu�rio', 'Aten��o', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    with qyUsuario do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT * FROM usuario WHERE us_login = :login AND us_senha = :senha');

        ParamByName('login').AsString :=editLoginUsuario.Text;
        ParamByName('senha').AsString :=THashMD5.GetHashString(editLoginSenha.Text);
        Open;
    end;

    if qyUsuario.IsEmpty then
    begin
        Application.MessageBox('Usu�rio ou senha inv�lida','Aten��o', MB_OK + MB_ICONINFORMATION);
        abort;
    end;

    if qyUsuario.FieldByName('us_idsetor').Value<>'1' then
    begin
        Application.MessageBox('Voc� n�o tem permiss�o para liberar!', 'Aten��o', MB_OK + MB_ICONINFORMATION);
        abort
    end;

    Try

        formPrincipal.IniciaTransacao;

        with qyUsuArtNProgramado do
        begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE ordem_corte SET oc_usupermiteartigonaoprogramado = :idusuautorizou, oc_usuaddartigo_naoprogramado = :idusulogado');
            SQL.Add('   WHERE oc_id = :corte');

            ParamByName('corte').AsInteger                :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            ParamByName('idusuautorizou').AsInteger       :=qyUsuario.FieldByName('us_id').Value;
            ParamByName('idusulogado').AsInteger          :=strtoint(formPrincipal.labCodUsuario.Caption);
            ExecSQL;
        end;

        formPrincipal.ComitaTransacao;
    except
          on E: exception do
          begin
               formPrincipal.DesfazTransacao;
               Application.MessageBox(pchar('Erro ao salvar usuario nao programado.'+E.Message),'Ordem de Corte', MB_ICONERROR);
               exit;
          end;
    end;
    formPrevisto.retirArtigo;
    formLogin.Close;
end;

procedure TformLogin.butLoginLiberarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
    butLoginLiberar.Font.Color:=clWindowText;
end;

procedure TformLogin.editLoginSenhaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key =#13 then
    begin
        butLoginLiberarClick(Sender);
    end;
end;

procedure TformLogin.editLoginUsuarioKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key =#13 then
    begin
        editLoginSenha.SetFocus;
    end;
end;

procedure TformLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action :=CaFree;
end;

procedure TformLogin.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
    butLoginLiberar.Font.Color  :=clWhite;
    butLoginFechar.Font.Color   :=clWhite;
end;

procedure TformLogin.butLoginFecharClick(Sender: TObject);
begin
    Application.MessageBox('Cancelado pelo usu�rio!', 'Ordem de Corte',MB_OK + MB_ICONINFORMATION);
    formLogin.Close;
end;

end.
