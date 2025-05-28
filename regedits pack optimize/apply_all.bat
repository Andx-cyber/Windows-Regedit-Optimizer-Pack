@echo off
setlocal enabledelayedexpansion

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs" >nul 2>&1
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:: Main script starts here
echo =========================================
echo    Windows Optimization Registry Tweaks
echo    Applying all registry tweaks...
echo =========================================
echo.

:: Function to apply all .reg files in a directory
:ApplyRegFiles
set "folder=%~1"
set "folder_name=%~2"

echo Applying %folder_name% tweaks...

if not exist "%folder%" (
    echo Folder "%folder%" not found, skipping...
    echo.
    goto :eof
)

set count=0
for %%f in ("%folder%\*.reg") do (
    if /i not "%%~nxf"=="99_RevertAll.reg" (
        echo [%folder_name%] Applying %%~nxf...
        regedit /s "%%f"
        set /a count+=1
    )
)

echo Applied !count! %folder_name% tweaks.
echo.
goto :eof

:: Apply tweaks from each category
call :ApplyRegFiles "OptimizationTweaks\Performance" "Performance"
call :ApplyRegFiles "OptimizationTweaks\Privacy" "Privacy"
call :ApplyRegFiles "OptimizationTweaks\Explorer" "Explorer"
call :ApplyRegFiles "OptimizationTweaks\Services" "Services"
call :ApplyRegFiles "OptimizationTweaks\Startup" "Startup"
call :ApplyRegFiles "OptimizationTweaks\System" "System"
call :ApplyRegFiles "OptimizationTweaks\Maintenance" "Maintenance"
call :ApplyRegFiles "OptimizationTweaks\ProGamingTweaks" "Pro Gaming"

:: Final message
echo =========================================
echo    All registry tweaks have been applied!
echo    Some changes may require a restart to take effect.
echo =========================================

pause
exit /b 0
