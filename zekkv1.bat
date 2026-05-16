@echo off
title ZEK V.1 Optimizer - Windows 10 Optimizer
setlocal enabledelayedexpansion

:: Check administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    color 0D
    echo.
    echo  ========================================================
    echo.
    echo                    ADMINISTRATOR REQUIRED
    echo.
    echo  ========================================================
    echo.
    echo  This script needs to be run as Administrator
    echo  to work properly.
    echo.
    echo  Right-click on the .bat file and select
    echo  "Run as administrator"
    echo.
    echo  ========================================================
    echo.
    pause
    exit
)

:START
cls
color 09
echo.
echo  ========================================================
echo.
echo                     ZEK V.1 OPTIMIZER
echo.
echo  ========================================================
echo             WINDOWS 10 OPTIMIZER - MAIN MENU
echo  ========================================================
echo.
echo    1. Basic System Optimizations
echo    2. Disable Unnecessary Services
echo    3. Reduce Background Processes
echo    4. Privacy Configuration
echo    5. System Cleanup
echo    6. Advanced Optimizations
echo    7. Restore Points
echo    8. System Information
echo    9. Exit
echo.
echo  ========================================================
echo.
set /p "option=  ZEK V.1 - Select an option [1-9]: "

if "%option%"=="1" goto BASIC
if "%option%"=="2" goto SERVICES
if "%option%"=="3" goto PROCESSES
if "%option%"=="4" goto PRIVACY
if "%option%"=="5" goto CLEANUP
if "%option%"=="6" goto ADVANCED
if "%option%"=="7" goto RESTORE_MENU
if "%option%"=="8" goto SYSINFO
if "%option%"=="9" goto EXIT
goto START

:BASIC
cls
color 0D
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                BASIC SYSTEM OPTIMIZATIONS
echo  ========================================================
echo.
echo    1. Enable Maximum Performance
echo    2. Disable Windows Animations
echo    3. Disable Transparency
echo    4. Optimize Power Plan (High Performance)
echo    5. Disable System Notifications
echo    6. Apply All Basic Optimizations
echo    7. Return to Main Menu
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-7]: "

if "%option%"=="1" goto MAXPERFORMANCE
if "%option%"=="2" goto ANIMATIONS
if "%option%"=="3" goto TRANSPARENCY
if "%option%"=="4" goto POWERPLAN
if "%option%"=="5" goto NOTIFICATIONS
if "%option%"=="6" goto APPLYBASIC
if "%option%"=="7" goto START
goto BASIC

:MAXPERFORMANCE
cls
color 0D
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                ENABLE MAXIMUM PERFORMANCE
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes, create restore point
echo    2. No, continue without restore
echo    3. Cancel and go back
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto MAXPERFORMANCE_WITH_RESTORE
if "%option%"=="2" goto MAXPERFORMANCE_APPLY
if "%option%"=="3" goto BASIC
goto MAXPERFORMANCE

:MAXPERFORMANCE_WITH_RESTORE
cls
color 0D
echo Creating restore point before continuing...
call :CREATE_RESTORE_POINT "Before Maximum Performance"
if !point_created! equ 0 (
    echo.
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto BASIC
)

:MAXPERFORMANCE_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Applying maximum performance configuration...
echo  ========================================================
echo.
echo  [1/3] Configuring visual effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo  [2/3] Adjusting system performance...
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f >nul 2>&1

echo  [3/3] Optimizing background processes...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f >nul 2>&1

echo.
echo  ========================================================
echo      [OK] Maximum performance configuration applied!
echo  ========================================================
echo.
pause
goto BASIC

:ANIMATIONS
cls
color 0D
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                DISABLE WINDOWS ANIMATIONS
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes, create restore point
echo    2. No, continue without restore
echo    3. Cancel and go back
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto ANIMATIONS_WITH_RESTORE
if "%option%"=="2" goto ANIMATIONS_APPLY
if "%option%"=="3" goto BASIC
goto ANIMATIONS

:ANIMATIONS_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Before Disabling Animations"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto BASIC
)

:ANIMATIONS_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Windows animations...
echo  ========================================================
echo.
echo  [1/4] Disabling window animations...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012078010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo  [2/4] Disabling taskbar animations...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1

echo  [3/4] Disabling startup animations...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableBalloonTips /t REG_DWORD /d 0 /f >nul 2>&1

echo  [4/4] Disabling transition effects...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo.
echo  ========================================================
echo        [OK] Animations disabled successfully!
echo  ========================================================
echo.
pause
goto BASIC

