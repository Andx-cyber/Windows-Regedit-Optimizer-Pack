@echo off
:: Emergency Recovery Tool for Windows Optimization Tweaks
:: This script helps restore your system if something goes wrong

:: Check for admin rights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~dpnx0' -Verb RunAs"
    exit /b
)

:menu
cls
echo =========================================
echo    EMERGENCY RECOVERY TOOL
echo    ----------------------
echo    If your PC is not working properly after applying tweaks,
echo    use these options to restore your system.
echo =========================================
echo.
echo [1] Create System Restore Point (Recommended First Step)
echo [2] Revert All Tweaks (Using Revert Files)
echo [3] Reset Windows Update Components
echo [4] Restore Default Services
echo [5] Open System Restore (Advanced)
echo [6] Exit
echo.
set /p choice="Enter your choice (1-6): "

goto :menu_%choice% 2>nul

:menu_1
    echo.
    echo Creating System Restore Point...
    powershell -Command "Checkpoint-Computer -Description 'Before Registry Tweaks Recovery' -RestorePointType MODIFY_SETTINGS"
    if %errorlevel% equ 0 (
        echo.
        echo [SUCCESS] System Restore Point created successfully!
    ) else (
        echo.
        echo [ERROR] Failed to create System Restore Point
    )
    pause
    goto menu

:menu_2
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

:menu_3
    echo.
    echo Resetting Windows Update components...
    echo.
    
    net stop wuauserv
    net stop cryptSvc
    net stop bits
    net stop msiserver
    
    ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
    ren C:\Windows\System32\catroot2 catroot2.old
    
    net start wuauserv
    net start cryptSvc
    net start bits
    net start msiserver
    
    echo.
    echo [SUCCESS] Windows Update components have been reset.
    pause
    goto menu

:menu_4
    echo.
    echo Restoring default services configuration...
    echo.
    
    sc config BFE start= auto
    sc config MpsSvc start= auto
    sc config WinDefend start= auto
    sc config WSearch start= delayed-auto
    sc config WdiSystemHost start= demand
    sc config WdiServiceHost start= demand
    sc config SysMain start= auto
    sc config DiagTrack start= demand
    
    echo [SUCCESS] Default service configuration has been restored.
    echo Some services may require a restart to take effect.
    pause
    goto menu

:menu_5
    echo.
    echo Opening System Restore...
    rstrui.exe
    goto menu

:menu_6
    exit /b 0

:invalid
    echo Invalid choice. Please try again.
    pause
    goto menu
