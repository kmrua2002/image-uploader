; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!
#include "../Source/VersionInfo.h"
#define MyAppName "Image Uploader"
#define MyAppVersion _APP_VER
#define MyAppPublisher "ZendeN"
#define MyAppURL "http://zenden.ws/imageuploader"
#define MyAppExeName "Image Uploader.exe"
;#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','')
#include "it_download.iss"
[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{24F211C6-2732-4564-B602-CDA2DE2A13FC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=output\
#ifdef GDIPLUS
OutputBaseFilename=image-uploader-{#_APP_VER}-build-{#BUILD}-setup-gdiplus
#else 
#ifdef FFMPEG
OutputBaseFilename=image-uploader-{#_APP_VER}-build-{#BUILD}-setup-ffmpeg
#else 
OutputBaseFilename=image-uploader-{#_APP_VER}-build-{#BUILD}-setup
#endif
#endif
Compression=lzma/max 
SolidCompression=yes

[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "ru"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "hr"; MessagesFile: "Languages\Croatian.isl"
Name: "ro"; MessagesFile: "Languages\Romanian.isl"
Name: "fa"; MessagesFile: "Languages\Farsi.isl"
Name: "sr"; MessagesFile: "Languages\SerbianCyrillic.isl"
Name: "sv"; MessagesFile: "Languages\Swedish.isl"
Name: "tr"; MessagesFile: "Languages\Turkish.isl"

[Registry]
Root: HKLM; Subkey: "Software\Zenden.ws\Image Uploader"; ValueType: string; ValueName: "DataPath"; ValueData: "{code:GetDataFolder}\Image Uploader\"; 
;Tasks: common;  ;
;Root: HKCU; Subkey: "Software\Zenden.ws\Image Uploader"; ValueType: string; ValueName: "DataPath"; ValueData: "{code:GetDataFolder}\Image Uploader"; Tasks: installuser; 

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1
Name: "installffmpeg"; Description: "Install FFmpeg libraries (better video formats support)"; Flags: unchecked
;Name: common; Description: All users; GroupDescription: Install for:; Flags: exclusive
;Name: installuser; Description: The current user only; GroupDescription: Install for:; Flags: exclusive unchecked
[Dirs]
Name: "{code:GetDataFolder}\Image Uploader\Thumbnails"; Permissions: users-modify
Name: "{code:GetDataFolder}\Image Uploader\Servers"; Permissions: users-modify

[Files]
Source: "..\Build\release optimized\Image Uploader.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Build\release optimized\curl-ca-bundle.crt"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Lang\*.lng"; Excludes: "default.*"; DestDir: "{app}\Lang"; Flags: ignoreversion
Source: "..\Build\release optimized\Modules\*"; DestDir: "{app}\Modules"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\Docs\*"; DestDir: "{app}\Docs"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "..\Data\servers.xml"; DestDir: "{code:GetDataFolder}\Image Uploader\"; Flags: ignoreversion
Source: "..\Data\template.txt"; DestDir: "{code:GetDataFolder}\Image Uploader\"; Flags: ignoreversion
Source: "..\Data\templates.xml"; DestDir: "{code:GetDataFolder}\Image Uploader\"; Flags: ignoreversion
Source: "..\Data\Favicons\*.ico"; DestDir: "{code:GetDataFolder}\Image Uploader\Favicons"; Flags: ignoreversion
Source: "..\Data\Scripts\*.nut"; DestDir: "{code:GetDataFolder}\Image Uploader\Scripts"; Flags: ignoreversion
Source: "..\Data\Update\iu_core.xml"; DestDir: "{code:GetDataFolder}\Image Uploader\Update"; Flags: ignoreversion
Source: "..\Data\Update\iu_serversinfo.xml"; DestDir: "{code:GetDataFolder}\Image Uploader\Update"; Flags: ignoreversion
Source: "..\Data\Update\iu_ffmpeg.xml"; DestDir: "{tmp}\iu_ffmpeg.xml"; Flags: ignoreversion
Source: "..\Data\Thumbnails\*.*"; DestDir: "{code:GetDataFolder}\Image Uploader\Thumbnails"; Flags: ignoreversion
Source: "unzip.exe"; DestDir: "{tmp}"; Flags: ignoreversion
;Flags: deleteafterinstall
;Source: "..\Data\Servers\*.xml"; DestDir: "{code:GetDataFolder}\Image Uploader\Servers"; Flags: ignoreversion

Source: "..\Build\Release optimized\ExplorerIntegration64.dll";DestDir: "{app}";

#ifdef FFMPEG
Source: "..\Build\release\av*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Build\release\swscale*.dll"; DestDir: "{app}"; Flags: ignoreversion
#endif
Source: "..\Build\release optimized\ExplorerIntegration.dll";DestDir: "{app}";
#ifdef GDIPLUS
Source: "..\Dll\Gdiplus.dll"; DestDir: "{app}"; Flags: ignoreversion
#endif
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon;
;Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon installuser;
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters: "/language={language}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{app}\image uploader.exe"; Parameters: "/uninstall"; Flags: runascurrentuser

[UninstallDelete]
Type: files; Name: "{app}\av*.dll"
Type: files; Name: "{app}\sw*.dll"
Type: files; Name: "{code:GetDataFolder}\Image Uploader\Update\*.xml"
Type: files; Name: "{code:GetDataFolder}\Image Uploader\Favicons\*"
Type: files; Name: "{code:GetDataFolder}\Image Uploader\Scripts\*"

[Code]
function GetDataFolder(Param: String): String;
begin
 //if IsTaskSelected('common') then
    Result := ExpandConstant('{commonappdata}')
 // else
  //  Result := ExpandConstant('{userappdata}')
end;

procedure  InitializeWizard;

begin
      ITD_Init;
     ITD_SetOption('UI_AllowContinue','1');
       ITD_DownloadAfter(wpReady);
  
  
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin

 
end;

procedure CurPageChanged(CurPageID: Integer);
  var Version: TWindowsVersion;
begin
      if CurPageID = wpReady then begin
      ITD_ClearFiles;

       if IsTaskSelected('installffmpeg') then begin
 

    ITD_AddFile('http://dl.bintray.com/zenden/zenden-image-uploader/inst_iu_ffmpeg_1426149762.zip', expandconstant('{tmp}\ffmpeg.zip'));
    // ITD_AddFile('http://dl.bintray.com/zenden/zenden-image-uploader/iu_ffmpeg.xml', expandconstant('{tmp}\iu_ffmpeg.xml'));

    end;
    GetWindowsVersionEx(Version);
   if Version.NTPlatform and
     (Version.Major = 5) 
     and (Version.Minor <1 )  
     then
  begin

    ITD_AddFile('http://dl.bintray.com/zenden/zenden-image-uploader/gdiplus.dll', expandconstant('{tmp}\gdiplus.dll'));
    //http://dl.bintray.com/zenden/zenden-image-uploader/ffmpeg-1.2.12.zip
  
  end;
end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
   var Version: TWindowsVersion;
  ResultCode: integer;
  Cmd: String;
begin

 if CurStep=ssPostInstall then begin
 GetWindowsVersionEx(Version);
   if Version.NTPlatform and
     (Version.Major = 5) 
     and (Version.Minor <1 )  
     then
  begin
  filecopy(expandconstant('{tmp}\gdiplus.dll'),expandconstant('{app}\gdiplus.dll'),false);
  end;

    if IsTaskSelected('installffmpeg') then
    begin
    Cmd :=  ' -o "'+expandconstant('{tmp}\ffmpeg.zip')+'" -d "'+expandconstant('{app}') + '"';
    
          Exec(expandconstant('{tmp}\unzip.exe'),cmd ,expandconstant('{app}'), SW_HIDE, ewWaitUntilTerminated, ResultCode);

         //  MsgBox(GetDataFolder('p') + expandconstant('\Image Uploader\Update\iu_ffmpeg.xml'), mbInformation, MB_OK);

            filecopy(expandconstant('{tmp}\iu_ffmpeg.xml'),GetDataFolder('p') + expandconstant('\Image Uploader\Update\iu_ffmpeg.xml'),false);
    end;
 end;
end;