:TRANSPARENCY
cls
color 0D
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   DISABLE TRANSPARENCY
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes, create restore point
echo    2. No, continue without restore
echo    3. Cancel and go back
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto TRANSPARENCY_WITH_RESTORE
if "%option%"=="2" goto TRANSPARENCY_APPLY
if "%option%"=="3" goto BASIC
goto TRANSPARENCY

:TRANSPARENCY_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Before Disabling Transparency"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto BASIC
)

:TRANSPARENCY_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling transparency effects...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo  ========================================================
echo        [OK] Transparency disabled successfully!
echo  ========================================================
echo.
pause
goto BASIC

:POWERPLAN
cls
color 0D
echo.
echo  ========================================================
echo                    ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   OPTIMIZE POWER PLAN
echo  ========================================================
echo.
echo  Configuring High Performance power plan...
echo  (No restore point required for this change)
echo.
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo  [OK] Power plan set to High Performance!
echo.
pause
goto BASIC

:NOTIFICATIONS
cls
color 0D
echo.
echo  ========================================================
echo                    ZEK V.1 OPTIMIZER
echo  ========================================================
echo               DISABLE SYSTEM NOTIFICATIONS
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes, create restore point
echo    2. No, continue without restore
echo    3. Cancel and go back
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto NOTIFICATIONS_WITH_RESTORE
if "%option%"=="2" goto NOTIFICATIONS_APPLY
if "%option%"=="3" goto BASIC
goto NOTIFICATIONS

:NOTIFICATIONS_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Before Disabling Notifications"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto BASIC
)

:NOTIFICATIONS_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling system notifications...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo  ========================================================
echo        [OK] Notifications disabled successfully!
echo  ========================================================
echo.
pause
goto BASIC

:APPLYBASIC
cls
color 0D
echo.
echo  ========================================================
echo                    ZEK V.1 OPTIMIZER
echo  ========================================================
echo              APPLY ALL BASIC OPTIMIZATIONS
echo  ========================================================
echo.
echo  All basic changes will be applied.
echo  It is recommended to create a restore point.
echo.
echo    1. Yes, create restore point + apply changes
echo    2. No, apply without restore
echo    3. Cancel and go back
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto APPLYBASIC_WITH_RESTORE
if "%option%"=="2" goto APPLYBASIC_WITHOUT_RESTORE
if "%option%"=="3" goto BASIC
goto APPLYBASIC

:APPLYBASIC_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Before Basic Optimizations"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto BASIC
)

:APPLYBASIC_WITHOUT_RESTORE
cls
color 0B
echo.
echo  ZEK V.1 - Applying ALL basic optimizations...
echo  ========================================================
echo.
echo  [1/5] Configuring maximum performance...
call :MAXPERFORMANCE_DIRECT

echo  [2/5] Disabling animations...
call :ANIMATIONS_DIRECT

echo  [3/5] Disabling transparency...
call :TRANSPARENCY_DIRECT

echo  [4/5] Configuring power plan...
call :POWERPLAN_DIRECT

echo  [5/5] Disabling notifications...
call :NOTIFICATIONS_DIRECT

echo.
echo  ========================================================
echo      [OK] All basic optimizations applied!
echo      It is recommended to restart the system.
echo  ========================================================
echo.
pause
goto START

:SERVICES
cls
color 0E
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo               DISABLE UNNECESSARY SERVICES
echo  ========================================================
echo.
echo    1. Fax Service
echo    2. Maps Service
echo    3. Xbox Live
echo    4. Print Service (if you don't use a printer)
echo    5. Bluetooth (if you don't use Bluetooth)
echo    6. Disable All Services Above
echo    7. Return to Main Menu
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-7]: "

if "%option%"=="1" goto FAX
if "%option%"=="2" goto MAPS
if "%option%"=="3" goto XBOX
if "%option%"=="4" goto PRINT
if "%option%"=="5" goto BLUETOOTH
if "%option%"=="6" goto ALLSERVICES
if "%option%"=="7" goto START
goto SERVICES

:FAX
cls
color 0E
echo.
echo  ========================================================
echo                    ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   DISABLE FAX SERVICE
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto FAX_WITH_RESTORE
if "%option%"=="2" goto FAX_APPLY
if "%option%"=="3" goto SERVICES
goto FAX

:FAX_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Fax Service"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto SERVICES
)

:FAX_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Fax Service...
sc config Fax start= disabled >nul 2>&1
net stop Fax >nul 2>&1
echo  [OK] Fax Service disabled successfully!
echo.
pause
goto SERVICES

:MAPS
cls
color 0E
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                    DISABLE MAPS SERVICE
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto MAPS_WITH_RESTORE
if "%option%"=="2" goto MAPS_APPLY
if "%option%"=="3" goto SERVICES
goto MAPS

:MAPS_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Maps Service"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto SERVICES
)

