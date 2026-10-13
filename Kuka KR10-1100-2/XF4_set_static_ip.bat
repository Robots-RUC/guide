@echo off
setlocal

set "ADAPTER=Ethernet"
set "IP=172.31.1.4"
set "MASK=255.255.255.0"

:: Check for administrator rights, and relaunch elevated if needed
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Setting static IP on "%ADAPTER%": %IP% / %MASK%
netsh interface ip set address name="%ADAPTER%" static %IP% %MASK%

if %errorlevel% neq 0 (
    echo.
    echo Failed. Check that the adapter name "%ADAPTER%" is correct.
    echo Run "netsh interface show interface" to list adapter names.
) else (
    echo Done.
)

echo.
pause
endlocal
