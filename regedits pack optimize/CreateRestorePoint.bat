@echo off
echo Creating System Restore Point...

echo This will create a system restore point before applying any tweaks.
echo You'll need to run this as Administrator.
echo.
pause

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges!
) else (
    echo This script requires administrator privileges. Please run as administrator.
    pause
    exit /b 1
)

:: Create a system restore point
echo Creating System Restore Point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Windows Tweaks", 100, 7

if %errorlevel% EQU 0 (
    echo System Restore Point created successfully!
    echo You can now safely apply the tweaks.
) else (
    echo Failed to create System Restore Point.
    echo Please create one manually before proceeding.
)

echo.
echo 1. Press any key to open System Restore...
echo 2. Or close this window to continue without opening System Restore.
pause >nul

:: Open System Restore UI
control /name Microsoft.Recovery

exit /b 0