:MAPS_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Maps Service...
sc config MapsBroker start= disabled >nul 2>&1
net stop MapsBroker >nul 2>&1
echo  [OK] Maps Service disabled successfully!
echo.
pause
goto SERVICES

:XBOX
cls
color 0E
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                     DISABLE XBOX LIVE
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto XBOX_WITH_RESTORE
if "%option%"=="2" goto XBOX_APPLY
if "%option%"=="3" goto SERVICES
goto XBOX

:XBOX_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Xbox Live"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto SERVICES
)

:XBOX_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Xbox services...
sc config XblAuthManager start= disabled >nul 2>&1
sc config XblGameSave start= disabled >nul 2>&1
sc config XboxNetApiSvc start= disabled >nul 2>&1
sc config XboxGipSvc start= disabled >nul 2>&1
net stop XblAuthManager >nul 2>&1
net stop XblGameSave >nul 2>&1
net stop XboxNetApiSvc >nul 2>&1
net stop XboxGipSvc >nul 2>&1
echo  [OK] Xbox services disabled successfully!
echo.
pause
goto SERVICES

:PRINT
cls
color 0E
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                    DISABLE PRINT SERVICE
echo  ========================================================
echo.
echo  WARNING: Only disable this if you do NOT use a printer
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto PRINT_WITH_RESTORE
if "%option%"=="2" goto PRINT_APPLY
if "%option%"=="3" goto SERVICES
goto PRINT

:PRINT_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Print Service"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto SERVICES
)

:PRINT_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Print Service...
sc config Spooler start= disabled >nul 2>&1
net stop Spooler >nul 2>&1
echo  [OK] Print Service disabled!
echo.
pause
goto SERVICES

:BLUETOOTH
cls
color 0E
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                      DISABLE BLUETOOTH
echo  ========================================================
echo.
echo  WARNING: Only if you do NOT use Bluetooth devices
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto BLUETOOTH_WITH_RESTORE
if "%option%"=="2" goto BLUETOOTH_APPLY
if "%option%"=="3" goto SERVICES
goto BLUETOOTH

:BLUETOOTH_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Bluetooth"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto SERVICES
)

:BLUETOOTH_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Bluetooth Service...
sc config bthserv start= disabled >nul 2>&1
sc config BluetoothUserService start= disabled >nul 2>&1
net stop bthserv >nul 2>&1
echo  [OK] Bluetooth disabled successfully!
echo.
pause
goto SERVICES

:ALLSERVICES
cls
color 0E
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                     DISABLE ALL SERVICES
echo  ========================================================
echo.
echo  ALL listed services will be disabled.
echo  It is recommended to create a restore point.
echo.
echo    1. Yes, create restore point + disable
echo    2. No, disable without restore
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto ALLSERVICES_WITH_RESTORE
if "%option%"=="2" goto ALLSERVICES_WITHOUT_RESTORE
if "%option%"=="3" goto SERVICES
goto ALLSERVICES

:ALLSERVICES_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable All Services"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto SERVICES
)

:ALLSERVICES_WITHOUT_RESTORE
cls
color 0B
echo.
echo  ZEK V.1 - Disabling all selected services...
echo  ========================================================
echo.
echo  [1/5] Disabling Fax...
sc config Fax start= disabled >nul 2>&1
net stop Fax >nul 2>&1
echo  [2/5] Disabling Maps...
sc config MapsBroker start= disabled >nul 2>&1
net stop MapsBroker >nul 2>&1
echo  [3/5] Disabling Xbox...
sc config XblAuthManager start= disabled >nul 2>&1
sc config XblGameSave start= disabled >nul 2>&1
sc config XboxNetApiSvc start= disabled >nul 2>&1
sc config XboxGipSvc start= disabled >nul 2>&1
echo  [4/5] Disabling Print...
sc config Spooler start= disabled >nul 2>&1
net stop Spooler >nul 2>&1
echo  [5/5] Disabling Bluetooth...
sc config bthserv start= disabled >nul 2>&1
sc config BluetoothUserService start= disabled >nul 2>&1
net stop bthserv >nul 2>&1
echo.
echo  ========================================================
echo      [OK] All services disabled successfully!
echo      It is recommended to restart the system.
echo  ========================================================
echo.
pause
goto START

:PROCESSES
cls
color 03
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                 REDUCE BACKGROUND PROCESSES
echo  ========================================================
echo.
echo    1. Disable Background Applications
echo    2. Disable SysMain (Superfetch)
echo    3. Disable Windows Search
echo    4. Disable Startup Programs
echo    5. Optimize RAM Usage
echo    6. Apply ALL Process Reductions
echo    7. View Current Processes
echo    8. Return to Main Menu
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-8]: "

