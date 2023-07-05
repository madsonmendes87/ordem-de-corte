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

Function GetCaminhoIniFile:String;
begin
  result:= ExtractFileDir(Application.ExeName)+'\ConfigArquivos.ini';
end;

function EncontrouIni: Boolean;
begin
  result:=True;

  if not FileExists(GetCaminhoIniFile) then
  begin
     Application.MessageBox(Pchar('O arquivo de configura��es n�o foi encontrado.'+#13+
                               GetCaminhoIniFile), 'Aten��o', MB_OK+MB_ICONEXCLAMATION);
     result:=False;
  end;
end;

function ValidaArquivos(exeLocal, exeRemoto:String): Boolean;
begin
  result:=True;

   if not FileExists(exeLocal) then
   begin
       Application.MessageBox(Pchar('O arquivo local n�o foi encontrado.'+#13+
                                exeLocal), 'Aten��o', MB_OK+MB_ICONEXCLAMATION);
       result:=False;
   end else

   if not FileExists(exeRemoto) then
   begin
       Application.MessageBox(Pchar('O arquivo Remoto n�o foi encontrado.'+#13+
                                exeRemoto), 'Aten��o', MB_OK+MB_ICONEXCLAMATION);
       result:=False;
   end;
end;

function CopyData(const fromDir, toDir: string): Boolean;
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
begin
  Application.MessageBox(pchar('Foi encontrada uma nova vers�o do programa no servidor.'+#13+
                               'Vers�o Atual : '+GetVersion(exeLocal)+#13+
                               'Nova vers�o  : '+GetVersion(exeRemoto)), 'Aten��o', MB_OK+MB_ICONEXCLAMATION);


 if RenameFile(exeLocal, (exeLocal+FormatDateTime('dd_mm_yyyy', date))) then
   if not  CopyData(exeRemoto, exeLocal) then
      Application.MessageBox('Ocorreu um erro ao copiar nova vers�o do servidor.',
                                   'Aten��o', MB_OK+MB_ICONERROR);
end;

end.
