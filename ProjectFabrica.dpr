program ProjectFabrica;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {Form1},
  UnitDatamodule in 'UnitDatamodule.pas' {dmOrdemCorte: TDataModule},
  UnitIniciarCorte in 'UnitIniciarCorte.pas' {formIniciarCorte};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TdmOrdemCorte, dmOrdemCorte);
  Application.CreateForm(TformIniciarCorte, formIniciarCorte);
  Application.Run;
end.
