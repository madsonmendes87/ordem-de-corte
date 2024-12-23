unit unitDMIniciarCorte;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmIniciarCorte = class(TDataModule)
    qyOrdemIniciarCorte: TFDQuery;
    qyPrevisto: TFDQuery;
    qyDadosCorteById: TFDQuery;
    qyOrdemDeCorte: TFDQuery;
    qyGradeModificada: TFDQuery;
    qyGradeFicha: TFDQuery;
    qyFichaId: TFDQuery;
    qyFichaSemGrade: TFDQuery;
    qyLinha120: TFDQuery;
    qyFaseInformada: TFDQuery;
    qyFichaPrototipo: TFDQuery;
    qyCorGradeProt: TFDQuery;
    qyTecidoPrincipal: TFDQuery;
    qyRefArtigoCor: TFDQuery;
    qyAviamentosPorFicha: TFDQuery;
    qyEstoqueSemReservaProt: TFDQuery;
    qyCortePorTipoFichaId: TFDQuery;
    dsOrdemdeCorte: TDataSource;
    tbOrdemdeCorte: TFDTable;
    qyGEComOuSemProt: TFDQuery;
    qyConsumoFaseGE: TFDQuery;
    qyFichaFaseGE: TFDQuery;
    qyItensFichaPrevisto: TFDQuery;
    tbOrdemCorteItensPrevisto: TFDTable;
    qyOrdemCorteProtFase: TFDQuery;
    tbOrdemCorteProtFase: TFDTable;
    qyDefinirPrevistoGE: TFDQuery;
    qyTemOrdPrototipo: TFDQuery;
    qyChecaReserva: TFDQuery;
    qyUserOrdem2: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmIniciarCorte: TdmIniciarCorte;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDatamodule;

{$R *.dfm}

end.
