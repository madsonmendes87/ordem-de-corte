program OrdemCorte;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {formPrincipal},
  UnitDatamodule in 'UnitDatamodule.pas' {dmOrdemCorte: TDataModule},
  UnitIniciarCorte in 'UnitIniciarCorte.pas' {formIniciarCorte},
  UnitProdutoAcabado in 'UnitProdutoAcabado.pas' {formProdutoAcabado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmOrdemCorte, dmOrdemCorte);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