if "%option%"=="1" goto APPS_BACKGROUND
if "%option%"=="2" goto SYSMAIN
if "%option%"=="3" goto WSEARCH
if "%option%"=="4" goto STARTUP_PROGS
if "%option%"=="5" goto OPTIMIZE_RAM
if "%option%"=="6" goto ALLPROCESSES
if "%option%"=="7" goto VIEWPROCESSES
if "%option%"=="8" goto START
goto PROCESSES

:APPS_BACKGROUND
cls
color 03
echo.
echo  ========================================================
echo                    ZEK V.1 OPTIMIZER
echo  ========================================================
echo             DISABLE BACKGROUND APPLICATIONS
echo  ========================================================
echo.
echo  This will prevent apps from running in the background
echo  saving RAM and CPU.
echo.
echo    1. Apply changes
echo    2. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto APPS_BACKGROUND_APPLY
if "%option%"=="2" goto PROCESSES
goto APPS_BACKGROUND

:APPS_BACKGROUND_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling background applications...
echo  ========================================================
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f >nul 2>&1

echo  [OK] Background applications disabled!
echo.
pause
goto PROCESSES

:SYSMAIN
cls
color 03
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                DISABLE SYSMAIN (SUPERFETCH)
echo  ========================================================
echo.
echo  SysMain preloads apps in RAM but consumes many resources.
echo  Disabling it frees RAM and reduces processes.
echo.
echo    1. Disable SysMain
echo    2. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto SYSMAIN_APPLY
if "%option%"=="2" goto PROCESSES
goto SYSMAIN

:SYSMAIN_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling SysMain...
sc config SysMain start= disabled >nul 2>&1
net stop SysMain >nul 2>&1
echo  [OK] SysMain disabled successfully!
echo.
pause
goto PROCESSES

:WSEARCH
cls
color 03
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   DISABLE WINDOWS SEARCH
echo  ========================================================
echo.
echo  Windows Search constantly indexes files.
echo  Disabling it reduces CPU and disk usage.
echo.
echo    1. Disable Windows Search
echo    2. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto WSEARCH_APPLY
if "%option%"=="2" goto PROCESSES
goto WSEARCH

:WSEARCH_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Windows Search...
sc config WSearch start= disabled >nul 2>&1
net stop WSearch >nul 2>&1
echo  [OK] Windows Search disabled successfully!
echo.
pause
goto PROCESSES

:STARTUP_PROGS
cls
color 03
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                DISABLE STARTUP PROGRAMS
echo  ========================================================
echo.
echo  Task Manager will open in the Startup tab
echo  so you can disable programs you don't need
echo  when Windows starts.
echo.
echo  Press any key to continue...
pause >nul
start taskmgr /7
echo.
echo  [OK] Task Manager opened.
echo  Go to the "Startup" tab and disable what you don't use.
echo.
pause
goto PROCESSES

:OPTIMIZE_RAM
cls
color 03
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                     OPTIMIZE RAM USAGE
echo  ========================================================
echo.
echo  This will free up standby RAM memory
echo  and optimize system memory management.
echo.
echo    1. Optimize RAM now
echo    2. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto OPTIMIZE_RAM_APPLY
if "%option%"=="2" goto PROCESSES
goto OPTIMIZE_RAM

:OPTIMIZE_RAM_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Optimizing RAM usage...
echo  ========================================================
echo.
echo  [1/3] Freeing standby memory...
powershell -Command "Clear-RecycleBin -Force" >nul 2>&1
powershell -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers()" >nul 2>&1

echo  [2/3] Optimizing memory management...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1

echo  [3/3] Reducing unnecessary processes...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im MicrosoftEdge.exe >nul 2>&1

echo.
echo  ========================================================
echo          [OK] RAM optimized successfully!
echo  ========================================================
echo.
pause
goto PROCESSES

:ALLPROCESSES
cls
color 03
echo.
echo  ========================================================
echo                       ZEK V.1 OPTIMIZER
echo  ========================================================
echo                 APPLY ALL PROCESS REDUCTIONS
echo  ========================================================
echo.
echo  All process reduction changes will be applied.
echo  It is recommended to create a restore point.
echo.
echo    1. Yes, create restore point + apply changes
echo    2. No, apply without restore
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto ALLPROCESSES_WITH_RESTORE
if "%option%"=="2" goto ALLPROCESSES_WITHOUT_RESTORE
if "%option%"=="3" goto PROCESSES
goto ALLPROCESSES

:ALLPROCESSES_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Process Reduction"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto PROCESSES
)

