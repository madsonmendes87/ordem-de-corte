program OrdemCorte;

uses
  Vcl.Forms,
  IniFiles,
  Windows,
  UnitPrincipal in 'UnitPrincipal.pas' {formPrincipal},
  UnitDatamodule in 'UnitDatamodule.pas' {dmOrdemCorte: TDataModule},
  UnitIniciarCorte in 'UnitIniciarCorte.pas' {formIniciarCorte},
  UnitProdutoAcabado in 'UnitProdutoAcabado.pas' {formProdutoAcabado},
  UnitHistoricOrdem in 'UnitHistoricOrdem.pas' {formHistoricOrdem},
  UnitDMHistoricOrdem in 'UnitDMHistoricOrdem.pas' {dmHistoricOrdem: TDataModule},
  UnitOrdemCorteCores in 'UnitOrdemCorteCores.pas' {formOrdemCorteCores},
  UnitVerificaVersao in 'UnitVerificaVersao.pas';

{$R *.res}

var
    ini : TIniFile;
    exeLocal : String;
    exeRemoto : String;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmOrdemCorte, dmOrdemCorte);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TformHistoricOrdem, formHistoricOrdem);
  Application.CreateForm(TdmHistoricOrdem, dmHistoricOrdem);
  Application.CreateForm(TformOrdemCorteCores, formOrdemCorteCores);
  Application.Run;
  if EncontrouIni then
  begin

    ini:=TIniFile.Create(GetCaminhoIniFile);

    exeLocal:=ini.ReadString('ARQUIVOS', 'exeLocal', '');
    exeRemoto:=ini.ReadString('ARQUIVOS', 'exeRemoto', '');

    if ValidaArquivos(exeLocal, exeRemoto) then
    begin
      if GetVersion(exeLocal) <>  GetVersion(exeRemoto)  then
        copiarNovaVersao(exeLocal, exeRemoto);

      WinExec(PAnsiChar(exeLocal), 1);
    end;
    ini.Free;
  end;
  Application.Terminate;
end.
