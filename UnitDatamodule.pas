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
    dsOrdemCorte: TDataSource;
    dsOrdemCorteCores: TDataSource;
    dsOrdemdeCorte: TDataSource;
    tbOrdemCorteSobraSituacao: TFDTable;
    dsOrdemCorteSobraSituacao: TDataSource;
    tbOrdemCorteTrocaItem: TFDTable;
    dsOrdemCorteTrocaItem: TDataSource;
    qyOrdemCorte: TFDQuery;
    tbEstilista: TFDTable;
    dsEstilista: TDataSource;
    qyProdutoAcabado: TFDQuery;
    dsProdutoAcabado: TDataSource;
    qyBoxColecao: TFDQuery;
    dsBoxColecao: TDataSource;
    qyBoxEstilista: TFDQuery;
    dsBoxEstilista: TDataSource;
    qyOrdemHistorico: TFDQuery;
    qyPrevisto: TFDQuery;
    qyTroca: TFDQuery;
    qyEmpenho: TFDQuery;
    qyRealCortado: TFDQuery;
    qyEmpenhoReal: TFDQuery;
    qyRealFinal: TFDQuery;
    qyCores: TFDQuery;
    tbProdutoAcabado: TFDTable;
    tbOrdemdeCorte: TFDTable;
    qyFichaTecnica: TFDQuery;
    qyOrdemIniciarCorte: TFDQuery;
    qyOrdemDeCorte: TFDQuery;
    qyGradeModificada: TFDQuery;
    qyLinha120: TFDQuery;
    qyFaseInformada: TFDQuery;
    qyFichaPrototipo: TFDQuery;
    qyCorGradeProt: TFDQuery;
    qyTecidoPrincipal: TFDQuery;
    qyGradeFicha: TFDQuery;
    qyFichaId: TFDQuery;
    qyFichaSemGrade: TFDQuery;
    qyRefArtigoCor: TFDQuery;
    qyAviamentosPorFicha: TFDQuery;
    qyEstoqueSemReservaProt: TFDQuery;
    qyCortePorTipoFichaId: TFDQuery;
    qyGEComOuSemProt: TFDQuery;
    qyVerCorteReal: TFDQuery;
    qyConsumoFaseGE: TFDQuery;
    qyFichaFaseGE: TFDQuery;
    qyDadosCorteById: TFDQuery;
    qyCoresNoCorte: TFDQuery;
    dsCoresNoCorte: TDataSource;
    tbCorteCores: TFDTable;
    dsCorteCores: TDataSource;
    dsProdutoAvancoProd: TDataSource;
    dsProdReposicao: TDataSource;
    qyUserOrdem2: TFDQuery;
    tbConfAvancoProducao: TFDTable;
    dsConfAvancoProducao: TDataSource;
    tbAvancoProducaoItens: TFDTable;
    dsAvancoProducaoItens: TDataSource;
    qyOldValue: TFDQuery;
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
    qyCodProdAcabadoFicha: TFDQuery;
    qyStatusPrevisto: TFDQuery;
    qyFichaIdCorte: TFDQuery;
    qyOrdemPrototipo: TFDQuery;
    qyGridPrevisto: TFDQuery;
    dsGridPrevisto: TDataSource;
    qyGridPrevistooci_id: TIntegerField;
    qyGridPrevistosituacao: TWideStringField;
    qyGridPrevistogrc_nome_pa: TWideStringField;
    qyGridPrevistocp_id: TIntegerField;
    qyGridPrevistocp_descricao: TWideStringField;
    qyGridPrevistogrc_nome: TWideStringField;
    qyGridPrevistogrt_nome: TWideStringField;
    qyGridPrevistooci_vlrtotal: TBCDField;
    qyGridPrevistooci_qtdade1: TBCDField;
    qyGridPrevistooci_qtdade2: TBCDField;
    qyGridPrevistooci_qtdade3: TBCDField;
    qyGridPrevistooci_qtdade4: TBCDField;
    qyGridPrevistooci_qtdade5: TBCDField;
    qyGridPrevistooci_qtdade6: TBCDField;
    qyGridPrevistooci_qtdade7: TBCDField;
    qyGridPrevistooci_qtdade8: TBCDField;
    qyGridPrevistooci_qtdade9: TBCDField;
    qyGridPrevistooci_qtdade10: TBCDField;
    qyGridPrevistooci_qtdade11: TBCDField;
    qyGridPrevistooci_qtdade12: TBCDField;
    qyGridPrevistooci_qtdade13: TBCDField;
    qyGridPrevistooci_qtdade14: TBCDField;
    qyGridPrevistooci_qtdade15: TBCDField;
    qyGridPrevistocp_un: TWideStringField;
    qyGridPrevistooci_tipo: TWideStringField;
    qyGridPrevistooci_tecido: TBooleanField;
    qyPrevistoOciId: TFDQuery;
    qyPrevistoQtdCortes: TFDQuery;
    qyGerMediaPecas: TFDQuery;
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
