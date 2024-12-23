unit unitDMConfAvancoProducao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmConfirmacaoAvancoProducao = class(TDataModule)
    cdsProdReposicao: TClientDataSet;
    cdsProdReposicaoidProduto: TIntegerField;
    cdsProdReposicaoProduto: TStringField;
    cdsProdReposicaoCor: TStringField;
    cdsProdReposicaoTamanho: TStringField;
    cdsProdReposicaoDataReposicao: TDateField;
    cdsProdReposicaocodCor: TIntegerField;
    cdsProdReposicaocodTamanho: TIntegerField;
    cdsProdSemEstoque: TClientDataSet;
    cdsProdSemEstoqueidProduto: TIntegerField;
    cdsProdSemEstoqueProduto: TStringField;
    cdsProdSemEstoqueCor: TStringField;
    cdsProdSemEstoqueTamanho: TStringField;
    cdsProdSemEstoqueTipo: TStringField;
    cdsProdSemEstoqueConsumo: TFloatField;
    cdsProdSemEstoqueDisponivel: TFloatField;
    cdsProdSemEstoquecodCor: TIntegerField;
    cdsProdSemEstoquecodTamanho: TIntegerField;
    tbConfAvancoProducao: TFDTable;
    qyOldValue: TFDQuery;
    dsAvancoProducaoItens: TDataSource;
    tbAvancoProducaoItens: TFDTable;
    dsProdutoAvancoProd: TDataSource;
    dsProdReposicao: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConfirmacaoAvancoProducao: TdmConfirmacaoAvancoProducao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDatamodule;

{$R *.dfm}

end.
