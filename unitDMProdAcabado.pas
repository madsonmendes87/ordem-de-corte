unit unitDMProdAcabado;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmProdAcabado = class(TDataModule)
    dsProdutoAcabado: TDataSource;
    qyProdutoAcabado: TFDQuery;
    qyFichaTecnica: TFDQuery;
    tbProdutoAcabado: TFDTable;
    //procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmProdAcabado: TdmProdAcabado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDatamodule;

{$R *.dfm}



end.
