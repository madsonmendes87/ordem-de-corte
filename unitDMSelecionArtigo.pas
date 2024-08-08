unit unitDMSelecionArtigo;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmSelecionArtigo = class(TDataModule)
    dsSelecArtigo: TDataSource;
    qySelecArtigo: TFDQuery;
    qySelecArtigocomp_nome: TWideStringField;
    qySelecArtigocp_id: TIntegerField;
    qySelecArtigoproduto: TWideStringField;
    qySelecArtigogrc_nome: TWideStringField;
    qySelecArtigogrt_nome: TWideStringField;
    qySelecArtigodisponivel: TFMTBCDField;
    qySelecArtigocp_un: TWideStringField;
    qySelecArtigocp_nomefoto1: TWideStringField;
    qySelecArtigocp_nomefoto2: TWideStringField;
    qySelecArtigocp_nomefoto3: TWideStringField;
    qySelecArtigopgc_nomefoto: TWideStringField;
    qySelecArtigocp_qtdadefracionada: TBooleanField;
    qySelecArtigocp_rolopeca: TBooleanField;
    qySelecArtigocp_idtipoproduto: TIntegerField;
    qySelecArtigogrc_id: TIntegerField;
    qySelecArtigogrt_id: TIntegerField;
    qyComparArtigo1: TFDQuery;
    qyComparArtigo2: TFDQuery;
    qyEstoqueArtigo: TFDQuery;
    qyFotoProduto: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSelecionArtigo: TdmSelecionArtigo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitSelecionArtigos, UnitDatamodule;

{$R *.dfm}

end.
