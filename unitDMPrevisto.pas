unit unitDMPrevisto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmPrevisto = class(TDataModule)
    qyFinalizaPrevisto: TFDQuery;
    qyCorteOrdem: TFDQuery;
    qyCorteItensPrev: TFDQuery;
    qyTemEmpPrevisto: TFDQuery;
    qyQuantidadeCorte: TFDQuery;
    qyGradePecasCor: TFDQuery;
    qyItensAviamentoFicha: TFDQuery;
    qyEstoqueSemReserProt: TFDQuery;
    qyUsuario: TFDQuery;
    qyOrdemPrototipo: TFDQuery;
    qyCodProdAcabadoFicha: TFDQuery;
    qyStatusPrevisto: TFDQuery;
    qyFichaIdCorte: TFDQuery;
    qyGridPrevisto: TFDQuery;
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
    dsGridPrevisto: TDataSource;
    qyGerMediaPecas: TFDQuery;
    qyPrevistoOciId: TFDQuery;
    qyPrevistoQtdCortes: TFDQuery;
    qyIniciadoRealCortado: TFDQuery;
    qyReabrirPrevisto: TFDQuery;
    qyRetirArtigo: TFDQuery;
    qyEditGradeCor: TFDQuery;
    qyConsTamFicha: TFDQuery;
    qyEditGradePrevisto: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrevisto: TdmPrevisto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDatamodule;

{$R *.dfm}

end.
