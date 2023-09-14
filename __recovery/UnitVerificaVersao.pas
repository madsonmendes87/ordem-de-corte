unit UnitVerificaVersao;

interface

 uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IniFiles,  ShellAPI;

 Function GetCaminhoIniFile:String;
 function GetVersion(sFileName:string): string;
 function EncontrouIni :Boolean;
 function  ValidaArquivos(exeLocal, exeRemoto:String): Boolean;
 function  CopyData(const fromDir, toDir: string): Boolean;
 procedure  CopiarNovaVersao(exeLocal, exeRemoto:String);

implementation

{-----------FUNÇÃO PARA RETORNAR CAMINHO DE ARQUIVO .INI-----------}
Function GetCaminhoIniFile:String;
begin
  result:= ExtractFileDir(Application.ExeName)+'\ConfigArquivos.ini';
end;

function EncontrouIni: Boolean;
begin
  result:=True;
  //Caso não encontre o arquivo, retorna false e exibe mensagem
  if not FileExists(GetCaminhoIniFile) then
  begin
     Application.MessageBox(Pchar('O arquivo de configurações não foi encontrado.'+#13+
                               GetCaminhoIniFile), 'Atenção', MB_OK + MB_ICONWARNING);
     result:=False;
  end;
end;

function ValidaArquivos(exeLocal, exeRemoto:String): Boolean;
begin
  result:=True;
   //Verifica se o arquivo local existe
   if not FileExists(exeLocal) then
   begin
       Application.MessageBox(Pchar('O arquivo local não foi encontrado.'+#13+
                                exeLocal), 'Atenção', MB_OK + MB_ICONWARNING);
       result:=False;
   end
   else
   //Verifica se o arquivo remoto existe
   if not FileExists(exeRemoto) then
   begin
       Application.MessageBox(Pchar('O arquivo Remoto não foi encontrado.'+#13+
                                exeRemoto), 'Atenção', MB_OK + MB_ICONWARNING);
       result:=False;
   end;
end;

{-----------FUNÇÃO PARA COPIA DE ARQUIVOS-----------}
function CopyData(const fromDir, toDir: string): Boolean;{Função para copia de arquivos}
var
  fos: TSHFileOpStruct;
begin
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc:= FO_COPY;
    fFlags:= {FOF_SILENT or} FOF_NOCONFIRMATION or FOF_NOCONFIRMMKDIR;
    pFrom:= PChar(fromDir + #0);
    pTo:= PChar(toDir);
  end;
  Result:= (0 = ShFileOperation(fos));
end;

{-----------FUNÇÃO QUE RETORNA VERSÃO DO EXE-----------}
function GetVersion(sFileName:string): string;
var
  VerInfoSize  : DWORD;
  VerInfo      : Pointer;
  VerValueSize : DWORD;
  VerValue     : PVSFixedFileInfo;
  Dummy        : DWORD;
begin
try
  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
  except
    Result:='1.0.0.0';
 end;
end;

procedure  CopiarNovaVersao(exeLocal, exeRemoto:String);
var
    s: string;

begin
  Application.MessageBox(pchar('Nova versão disponível no servidor!'+#13+
                               'Versão Atual : '+GetVersion(exeLocal)+#13+
                               'Nova Versão  : '+GetVersion(exeRemoto)), 'Atenção', MB_OK + MB_ICONWARNING);


 if RenameFile(exeLocal,(exeLocal+'_old')) then
    if not  CopyData(exeRemoto, exeLocal) then
      Application.MessageBox('Ocorreu um erro ao copiar nova versão do servidor.',
                                   'Atenção', MB_OK + MB_ICONERROR);
end;

end.
