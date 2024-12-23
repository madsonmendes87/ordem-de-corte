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
  UnitSelecionArtigos in 'UnitSelecionArtigos.pas' {formSelecionArtigo},
  unitDMPrincipal in 'unitDMPrincipal.pas' {dmPrincipal: TDataModule},
  unitDMIniciarCorte in 'unitDMIniciarCorte.pas' {dmIniciarCorte: TDataModule},
  unitDMConfAvancoProducao in 'unitDMConfAvancoProducao.pas' {dmConfirmacaoAvancoProducao: TDataModule},
  unitDMProdAcabado in 'unitDMProdAcabado.pas' {dmProdAcabado: TDataModule},
  unitDMPrevisto in 'unitDMPrevisto.pas' {dmPrevisto: TDataModule},
  unitDMMudancArtigo in 'unitDMMudancArtigo.pas' {dmMudancArtigo: TDataModule},
  unitDMSelecionArtigo in 'unitDMSelecionArtigo.pas' {dmSelecionArtigo: TDataModule},
  unitInfoReferencias in 'unitInfoReferencias.pas' {formInfoReferencia},
  unitImgGradeCor in 'unitImgGradeCor.pas' {formImgGradeCor},
  unitDMRealCortado in 'unitDMRealCortado.pas' {dmRealCortado: TDataModule},
  unitRealCortado in 'unitRealCortado.pas' {formRealCortado},
  unitRefRealCortado in 'unitRefRealCortado.pas' {formRefRealCortado},
  unitEmpenho in 'unitEmpenho.pas' {formEmpenho},
  unitDMEmpenho in 'unitDMEmpenho.pas' {dmEmpenho: TDataModule},
  unitSelecEmpenho in 'unitSelecEmpenho.pas' {formSelecEmpenho},
  unitDMSelecEmpenho in 'unitDMSelecEmpenho.pas' {dmSelecEmpenho: TDataModule},
  unitRecEmpenho in 'unitRecEmpenho.pas' {formRecEmpenho};

{$R *.res}

var
    ini : TIniFile;
    exeLocal : String;
    exeRemoto : String;

begin
  ReportMemoryLeaksOnShutdown   :=true;
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
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TdmIniciarCorte, dmIniciarCorte);
  Application.CreateForm(TdmConfirmacaoAvancoProducao, dmConfirmacaoAvancoProducao);
  Application.CreateForm(TdmProdAcabado, dmProdAcabado);
  Application.CreateForm(TdmPrevisto, dmPrevisto);
  Application.CreateForm(TdmMudancArtigo, dmMudancArtigo);
  Application.CreateForm(TdmSelecionArtigo, dmSelecionArtigo);
  Application.CreateForm(TformInfoReferencia, formInfoReferencia);
  Application.CreateForm(TformImgGradeCor, formImgGradeCor);
  Application.CreateForm(TdmRealCortado, dmRealCortado);
  Application.CreateForm(TformRealCortado, formRealCortado);
  Application.CreateForm(TformRefRealCortado, formRefRealCortado);
  Application.CreateForm(TformEmpenho, formEmpenho);
  Application.CreateForm(TdmEmpenho, dmEmpenho);
  Application.CreateForm(TformSelecEmpenho, formSelecEmpenho);
  Application.CreateForm(TdmSelecEmpenho, dmSelecEmpenho);
  Application.CreateForm(TformRecEmpenho, formRecEmpenho);
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
