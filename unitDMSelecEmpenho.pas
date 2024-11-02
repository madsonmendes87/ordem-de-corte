unit unitDMSelecEmpenho;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient;

type
  TdmSelecEmpenho = class(TDataModule)
    qyFoto: TFDQuery;
    qyTecido: TFDQuery;
    dsTecido: TDataSource;
    qyTecidoes_id: TIntegerField;
    qyTecidocomp_nome: TWideStringField;
    qyTecidocp_descricao: TWideStringField;
    qyTecidogrc_nome: TWideStringField;
    qyTecidogrt_nome: TWideStringField;
    qyTecidodisponivel: TFMTBCDField;
    qyTecidoes_numrolo: TWideStringField;
    qyTecidoentrada_em_metro: TWideStringField;
    qyTecidoes_custoatual: TFMTBCDField;
    qyTecidofor_nome: TWideStringField;
    qyTecidofor_apelido: TWideStringField;
    qyTecidoselected_item: TBooleanField;
    qySelecLinhaGrid: TFDQuery;
    cdSelecEmpenho: TClientDataSet;
    cdSelecEmpenhoes_id: TIntegerField;
    cdSelecEmpenhocomp_nome: TStringField;
    cdSelecEmpenhocp_descricao: TStringField;
    cdSelecEmpenhogrc_nome: TStringField;
    cdSelecEmpenhogrt_nome: TStringField;
    cdSelecEmpenhodisponivel: TFloatField;
    cdSelecEmpenhoes_numrolo: TStringField;
    cdSelecEmpenhoentrada_em_metro: TStringField;
    cdSelecEmpenhoes_custoatual: TFloatField;
    cdSelecEmpenhofor_nome: TStringField;
    cdSelecEmpenhofor_apelido: TStringField;
    cdSelecEmpenhoselected_item: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSelecEmpenho: TdmSelecEmpenho;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDatamodule;

{$R *.dfm}



end.
