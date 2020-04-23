; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Tweetz"
#define MyAppVersion "2.2.3"
#define MyAppPublisher "Mike Ward"
#define MyAppURL "https://mike-ward.net/tweetz"
#define MyAppExeName "tweetz.core.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{275FCDB5-30AE-4EE0-AFFC-F0F49C42AF75}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableDirPage=yes
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputBaseFilename=tweetz-setup
OutputDir=bin\dist
Compression=lzma
SolidCompression=yes
WizardStyle=modern

SetupIconFile="src\tweetz.core\app.ico"
WizardSmallImageFile="blank.bmp"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "bin\self-contained\tweetz.core.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "bin\self-contained\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
const
  HWND_TOPMOST = -1;
  SWP_NOSIZE = 1;
  SWP_NOMOVE = 2;
  SWP_SHOWWINDOW = $40;

function SetWindowPos(hWnd: HWND; hWndInsertAfter: HWND; X: Integer; Y: Integer;
  cx: Integer; cy: Integer; uFlags: UINT): BOOL;
  external 'SetWindowPos@user32.dll stdcall'; 

procedure InitializeWizard;
begin
  SetWindowPos(WizardForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or 
    SWP_NOMOVE or SWP_SHOWWINDOW); 
end;