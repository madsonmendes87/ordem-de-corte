unit UnitDatamodule;

interface

uses
  System.SysUtils,System.Classes,FireDAC.Stan.Intf,FireDAC.Stan.Option,FireDAC.Stan.Error,FireDAC.UI.Intf,FireDAC.Phys.Intf,
  FireDAC.Stan.Def,FireDAC.Stan.Pool,FireDAC.Stan.Async,FireDAC.Phys,FireDAC.Phys.PG,FireDAC.Phys.PGDef,FireDAC.VCLUI.Wait,FireDAC.Comp.UI,FireDAC.Comp.Client,
  Data.DB,FireDAC.Phys.MSAcc,FireDAC.Phys.MSAccDef,FireDAC.Stan.Param,FireDAC.DatS,FireDAC.DApt.Intf,FireDAC.DApt,FireDAC.Comp.DataSet,
  Datasnap.Provider, Datasnap.DBClient;

type
  TdmOrdemCorte = class(TDataModule)
    Conexao: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    dsOrdemCorteCores: TDataSource;
    tbOrdemCorteTrocaItem: TFDTable;
    dsOrdemCorteTrocaItem: TDataSource;
    tbEstilista: TFDTable;
    dsEstilista: TDataSource;
    qyCores: TFDQuery;
    qyCoresNoCorte: TFDQuery;
    dsCoresNoCorte: TDataSource;
    tbCorteCores: TFDTable;
    dsProdutoAvancoProd: TDataSource;
    dsProdReposicao: TDataSource;
    dsConfAvancoProducao: TDataSource;
    qyIdCorte: TFDQuery;
    dsOrdemCorteProtFase: TDataSource;
    qyCorPrevisto: TFDQuery;
    qyGrc: TFDQuery;
    dsGrc: TDataSource;
    tbTrocaItem: TFDTable;
    dsTrocaItem: TDataSource;
    tbTrocaItemReserva: TFDTable;
    dsTrocaItemReserva: TDataSource;
    qyLimpaCampos: TFDQuery;
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
    cdsProdReposicao: TClientDataSet;
    cdsProdReposicaoidProduto: TIntegerField;
    cdsProdReposicaoProduto: TStringField;
    cdsProdReposicaoCor: TStringField;
    cdsProdReposicaoTamanho: TStringField;
    cdsProdReposicaoDataReposicao: TDateField;
    cdsProdReposicaocodCor: TIntegerField;
    cdsProdReposicaocodTamanho: TIntegerField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOrdemCorte: TdmOrdemCorte;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDMHistoricOrdem, UnitHistoricOrdem, UnitIniciarCorte,
  UnitOrdemCorteCores, UnitPrincipal, UnitProdutoAcabado, UnitPrevisto;

{$R *.dfm}





end.