:ALLPROCESSES_WITHOUT_RESTORE
cls
color 0B
echo.
echo  ZEK V.1 - Applying all process reductions...
echo  ========================================================
echo.
echo  [1/6] Disabling background apps...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f >nul 2>&1

echo  [2/6] Disabling SysMain (Superfetch)...
sc config SysMain start= disabled >nul 2>&1
net stop SysMain >nul 2>&1

echo  [3/6] Disabling Windows Search...
sc config WSearch start= disabled >nul 2>&1
net stop WSearch >nul 2>&1

echo  [4/6] Disabling additional services...
sc config DiagTrack start= disabled >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
sc config WerSvc start= disabled >nul 2>&1
sc config WpnService start= disabled >nul 2>&1
sc config wuauserv start= disabled >nul 2>&1

echo  [5/6] Optimizing memory...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1

echo  [6/6] Closing unnecessary processes...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im MicrosoftEdge.exe >nul 2>&1
taskkill /f /im SkypeApp.exe >nul 2>&1

echo.
echo  ========================================================
echo      [OK] Process reduction applied successfully!
echo      It is recommended to restart the system.
echo  ========================================================
echo.
pause
goto START

:VIEWPROCESSES
cls
color 0B
echo.
echo  ZEK V.1 - List of current processes:
echo  ========================================================
echo.
tasklist | find /c "exe"
echo active processes currently.
echo.
echo  Top 10 processes by memory usage:
tasklist /FI "STATUS eq RUNNING" /FO TABLE /NH | sort /R /+58 | head -10
echo.
pause
goto PROCESSES

:PRIVACY
cls
color 0D
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   PRIVACY CONFIGURATION
echo  ========================================================
echo.
echo    1. Disable Telemetry
echo    2. Disable Cortana
echo    3. Disable Personalized Ads
echo    4. Disable Camera and Microphone Access
echo    5. Apply All Privacy Options
echo    6. Return to Main Menu
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-6]: "

if "%option%"=="1" goto TELEMETRY
if "%option%"=="2" goto CORTANA
if "%option%"=="3" goto ADS
if "%option%"=="4" goto CAMEAMIC
if "%option%"=="5" goto ALLPRIVACY
if "%option%"=="6" goto START
goto PRIVACY

:TELEMETRY
cls
color 0D
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                     DISABLE TELEMETRY
echo  ========================================================
echo.
echo  This prevents Windows from sending usage data.
echo  It is recommended to create a restore point.
echo.
echo    1. Yes, create restore point + disable
echo    2. No, disable without restore
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto TELEMETRY_WITH_RESTORE
if "%option%"=="2" goto TELEMETRY_APPLY
if "%option%"=="3" goto PRIVACY
goto TELEMETRY

:TELEMETRY_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Telemetry"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto PRIVACY
)

:TELEMETRY_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling telemetry and data collection...
echo  ========================================================
echo.
echo  [1/3] Blocking system telemetry...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

echo  [2/3] Disabling user experiences...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo  [3/3] Optimizing configuration...
sc config DiagTrack start= disabled >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1

echo.
echo  ========================================================
echo        [OK] Telemetry disabled successfully!
echo  ========================================================
echo.
pause
goto PRIVACY

:CORTANA
cls
color 0D
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                      DISABLE CORTANA
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto CORTANA_WITH_RESTORE
if "%option%"=="2" goto CORTANA_APPLY
if "%option%"=="3" goto PRIVACY
goto CORTANA

:CORTANA_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Cortana"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto PRIVACY
)

:CORTANA_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Cortana disabled successfully!
echo.
pause
goto PRIVACY

:ADS
cls
color 0D
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   DISABLE PERSONALIZED ADS
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto ADS_WITH_RESTORE
if "%option%"=="2" goto ADS_APPLY
if "%option%"=="3" goto PRIVACY
goto ADS

:ADS_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Ads"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto PRIVACY
)

:ADS_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling personalized ads...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f >nul 2>&1
echo  [OK] Personalized ads disabled!
echo.
pause
goto PRIVACY

:CAMEAMIC
cls
color 0D
echo.
echo  ========================================================
echo                    ZEK V.1 OPTIMIZER
echo  ========================================================
echo          DISABLE CAMERA AND MICROPHONE ACCESS
echo  ========================================================
echo.
echo  WARNING: This restricts global access.
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto CAMEAMIC_WITH_RESTORE
if "%option%"=="2" goto CAMEAMIC_APPLY
if "%option%"=="3" goto PRIVACY
goto CAMEAMIC

:CAMEAMIC_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Restrict Camera and Microphone"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto PRIVACY
)

:CAMEAMIC_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Restricting camera and microphone access...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Deny /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo  [OK] Camera and microphone access restricted!
echo.
pause
goto PRIVACY

