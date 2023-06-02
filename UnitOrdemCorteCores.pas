unit UnitOrdemCorteCores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons;

type
  TformOrdemCorteCores = class(TForm)
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    gridCoresReferencia: TDBGrid;
    gridCoresCorte: TDBGrid;
    butAdd: TBitBtn;
    butAddTodas: TBitBtn;
    butRetirar: TBitBtn;
    butRetirarTodas: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure butAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formOrdemCorteCores: TformOrdemCorteCores;

implementation

{$R *.dfm}

uses UnitIniciarCorte, UnitDatamodule, UnitDMHistoricOrdem,
  UnitHistoricOrdem, UnitPrincipal, UnitProdutoAcabado;

procedure TformOrdemCorteCores.butAddClick(Sender: TObject);
begin
      gridCoresCorte.Columns[0].Title.Caption := 'COR';
      gridCoresCorte.Columns[0].Title.Font.Style := [fsBold];
end;

procedure TformOrdemCorteCores.FormShow(Sender: TObject);
begin
      With dmOrdemCorte.qyCores do
      begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT (cast(''Cod Uso: '' || (gc.grc_codexterno) ||''    '' ||');
				    SQL.Add('   TRIM(GC.grc_nome) || '' ('' ||');
				    SQL.Add('   TRIM(GC.grc_sigla) || '')'' as character varying(120))) AS grc_nome');
				    SQL.Add('   FROM ordem_corte_cores AS occ');
				    SQL.Add('   JOIN grade_cor AS gc ON gc.grc_id = occ.occ_idcor');
				    SQL.Add('WHERE occ_idordemcorte=:ordemCorte');
            ParamByName('ordemCorte').AsInteger := strtoint(formPrincipal.gridOrdem.Fields[0].Value);
            Open;
      end;
      gridCoresReferencia.Columns[0].Title.Caption := 'COR';
      gridCoresReferencia.Columns[0].Title.Font.Style := [fsBold];
end;

end.
