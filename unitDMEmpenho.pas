unit unitDMEmpenho;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmEmpenho = class(TDataModule)
    qyArtigoEmpenho: TFDQuery;
    dsArtigoEmpenho: TDataSource;
    qyArtigoEmpenhooci_id: TIntegerField;
    qyArtigoEmpenhooci_iditemficha: TIntegerField;
    qyArtigoEmpenhooci_tecido: TBooleanField;
    qyArtigoEmpenhocp_id: TIntegerField;
    qyArtigoEmpenhogrc_id: TIntegerField;
    qyArtigoEmpenhogrt_id: TIntegerField;
    qyArtigoEmpenhooci_idgradecorprodutoacabado: TIntegerField;
    qyArtigoEmpenhocp_descricao: TWideStringField;
    qyArtigoEmpenhogrt_nome: TWideStringField;
    qyArtigoEmpenhooci_vlrtotal: TBCDField;
    qyArtigoEmpenhooci_restante: TBCDField;
    qyArtigoEmpenhodisponivel: TFMTBCDField;
    qyArtigoEmpenhocp_un: TWideStringField;
    qyArtigoEmpenhogrc_nome: TWideStringField;
    qyArtigoEmpenhogrc_nome_pa: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEmpenho: TdmEmpenho;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses unitEmpenho, UnitDatamodule;

{$R *.dfm}


end.