:ALLPRIVACY
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo     APPLY ALL PRIVACY OPTIONS
echo  ========================================================
echo.
echo  All privacy changes will be applied.
echo  It is recommended to create a restore point.
echo.
echo    1. Yes, create restore point + apply changes
echo    2. No, apply without restore
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto ALLPRIVACY_WITH_RESTORE
if "%option%"=="2" goto ALLPRIVACY_WITHOUT_RESTORE
if "%option%"=="3" goto PRIVACY
goto ALLPRIVACY

:ALLPRIVACY_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "All Privacy Options"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto PRIVACY
)

:ALLPRIVACY_WITHOUT_RESTORE
cls
color 0B
echo.
echo  ZEK V.1 - Applying all privacy configurations...
echo  ========================================================
echo.
echo  [1/4] Disabling telemetry...
call :TELEMETRY_DIRECT
echo  [2/4] Disabling Cortana...
call :CORTANA_DIRECT
echo  [3/4] Disabling ads...
call :ADS_DIRECT
echo  [4/4] Restricting camera and microphone...
call :CAMEAMIC_DIRECT
echo.
echo  ========================================================
echo      [OK] All privacy options applied!
echo  ========================================================
echo.
pause
goto START

:CLEANUP
cls
color 0A
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo                SYSTEM CLEANUP
echo  ========================================================
echo.
echo    1. Clean Temporary Files
echo    2. Empty Recycle Bin
echo    3. Clear Windows Store Cache
echo    4. Clear History and Cookies
echo    5. Run Full Cleanup
echo    6. Return to Main Menu
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-6]: "

if "%option%"=="1" goto TEMPORARY
if "%option%"=="2" goto RECYCLE
if "%option%"=="3" goto CACHE
if "%option%"=="4" goto HISTORY
if "%option%"=="5" goto FULLCLEANUP
if "%option%"=="6" goto START
goto CLEANUP

:TEMPORARY
cls
color 0B
echo.
echo  ZEK V.1 - Cleaning temporary files...
echo  ========================================================
echo.
echo  [1/4] Cleaning user TEMP folder...
del /q /f /s %TEMP%\* 2>nul
echo  [2/4] Cleaning Windows TEMP folder...
del /q /f /s C:\Windows\Temp\* 2>nul
echo  [3/4] Cleaning Prefetch...
del /q /f /s C:\Windows\Prefetch\* 2>nul
echo  [4/4] Deleting Internet temporary files...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo.
echo  ========================================================
echo      [OK] Temporary files deleted successfully!
echo  ========================================================
echo.
pause
goto CLEANUP

:RECYCLE
cls
color 0B
echo.
echo  ZEK V.1 - Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin 2>nul
echo  [OK] Recycle Bin emptied!
echo.
pause
goto CLEANUP

:CACHE
cls
color 0B
echo.
echo  ZEK V.1 - Clearing Windows Store cache...
wsreset.exe >nul 2>&1
echo  [OK] Windows Store cache cleared!
echo.
pause
goto CLEANUP

:HISTORY
cls
color 0B
echo.
echo  ZEK V.1 - Clearing history and cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
echo  [OK] History and cookies deleted!
echo.
pause
goto CLEANUP

:FULLCLEANUP
cls
color 0B
echo.
echo  ZEK V.1 - Running full system cleanup...
echo  ========================================================
echo.
echo  [1/5] Cleaning temporary files...
del /q /f /s %TEMP%\* 2>nul
del /q /f /s C:\Windows\Temp\* 2>nul
del /q /f /s C:\Windows\Prefetch\* 2>nul

echo  [2/5] Emptying Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin 2>nul

echo  [3/5] Clearing Windows Store cache...
wsreset.exe >nul 2>&1

echo  [4/5] Clearing history and cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

echo  [5/5] Running Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo  ========================================================
echo      [OK] Full cleanup completed successfully!
echo      Disk space has been freed.
echo  ========================================================
echo.
pause
goto START

:ADVANCED
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              ADVANCED OPTIMIZATIONS
echo  ========================================================
echo.
echo    1. Disable Windows Defender (Temporary)
echo    2. Disable Automatic Updates
echo    3. Disable OneDrive
echo    4. Disable Hibernation (frees space)
echo    5. Remove Preinstalled Apps (Bloatware)
echo    6. Repair System Files (SFC)
echo    7. Return to Main Menu
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-7]: "

if "%option%"=="1" goto DEFENDER
if "%option%"=="2" goto UPDATES
if "%option%"=="3" goto ONEDRIVE
if "%option%"=="4" goto HIBERNATION
if "%option%"=="5" goto BLOATWARE
if "%option%"=="6" goto SFC
if "%option%"=="7" goto START
goto ADVANCED

