unit unitImgGradeCor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TformImgGradeCor = class(TForm)
    imageGradeCor: TImage;
    labFoto1: TLabel;
    labFoto2: TLabel;
    labFoto3: TLabel;
    qyFoto: TFDQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure labFoto1Click(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure labFoto3Click(Sender: TObject);
    procedure labFoto2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure fotoProduto;
    procedure carregarImagem;
  end;

var
  formImgGradeCor: TformImgGradeCor;

implementation

{$R *.dfm}

uses UnitSelecionArtigos, UnitDatamodule, UnitPrevisto;

procedure TformImgGradeCor.carregarImagem;
begin
    if FileExists(arquivoPath) then
    begin
        imageGradeCor.Picture.LoadFromFile(arquivoPath);
    end
    else
        imageGradeCor.Picture.LoadFromFile('C:\Sistema DiaERP\foto.jpg');
end;

procedure TformImgGradeCor.FormClick(Sender: TObject);
begin
    fotoProduto;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+qyFoto.FieldByName('cp_nomefoto2').Value;
    carregarImagem;
end;

procedure TformImgGradeCor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action :=CaFree;
end;

procedure TformImgGradeCor.FormShow(Sender: TObject);
begin
      fotoProduto;
      arquivoPath := '\\10.0.0.222\diaerpfotos\'+qyFoto.FieldByName('cp_nomefoto1').Value;
      carregarImagem;

end;

procedure TformImgGradeCor.fotoProduto;
begin
    with qyFoto do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT cp_nomefoto1, cp_nomefoto2, cp_nomefoto3 FROM cadastro_produto');
        SQL.Add('   WHERE cp_id = :idProduto');
        ParamByName('idProduto').AsInteger := strtoint(formPrevisto.gridPrevisto.Fields[3].Value);
        Open;
    end;
end;

procedure TformImgGradeCor.labFoto1Click(Sender: TObject);
begin
    fotoProduto;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+qyFoto.FieldByName('cp_nomefoto1').Value;
    carregarImagem;
end;

procedure TformImgGradeCor.labFoto2Click(Sender: TObject);
begin
    fotoProduto;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+qyFoto.FieldByName('cp_nomefoto2').Value;
    carregarImagem;
end;

procedure TformImgGradeCor.labFoto3Click(Sender: TObject);
begin
    fotoProduto;
    arquivoPath := '\\10.0.0.222\diaerpfotos\'+qyFoto.FieldByName('cp_nomefoto3').Value;
    carregarImagem;
end;

end.
