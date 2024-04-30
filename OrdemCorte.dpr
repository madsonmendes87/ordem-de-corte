program OrdemCorte;

uses
  Vcl.Forms,
  IniFiles,
  Windows,
  UnitPrincipal in 'UnitPrincipal.pas' {formPrincipal},
  UnitDatamodule in 'UnitDatamodule.pas' {dmOrdemCorte: TDataModule},
  UnitPrevisto in 'UnitPrevisto.pas' {formPrevisto},
  UnitProdutoAcabado in 'UnitProdutoAcabado.pas' {formProdutoAcabado},
  UnitHistoricOrdem in 'UnitHistoricOrdem.pas' {formHistoricOrdem},
  UnitDMHistoricOrdem in 'UnitDMHistoricOrdem.pas' {dmHistoricOrdem: TDataModule},
  UnitOrdemCorteCores in 'UnitOrdemCorteCores.pas' {formOrdemCorteCores},
  UnitVerificaVersao in 'UnitVerificaVersao.pas',
  UnitConfirmacaoAvancoProducao in 'UnitConfirmacaoAvancoProducao.pas' {formConfirmacaoAvancoProducao},
  unitArtCancelados in 'unitArtCancelados.pas' {formArtCancelados},
  UnitLogin in 'UnitLogin.pas' {formLogin},
  UnitMudancArtigo in 'UnitMudancArtigo.pas' {forMudancArtigo},
  UnitSelecionArtigos in 'UnitSelecionArtigos.pas' {formSelecionArtigo};

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
  Application.CreateForm(TformConfirmacaoAvancoProducao, formConfirmacaoAvancoProducao);
  Application.CreateForm(TformArtCancelados, formArtCancelados);
  Application.CreateForm(TformLogin, formLogin);
  Application.CreateForm(TforMudancArtigo, forMudancArtigo);
  Application.CreateForm(TformSelecionArtigo, formSelecionArtigo);
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