:DEFENDER
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo         DISABLE WINDOWS DEFENDER
echo  ========================================================
echo.
echo  WARNING: Disabling the antivirus is dangerous
echo  It is recommended to create a restore point
echo.
echo    1. Yes, create restore point + disable
echo    2. No, disable without restore
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto DEFENDER_WITH_RESTORE
if "%option%"=="2" goto DEFENDER_APPLY
if "%option%"=="3" goto ADVANCED
goto DEFENDER

:DEFENDER_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable Windows Defender"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto ADVANCED
)

:DEFENDER_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Temporarily disabling Windows Defender...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo  [OK] Windows Defender temporarily disabled!
echo  REMEMBER: Re-enable it afterwards to maintain security.
echo.
pause
goto ADVANCED

:UPDATES
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo       DISABLE AUTOMATIC UPDATES
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto UPDATES_WITH_RESTORE
if "%option%"=="2" goto UPDATES_APPLY
if "%option%"=="3" goto ADVANCED
goto UPDATES

:UPDATES_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Configure Updates"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto ADVANCED
)

:UPDATES_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Configuring automatic updates...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f >nul 2>&1
echo  [OK] Automatic updates configured!
echo  Now they will only download when you decide.
echo.
pause
goto ADVANCED

:ONEDRIVE
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              DISABLE ONEDRIVE
echo  ========================================================
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto ONEDRIVE_WITH_RESTORE
if "%option%"=="2" goto ONEDRIVE_APPLY
if "%option%"=="3" goto ADVANCED
goto ONEDRIVE

:ONEDRIVE_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Disable OneDrive"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto ADVANCED
)

:ONEDRIVE_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling OneDrive...
taskkill /f /im OneDrive.exe >nul 2>&1
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f >nul 2>&1
echo  [OK] OneDrive disabled successfully!
echo.
pause
goto ADVANCED

:HIBERNATION
cls
color 0C
echo.
echo  ========================================================
echo                      ZEK V.1 OPTIMIZER
echo  ========================================================
echo                    DISABLE HIBERNATION
echo  ========================================================
echo.
echo  This frees up several GB of disk space.
echo  WARNING: You will lose the option to hibernate.
echo.
echo    1. Disable hibernation and free space
echo    2. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto HIBERNATION_APPLY
if "%option%"=="2" goto ADVANCED
goto HIBERNATION

:HIBERNATION_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Disabling hibernation...
powercfg -h off
echo.
echo  [OK] Hibernation disabled! Disk space freed.
echo.
pause
goto ADVANCED

:BLOATWARE
cls
color 0C
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo            REMOVE PREINSTALLED APPS (BLOATWARE)
echo  ========================================================
echo.
echo  Apps like these will be removed:
echo  - 3D Builder, Skype, Solitaire, etc.
echo.
echo    Do you want to create a restore point first?
echo    1. Yes
echo    2. No
echo    3. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-3]: "

if "%option%"=="1" goto BLOATWARE_WITH_RESTORE
if "%option%"=="2" goto BLOATWARE_APPLY
if "%option%"=="3" goto ADVANCED
goto BLOATWARE

:BLOATWARE_WITH_RESTORE
cls
call :CREATE_RESTORE_POINT "Remove Bloatware"
if !point_created! equ 0 (
    echo WARNING: Could not create restore point.
    set /p "cont=  Do you want to continue anyway? [Y/N]: "
    if /i not "!cont!"=="Y" goto ADVANCED
)

:BLOATWARE_APPLY
cls
color 0B
echo.
echo  ZEK V.1 - Removing preinstalled applications...
echo  This may take several minutes...
echo.
powershell -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingfinance* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingnews* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingsports* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *officehub* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *skypeapp* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage" >nul 2>&1
powershell -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage" >nul 2>&1
echo.
echo  [OK] Bloatware removed successfully!
echo.
pause
goto ADVANCED

:SFC
cls
color 0C
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   REPAIR SYSTEM FILES (SFC)
echo  ========================================================
echo.
echo  This will verify and repair system files.
echo  It may take several minutes.
echo.
echo    1. Run SFC /scannow
echo    2. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto SFC_RUN
if "%option%"=="2" goto ADVANCED
goto SFC

:SFC_RUN
cls
color 0B
echo.
echo  ZEK V.1 - Running system file repair...
echo  This may take several minutes...
echo  ========================================================
echo.
sfc /scannow
echo.
echo  Repair completed.
echo.
pause
goto ADVANCED

:RESTORE_MENU
cls
color 01
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                   SYSTEM RESTORE POINTS
echo  ========================================================
echo.
echo    1. Create restore point NOW
echo    2. Check System Restore status
echo    3. Enable System Restore
echo    4. View existing restore points
echo    5. Return to Main Menu
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-5]: "

