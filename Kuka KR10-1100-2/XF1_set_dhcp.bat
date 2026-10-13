@echo off
setlocal

set "ADAPTER=Ethernet"

:: Check for administrator rights, and relaunch elevated if needed
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo Switching "%ADAPTER%" to automatic IP (DHCP)...
netsh interface ip set address name="%ADAPTER%" dhcp
netsh interface ip set dns name="%ADAPTER%" dhcp

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
