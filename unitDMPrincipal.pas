unit unitDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPrincipal = class(TDataModule)
    qyDadosCorteById: TFDQuery;
    dsBoxEstilista: TDataSource;
    qyBoxEstilista: TFDQuery;
    qyGradeTamanho: TFDQuery;
    dsGradeTamanho: TDataSource;
    dsTipoProduto: TDataSource;
    qyTipoProduto: TFDQuery;
    qyBoxColecao: TFDQuery;
    dsBoxColecao: TDataSource;
    dsOrdemCorte: TDataSource;
    qyOrdemCorte: TFDQuery;
    qyVerCorteReal: TFDQuery;
    qyBoxComprador: TFDQuery;
    dsBoxComprador: TDataSource;
    qyBoxFornecedor: TFDQuery;
    dsBoxFornecedor: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDatamodule, UnitPrincipal, UnitSelecionArtigos,
  UnitVerificaVersao, UnitProdutoAcabado;

{$R *.dfm}

end.
