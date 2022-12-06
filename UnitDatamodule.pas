unit UnitDatamodule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.Client,
  Data.DB, FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmOrdemCorte = class(TDataModule)
    Conexao: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    tbOrdemCorte: TFDTable;
    dsOrdemCorte: TDataSource;
    tbOrdemCorteCores: TFDTable;
    dsOrdemCorteCores: TDataSource;
    tbOrdemCorteEmpenho: TFDTable;
    dsOrdemCorteEmpenho: TDataSource;
    tbOrdemCorteEmpenhoAdicional: TFDTable;
    dsOrdemCorteEmpenhoAdicional: TDataSource;
    tbOrdemCorteEmpenhoReal: TFDTable;
    dsOrdemCorteEmpenhoReal: TDataSource;
    tbOrdemCorteEstoqueSobras: TFDTable;
    dsOrdemCorteEstoqueSobras: TDataSource;
    tbOrdemCorteItensPrevisto: TFDTable;
    dsOrdemCorteItensPrevisto: TDataSource;
    tbOrdemCorteItensReal: TFDTable;
    dsOrdemCorteItensReal: TDataSource;
    tbOrdemCorteItensRealNaopro: TFDTable;
    dsOrdemCorteItensRealNaopro: TDataSource;
    tbOrdemCorteItensRealSobra: TFDTable;
    dsOrdemCorteItensRealSobra: TDataSource;
    tbOrdemCorteItensSituacao: TFDTable;
    dsOrdemCorteItensSituacao: TDataSource;
    tbOrdemCortePrototipoFase: TFDTable;
    dsOrdemCortePrototipoFase: TDataSource;
    tbOrdemCorteRealHistoricoGrade: TFDTable;
    dsOrdemCorteRealHistoricoGrade: TDataSource;
    tbOrdemCorteRetalhosPrevisto: TFDTable;
    dsOrdemCorteRetalhosPrevisto: TDataSource;
    tbOrdemCorteRetalhosReserva: TFDTable;
    dsOrdemCorteRetalhosReserva: TDataSource;
    tbOrdemCorteSituacao: TFDTable;
    dsOrdemCorteSituacao: TDataSource;
    tbOrdemCorteSobraSituacao: TFDTable;
    dsOrdemCorteSobraSituacao: TDataSource;
    tbOrdemCorteTrocaItem: TFDTable;
    dsOrdemCorteTrocaItem: TDataSource;
    qyOrdemCorte: TFDQuery;
    tbEstilista: TFDTable;
    dsEstilista: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOrdemCorte: TdmOrdemCorte;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}



end.