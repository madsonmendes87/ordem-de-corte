unit unitDMRealCortado;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmRealCortado = class(TDataModule)
    qyOrdemPrototipo: TFDQuery;
    qyCodProdAcabadoFicha: TFDQuery;
    qyStatusRealCortado: TFDQuery;
    qyFichaIdCorte: TFDQuery;
    qyGridRealCortado: TFDQuery;
    dsGridRealCortado: TDataSource;
    qyGridRealCortadooci_id: TIntegerField;
    qyGridRealCortadosituacao: TWideStringField;
    qyGridRealCortadogrc_nome_pa: TWideStringField;
    qyGridRealCortadocp_id: TIntegerField;
    qyGridRealCortadocp_descricao: TWideStringField;
    qyGridRealCortadocm_descricao: TWideStringField;
    qyGridRealCortadogrc_nome: TWideStringField;
    qyGridRealCortadogrt_nome: TWideStringField;
    qyGridRealCortadooci_vlrtotal: TBCDField;
    qyGridRealCortadooci_vlr_sobra: TBCDField;
    qyGridRealCortadooci_qtdade1: TBCDField;
    qyGridRealCortadooci_qtdade2: TBCDField;
    qyGridRealCortadooci_qtdade3: TBCDField;
    qyGridRealCortadooci_qtdade4: TBCDField;
    qyGridRealCortadooci_qtdade5: TBCDField;
    qyGridRealCortadooci_qtdade6: TBCDField;
    qyGridRealCortadooci_qtdade7: TBCDField;
    qyGridRealCortadooci_qtdade8: TBCDField;
    qyGridRealCortadooci_qtdade9: TBCDField;
    qyGridRealCortadooci_qtdade10: TBCDField;
    qyGridRealCortadooci_qtdade11: TBCDField;
    qyGridRealCortadooci_qtdade12: TBCDField;
    qyGridRealCortadooci_qtdade13: TBCDField;
    qyGridRealCortadooci_qtdade14: TBCDField;
    qyGridRealCortadooci_qtdade15: TBCDField;
    qyGridRealCortadocp_un: TWideStringField;
    qyGridRealCortadooci_tipo: TWideStringField;
    qyGridRealCortadooci_tecido: TBooleanField;
    qyGerMediaPecas: TFDQuery;
    qyRealCortadoOciId: TFDQuery;
    qyRealQtdCortes: TFDQuery;
    qyRealQtdGrade: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmRealCortado: TdmRealCortado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnitDatamodule;

{$R *.dfm}

end.
