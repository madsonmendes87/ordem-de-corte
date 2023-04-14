program OrdemCorte;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {formPrincipal},
  UnitDatamodule in 'UnitDatamodule.pas' {dmOrdemCorte: TDataModule},
  UnitIniciarCorte in 'UnitIniciarCorte.pas' {formIniciarCorte},
  UnitProdutoAcabado in 'UnitProdutoAcabado.pas' {formProdutoAcabado},
  UnitHistoricOrdem in 'UnitHistoricOrdem.pas' {formHistoricOrdem},
  UnitDMHistoricOrdem in 'UnitDMHistoricOrdem.pas' {dmHistoricOrdem: TDataModule},
  UnitOrdemCorteCores in 'UnitOrdemCorteCores.pas' {formOrdemCorteCores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmOrdemCorte, dmOrdemCorte);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TformHistoricOrdem, formHistoricOrdem);
  Application.CreateForm(TdmHistoricOrdem, dmHistoricOrdem);
  Application.CreateForm(TformOrdemCorteCores, formOrdemCorteCores);
  Application.Run;
end.
