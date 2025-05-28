@echo off
:: Safe Mode Recovery Tool for Windows Optimization Tweaks
:: Use this when you can only boot into Safe Mode

echo =========================================
echo    SAFE MODE RECOVERY TOOL
echo    ----------------------
echo    This tool helps you recover when you can only boot into Safe Mode.
echo =========================================
echo.

echo [WARNING] This tool should only be used if your system is not booting properly.
echo.

:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrator privileges!
) else (
    echo This script requires administrator privileges.
    echo Please right-click and select 'Run as administrator'.
    pause
    exit /b 1
)

:menu
cls
echo =========================================
echo    SAFE MODE RECOVERY OPTIONS
echo =========================================
echo.
echo [1] Revert All Tweaks (Using Revert Files)
echo [2] Run System File Checker (SFC)
echo [3] Run DISM to repair Windows image
echo [4] Boot into Startup Repair
echo [5] Open System Restore
echo [6] Exit to Safe Mode Command Prompt
echo [7] Restart Computer (Normal Mode)
echo.
set /p choice="Enter your choice (1-7): "

goto :menu_%choice% 2>nul

:menu_1
    echo.
    echo [WARNING] This will revert all applied tweaks using the revert files.
    set /p confirm=Are you sure you want to continue? (Y/N): 
    if /i "%confirm%"=="Y" (
        echo Reverting all tweaks...
        
        REM Run all revert files in subdirectories
        for /r %%F in (99_RevertAll.reg) do (
            echo Applying %%F...
            regedit /s "%%F"
        )
        
        echo.
        echo [SUCCESS] All tweaks have been reverted.
        echo Please restart your computer for changes to take effect.
    )
    pause
    goto menu

:menu_2
    echo.
    echo Running System File Checker (SFC) to repair system files...
    echo This may take some time. Please wait...
    echo.
    sfc /scannow
    echo.
    echo [COMPLETE] System File Checker has finished.
    echo Check the results above for any issues.
    pause
    goto menu

:menu_3
    echo.
    echo Running DISM to repair the Windows image...
    echo This may take some time. Please wait...
    echo.
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    echo [COMPLETE] DISM repair has finished.
    echo Check the results above for any issues.
    echo.
    echo It's recommended to run SFC again after DISM.
    pause
    goto menu

:menu_4
    echo.
    echo [WARNING] This will restart your computer into Startup Repair.
    echo Make sure to save any open work before continuing.
    set /p confirm=Are you sure you want to continue? (Y/N): 
    if /i "%confirm%"=="Y" (
        echo Restarting into Startup Repair...
        reagentc /boottore
        shutdown /r /f /t 5
        echo Your computer will restart in 5 seconds...
        timeout /t 5
    )
    goto menu

:menu_5
    echo.
    echo Opening System Restore...
    rstrui.exe
    goto menu

:menu_6
    echo.
    echo Exiting to Safe Mode Command Prompt...
    pause
    exit /b 0

:menu_7
    echo.
    echo [WARNING] This will restart your computer in normal mode.
    set /p confirm=Are you sure you want to continue? (Y/N): 
    if /i "%confirm%"=="Y" (
        bcdedit /deletevalue {current} safeboot
        shutdown /r /t 5
        echo Your computer will restart in 5 seconds...
        timeout /t 5
    )
    goto menu

:invalid
    echo Invalid choice. Please try again.
    pause
    goto menu
