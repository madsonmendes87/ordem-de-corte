unit UnitConfirmacaoAvancoProducao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TformConfirmacaoAvancoProducao = class(TForm)
    dtReposicao: TDateTimePicker;
    labDataReposicao: TLabel;
    gridProduto: TDBGrid;
    gridProdutoReposicao: TDBGrid;
    butDown: TBitBtn;
    butUP: TBitBtn;
    butSalvarFinalPrev: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formConfirmacaoAvancoProducao: TformConfirmacaoAvancoProducao;

implementation

{$R *.dfm}

uses UnitDatamodule;

end.
