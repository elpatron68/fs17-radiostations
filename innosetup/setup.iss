#include <idp.iss>


[Files]
Source: "..\FS17-RadiomanagerPro\bin\Release\FS17-RadiomanagerPro.exe"; DestDir: "{app}"
Source: "..\FS17-RadiomanagerPro\bin\Release\Newtonsoft.Json.dll"; DestDir: "{app}"
Source: "..\FS17-RadiomanagerPro\bin\Release\Resources\radio-old.ico"; DestDir: "{app}\Resources"

[Icons]
Name: "{group}\FS17-Radiomanager\FS17-Radiomanager"; Filename: "{app}\FS17-RadiomanagerPro.exe"; WorkingDir: "{app}"; IconFilename: "{app}\Resources\radio-old.ico"; IconIndex: 0

[Setup]
AppName=FS17-Radiomanager
AppVersion=1.0.0
AppCopyright=Markus Busche
DisableProgramGroupPage=yes
AppPublisher=Markus Busche
AppContact=elpatron@mailbox.org
MinVersion=0,6.0
DefaultDirName="{pf}\FS17-Radiomanager"
OutputBaseFilename=FS17-Radiomanager_Setup
AlwaysShowDirOnReadyPage=True
AppId={{BABEB7EA-09E8-439F-91E0-57004C29D44A}

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Code]
function Framework45IsNotInstalled(): Boolean;
var
  bSuccess: Boolean;
  regVersion: Cardinal;
begin
  Result := True;

  bSuccess := RegQueryDWordValue(HKLM, 'Software\Microsoft\NET Framework Setup\NDP\v4\Full', 'Release', regVersion);
  if (True = bSuccess) and (regVersion >= 378389) then begin
    Result := False;
  end;
end;

procedure InitializeWizard;
begin
  if Framework45IsNotInstalled() then
  begin
    idpAddFile('http://go.microsoft.com/fwlink/?LinkId=397707', ExpandConstant('{tmp}\NetFrameworkInstaller.exe'));
    idpDownloadAfter(wpReady);
  end;
end;

procedure InstallFramework;
var
  StatusText: string;
  ResultCode: Integer;
begin
  StatusText := WizardForm.StatusLabel.Caption;
  WizardForm.StatusLabel.Caption := 'Installing .NET Framework 4.5.2. This might take a few minutes';
  WizardForm.ProgressGauge.Style := npbstMarquee;
  try
    if not Exec(ExpandConstant('{tmp}\NetFrameworkInstaller.exe'), '/passive /norestart', '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then
    begin
      MsgBox('.NET installation failed with code: ' + IntToStr(ResultCode) + '.', mbError, MB_OK);
    end;
  finally
    WizardForm.StatusLabel.Caption := StatusText;
    WizardForm.ProgressGauge.Style := npbstNormal;

    DeleteFile(ExpandConstant('{tmp}\NetFrameworkInstaller.exe'));
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  case CurStep of
    ssPostInstall:
      begin
        if Framework45IsNotInstalled() then
        begin
          InstallFramework();
        end;
      end;
  end;
end;
