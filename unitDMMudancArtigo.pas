unit unitDMMudancArtigo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmMudancArtigo = class(TDataModule)
    qyEstilistaFicha: TFDQuery;
    qyTemSolicTroca: TFDQuery;
    qySelecArtigoDel: TFDQuery;
    qyDelItemReserva: TFDQuery;
    qyDeletArtigo: TFDQuery;
    qyMudancArtigo: TFDQuery;
    qyMudancArtigocp_id: TIntegerField;
    qyMudancArtigogrc_nome_pa: TWideStringField;
    qyMudancArtigooci_vlrtotal: TBCDField;
    qyMudancArtigocp_descricao: TWideStringField;
    qyMudancArtigogrc_nome: TWideStringField;
    qyMudancArtigogrt_nome: TWideStringField;
    qyMudancArtigooci_id: TIntegerField;
    qyMudancArtigooci_tecido: TBooleanField;
    qyMudancArtigooci_tipo: TWideStringField;
    qyMudancArtigogrc_id: TIntegerField;
    qyMudancArtigogrt_id: TIntegerField;
    dsMudancArtigo: TDataSource;
    qyETecidoCorProd: TFDQuery;
    qyInserirTrocaItem: TFDQuery;
    qyConsumoTroca: TFDQuery;
    qyEstoqueSemReserProt: TFDQuery;
    qyInserirTrocaItemReserva: TFDQuery;
    qyEstoqueSemReserProt2: TFDQuery;
    qyEstoqueComReserva: TFDQuery;
    qyEstoqueComReserva2: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMudancArtigo: TdmMudancArtigo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitMudancArtigo, UnitDatamodule;

{$R *.dfm}

end.
