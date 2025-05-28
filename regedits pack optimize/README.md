# Windows Optimization & Gaming Registry Tweaks

A comprehensive collection of Windows 10/11 registry tweaks for performance optimization, privacy enhancement, system maintenance, and competitive gaming.

## 📋 Table of Contents
- [Features](#-features)
- [Installation](#-installation)
- [Categories](#-categories)
- [Pro Gaming Tweaks](#-pro-gaming-tweaks)
- [Maintenance](#-maintenance)
- [Safety Guidelines](#-safety-guidelines)
- [Restoring Defaults](#-restoring-defaults)
- [Batch Automation](#-batch-automation)
- [Contributing](#-contributing)
- [License](#-license)

## ✨ Features

- **50+ Registry Tweaks** for Windows 10/11
- **Performance Optimization** - Speed up your system
- **Gaming Enhancements** - Reduce input lag and optimize performance
- **Privacy Protection** - Take control of your data
- **System Maintenance** - Keep your system running smoothly
- **Easy to Use** - Simple .reg files and batch automation
- **Completely Reversible** - All changes can be undone

## 📥 Installation

1. **Backup Your Registry**
   - Press `Win + R`, type `regedit`, and press Enter
   - Click `File` > `Export`
   - Select "All" and save the backup

2. **Apply Tweaks**
   - Navigate to the desired category folder
   - Double-click any .reg file to apply
   - Click "Yes" to confirm

3. **Restart**
   - Some changes require a system restart to take effect

## 📂 Categories

### 🔧 Recovery Tools (Run as Administrator)
- `CreateRestorePoint.bat` - Creates a system restore point
- `Emergency_Recovery.bat` - Comprehensive recovery tool for normal mode
- `SafeMode_Recovery.bat` - Recovery tool for Safe Mode

### Performance (1-15)
- 01_OptimizeRAM.reg - Optimizes system memory management
- 02_DisableVisualEffects.reg - Disables unnecessary visual effects
- 03_DisableHibernation.reg - Disables hibernation to save disk space
- ...and more

### Privacy (16-30)
- 16_DisableTelemetry.reg - Disables Windows telemetry
- 17_DisableAdvertising.reg - Disables targeted ads
- 18_DisableLocationTracking.reg - Disables location tracking
- ...and more

### Explorer (31-35)
- 31_DisableRecentFiles.reg - Disables recent files in File Explorer
- 32_DisableSearchHistory.reg - Disables search history
- ...and more

### Services (36-40)
- 36_DisableSuperfetch.reg - Disables Superfetch service
- 37_DisableWindowsSearch.reg - Disables Windows Search
- 38_DisableDiagTrack.reg - Disables Diagnostics Tracking
- 39_DisableWindowsUpdate.reg - Disables automatic updates
- 40_DisableDefender.reg - Disables Windows Defender

### Startup (41-44)
- 41_FastStartup.reg - Enables Fast Startup
- 42_DisableStartupDelay.reg - Removes startup delay
- 43_DisableStartupSound.reg - Disables startup sound
- 44_DisableStartupAnimation.reg - Disables startup animation

### System (45-50)
- 45_DisableErrorReporting.reg - Disables error reporting
- 46_DisableRestorePoints.reg - Disables system restore points
- 47_DisableUAC.reg - Disables User Account Control
- 48_DisableWindowsTips.reg - Disables Windows tips
- 49_DisableWindowsFeedback.reg - Disables feedback prompts
- 50_DisableWindowsTipsAndFeedback.reg - Comprehensive feedback disable

## 🎮 Pro Gaming Tweaks

### 01_DisableMouseAcceleration.reg
- Removes mouse acceleration for consistent aiming
- Disables pointer precision enhancement
- Optimizes mouse movement for FPS games

### 02_ReduceInputDelay.reg
- Optimizes system for minimal input latency
- Configures thread scheduling for gaming
- Reduces background process interference

### 03_OptimizeUSBDevices.reg
- Configures USB devices for maximum performance
- Disables USB selective suspend
- Optimizes USB polling rates

### 04_OptimizeNetworkGaming.reg
- Reduces network latency for online gaming
- Optimizes TCP/IP parameters
- Disables network throttling

### 05_OptimizeGameDVR.reg
- Disables Game DVR and Game Bar
- Reduces background resource usage
- Improves gaming performance

### 99_RevertAll.reg
- Reverts all gaming-related tweaks to default
- Use if you experience any issues
- Safe for competitive gaming (no cheat triggers)

## 🛠️ Maintenance

### M01_CleanTemporaryFiles.reg
- Cleans temporary files on system startup
- Improves system responsiveness
- Frees up disk space

### M02_AutoMaintenance.reg
- Configures automatic system maintenance
- Schedules optimization tasks
- Improves long-term performance

### M03_DiskCleanup.reg
- Configures disk cleanup settings
- Removes unnecessary system files
- Optimizes storage performance

### M04_EventLogCleanup.reg
- Configures event log cleanup
- Prevents log file bloat
- Improves system stability

### M05_AutomaticUpdatesCleanup.reg
- Configures Windows Update cleanup
- Removes old update files
- Frees up disk space

## ⚠️ Safety Guidelines

1. **Backup Your Data** - Always create a system restore point before making changes
2. **Apply Selectively** - Only apply tweaks you understand
3. **Test Individually** - Test tweaks one at a time when possible
4. **Gaming Safety** - All gaming tweaks are safe for competitive play and won't trigger anti-cheat
5. **Have a Recovery Plan** - Know how to boot into Safe Mode and use the recovery tools
6. **Not for Production** - Not recommended for mission-critical systems
7. **Keep Backups** - Maintain recent backups of important data
8. **Use at Your Own Risk** - The authors are not responsible for any issues

## 🔄 Recovery & Safety

### 🛡️ Before Making Changes

#### CreateRestorePoint.bat
- **Always** run this before applying any tweaks
- Creates a system restore point
- Requires administrator privileges
- Provides a safe rollback point

### 🚨 Emergency Recovery

#### Emergency_Recovery.bat
Use this if you experience issues after applying tweaks:
- Revert all tweaks using revert files
- Reset Windows Update components
- Restore default services
- Access System Restore
- Create new restore points

#### SafeMode_Recovery.bat
Use this if you can only boot into Safe Mode:
- Revert all tweaks
- Run System File Checker (SFC)
- Repair Windows image with DISM
- Access Startup Repair
- Return to normal boot mode

### Manual Recovery Options

#### Using Revert Files:
- Each category includes a `99_RevertAll.reg` file
- Double-click to restore defaults for that category
- Restart your computer after applying

#### Manual Registry Restoration:
1. Boot into Safe Mode (F8 during startup)
2. Open Registry Editor (regedit)
3. Click `File` > `Import`
4. Select your backup file
5. Restart your computer

## 🚀 Batch Automation

### apply_all.bat
- Applies all registry tweaks automatically
- Run as administrator for best results
- Progress updates for each category
- Skips revert files by default

To use:
1. Right-click `apply_all.bat`
2. Select "Run as administrator"
3. Follow the on-screen prompts
4. Restart when prompted

### Recovery Tips:
1. Always create a restore point before making changes
2. Test tweaks one at a time when possible
3. If system becomes unstable, boot into Safe Mode and run SafeMode_Recovery.bat
4. Keep a backup of important data
5. Document any custom changes you make

## 🤝 Contributing

We welcome contributions to improve these tweaks! Please follow these steps:

1. Fork the repository
2. Create a new branch for your changes
3. Test your changes thoroughly
4. Update documentation if needed
5. Submit a pull request with a clear description

### Guidelines:
- Keep tweaks safe and reversible
- Include detailed comments in .reg files
- Test changes on multiple Windows versions
- Follow the existing naming and formatting conventions

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

💡 **Note**: These tweaks are provided as-is. Always create a system restore point before applying any registry changes.