if "%option%"=="1" goto CREATE_POINT_NOW
if "%option%"=="2" goto CHECK_STATUS
if "%option%"=="3" goto ENABLE_RESTORE
if "%option%"=="4" goto VIEW_POINTS
if "%option%"=="5" goto START
goto RESTORE_MENU

:CREATE_POINT_NOW
cls
color 09
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                CREATE RESTORE POINT NOW
echo  ========================================================
echo.
call :CREATE_RESTORE_POINT "Manual Point from Optimizer"
if !point_created! equ 1 (
    echo.
    echo  [OK] Restore point created successfully!
) else (
    echo.
    echo  [ERROR] Could not create restore point.
    echo  Check that system protection is enabled.
)
echo.
pause
goto RESTORE_MENU

:CHECK_STATUS
cls
color 09
echo.
echo  ZEK V.1 - Checking System Restore status...
echo  ========================================================
echo.
wmic.exe /Namespace:\\root\default Path SystemRestore Get Disabled /Value | find "Disabled"
echo.
pause
goto RESTORE_MENU

:ENABLE_RESTORE
cls
color 01
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                 ENABLE SYSTEM RESTORE
echo  ========================================================
echo.
echo  This will enable system protection.
echo.
echo    1. Enable System Restore
echo    2. Cancel
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto ENABLE_RESTORE_RUN
if "%option%"=="2" goto RESTORE_MENU
goto ENABLE_RESTORE

:ENABLE_RESTORE_RUN
cls
color 09
echo.
echo  ZEK V.1 - Enabling System Restore...
powershell -Command "Enable-ComputerRestore -Drive 'C:\'" >nul 2>&1
echo.
echo  System Restore enabled.
echo.
pause
goto RESTORE_MENU

:VIEW_POINTS
cls
color 09
echo.
echo  ZEK V.1 - List of existing restore points:
echo  ========================================================
echo.
vssadmin list shadows
echo.
pause
goto RESTORE_MENU

:SYSINFO
cls
color 09
echo.
echo  ========================================================
echo                     ZEK V.1 OPTIMIZER
echo  ========================================================
echo                     SYSTEM INFORMATION
echo  ========================================================
echo.
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"Processor(s)" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"Disk Space"
echo.
echo  ========================================================
echo.
pause
goto START

:CREATE_RESTORE_POINT
set "description=%~1"
set point_created=0
echo ZEK V.1 - Creating restore point: "%description%"
echo.

:: Check if system restore is enabled
wmic.exe /Namespace:\\root\default Path SystemRestore Get Disabled | find "0" >nul
if %errorlevel% neq 0 (
    echo WARNING: System Restore is not enabled.
    echo Attempting to enable...
    powershell -Command "Enable-ComputerRestore -Drive 'C:\'" >nul 2>&1
)

:: Create restore point
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%description%", 100, 7 >nul 2>&1

if %errorlevel% equ 0 (
    set point_created=1
    echo [OK] Restore point created: %description%
) else (
    set point_created=0
    echo [ERROR] Could not create restore point
)

exit /b

:: Direct functions (without asking)
:MAXPERFORMANCE_DIRECT
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f >nul 2>&1
exit /b

:ANIMATIONS_DIRECT
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012078010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:TRANSPARENCY_DIRECT
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:POWERPLAN_DIRECT
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
exit /b

:NOTIFICATIONS_DIRECT
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:TELEMETRY_DIRECT
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:CORTANA_DIRECT
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:ADS_DIRECT
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:CAMEAMIC_DIRECT
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Deny /f >nul 2>&1
exit /b

:EXIT
cls
color 0D
echo.
echo  ========================================================
echo.
echo                     ZEK V.1 OPTIMIZER
echo.
echo  ========================================================
echo     Thank you for using the Windows Optimizer!
echo.
echo  It is recommended to restart the system to apply
echo  all changes correctly.
echo.
echo  Do you want to restart now?
echo    1. Yes, restart now
echo    2. No, exit without restarting
echo.
echo  ========================================================
echo.
set /p "option=  Select an option [1-2]: "

if "%option%"=="1" goto RESTART
if "%option%"=="2" goto EXIT_WITHOUT_RESTART
goto EXIT

:RESTART
echo.
echo  ZEK V.1 - The system will restart in 5 seconds...
shutdown /r /t 5 /c "Restart scheduled by ZEK V.1 Optimizer"
echo.
pause
exit

:EXIT_WITHOUT_RESTART
echo.
echo  ZEK V.1 - Exiting Optimizer...
echo  Remember to restart manually to apply all changes.
echo.
pause
exit
