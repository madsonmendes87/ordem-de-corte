unit unitArtCancelados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TformArtCancelados = class(TForm)
    gridArtCancelados: TDBGrid;
    qyArtCancelados: TFDQuery;
    dsArtCancelados: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formArtCancelados: TformArtCancelados;

implementation

{$R *.dfm}

uses UnitPrevisto, UnitPrincipal, UnitConfirmacaoAvancoProducao,
  UnitDatamodule, UnitDMHistoricOrdem, UnitHistoricOrdem,
  UnitOrdemCorteCores, UnitProdutoAcabado, UnitVerificaVersao;

procedure TformArtCancelados.FormShow(Sender: TObject);
begin
    with qyArtCancelados do
    begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT');
        SQL.Add('   CAST(''CORTE PREVISTO'' AS character varying(15)) AS corte,');
        SQL.Add('   CAST(COALESCE(gc_pa.grc_codexterno, '''') ||'' - '' || TRIM(gc_pa.grc_nome)AS character varying(25)) AS grc_nome_pa,');
        SQL.Add('   CAST(cp.cp_descricao AS character varying(46)),');
        SQL.Add('   CAST(COALESCE(gc.grc_codexterno, '''') ||'' - '' || TRIM(gc.grc_nome)AS character varying(25)) AS grc_nome,');
        SQL.Add('   CAST(TRIM(gt.grt_nome) || ''('' || TRIM(gt.grt_sigla) || '')'' AS character varying(20)) AS grt_nome');
        SQL.Add('   FROM ordem_corte_itens_previsto AS oci');
        SQL.Add('   JOIN grade_cor AS gc ON oci.oci_idgradecor = gc.grc_id');
        SQL.Add('   JOIN grade_cor AS gc_pa ON oci.oci_idgradecorprodutoacabado = gc_pa.grc_id');
        SQL.Add('   JOIN grade_tamanho AS gt ON oci.oci_idgradetam = gt.grt_id');
        SQL.Add('   JOIN cadastro_produto AS cp ON cp.cp_id = oci.oci_idproduto');
        SQL.Add('   JOIN grupo AS gp ON gp.gr_id = cp.cp_idgrupo');
        SQL.Add('   JOIN subgrupo AS sgp ON sgp.sgr_id = cp.cp_idsubgrupo');
        SQL.Add('   JOIN ordem_corte_itens_situacao AS ocis ON ocis.id = oci.oci_situacao_id');
        SQL.Add('   LEFT JOIN composicao_material AS cm ON cm.cm_id = cp.cp_idcomposicao');
        SQL.Add('   WHERE oci.oci_idocorte =:corte AND oci.oci_situacao_id = ''2''');

        ParamByName('corte').AsInteger :=strtoint(formPrincipal.gridOrdem.Fields[0].Value);
        Open;
    end;
    gridArtCancelados.Columns[0].Title.Alignment        :=taCenter;
    gridArtCancelados.Columns[0].Title.Caption          :='CORTE';
    gridArtCancelados.Columns[0].Title.Font.Style       :=[fsBold];
    gridArtCancelados.Columns[1].Title.Alignment        :=taCenter;
    gridArtCancelados.Columns[1].Title.Caption          :='COR DA REFERÊNCIA';
    gridArtCancelados.Columns[1].Title.Font.Style       :=[fsBold];
    gridArtCancelados.Columns[2].Title.Alignment        :=taCenter;
    gridArtCancelados.Columns[2].Title.Caption          :='PRODUTO';
    gridArtCancelados.Columns[2].Title.Font.Style       :=[fsBold];
    gridArtCancelados.Columns[3].Title.Alignment        :=taCenter;
    gridArtCancelados.Columns[3].Title.Caption          :='COR';
    gridArtCancelados.Columns[3].Title.Font.Style       :=[fsBold];
    gridArtCancelados.Columns[4].Title.Alignment        :=taCenter;
    gridArtCancelados.Columns[4].Title.Caption          :='TAMANHO';
    gridArtCancelados.Columns[4].Title.Font.Style       :=[fsBold];
end;

end.
