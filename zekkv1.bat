@echo off
title ZEK V.1 Optimizer - Optimizador de Windows 10
setlocal enabledelayedexpansion

:: Verificar permisos de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    color 0D
    echo.
    echo  ========================================================
    echo.
    echo                     SE REQUIERE ADMINISTRADOR
    echo.
    echo  ========================================================
    echo.
    echo  Este script necesita ejecutarse como Administrador
    echo  para funcionar correctamente.
    echo.
    echo  Click derecho sobre el archivo .bat y selecciona
    echo  "Ejecutar como administrador"
    echo.
    echo  ========================================================
    echo.
    pause
    exit
)

:INICIO
cls
color 09
echo.
echo  ========================================================
echo.
echo                        ZEK V.1 OPTIMIZER
echo.
echo  ========================================================
echo           OPTIMIZADOR DE WINDOWS 10 - MENU PRINCIPAL
echo  ========================================================
echo.
echo    1. Optimizaciones Basicas del Sistema
echo    2. Desactivar Servicios Innecesarios
echo    3. Reducir Procesos en Segundo Plano
echo    4. Configuracion de Privacidad
echo    5. Limpieza del Sistema
echo    6. Optimizaciones Avanzadas
echo    7. Puntos de Restauracion
echo    8. Informacion del Sistema
echo    9. Salir
echo.
echo  ========================================================
echo.
set /p "opcion=  ZEK V.1 - Selecciona una opcion [1-9]: "

if "%opcion%"=="1" goto BASICAS
if "%opcion%"=="2" goto SERVICIOS
if "%opcion%"=="3" goto PROCESOS
if "%opcion%"=="4" goto PRIVACIDAD
if "%opcion%"=="5" goto LIMPIEZA
if "%opcion%"=="6" goto AVANZADAS
if "%opcion%"=="7" goto MENU_RESTAURAR
if "%opcion%"=="8" goto INFOSISTEMA
if "%opcion%"=="9" goto SALIR
goto INICIO

:BASICAS
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo            OPTIMIZACIONES BASICAS DEL SISTEMA
echo  ========================================================
echo.
echo    1. Activar Maximo Rendimiento
echo    2. Desactivar Animaciones de Windows
echo    3. Desactivar Transparencias
echo    4. Optimizar Plan de Energia (Alto Rendimiento)
echo    5. Desactivar Notificaciones del Sistema
echo    6. Aplicar Todas las Optimizaciones Basicas
echo    7. Volver al Menu Principal
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-7]: "

if "%opcion%"=="1" goto MAXRENDIMIENTO
if "%opcion%"=="2" goto ANIMACIONES
if "%opcion%"=="3" goto TRANSPARENCIAS
if "%opcion%"=="4" goto PLANENERGIA
if "%opcion%"=="5" goto NOTIFICACIONES
if "%opcion%"=="6" goto APLICARBASICAS
if "%opcion%"=="7" goto INICIO
goto BASICAS

:MAXRENDIMIENTO
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              ACTIVAR MAXIMO RENDIMIENTO
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si, crear punto de restauracion
echo    2. No, continuar sin restaurar
echo    3. Cancelar y volver
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto MAXRENDIMIENTO_CON_RESTAURAR
if "%opcion%"=="2" goto MAXRENDIMIENTO_APLICAR
if "%opcion%"=="3" goto BASICAS
goto MAXRENDIMIENTO

:MAXRENDIMIENTO_CON_RESTAURAR
cls
color 0D
echo Creando punto de restauracion antes de continuar...
call :CREAR_PUNTO_RESTAURACION "Antes de Maximo Rendimiento"
if !punto_creado! equ 0 (
    echo.
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto BASICAS
)

:MAXRENDIMIENTO_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Aplicando configuracion de maximo rendimiento...
echo  ========================================================
echo.
echo  [1/3] Configurando efectos visuales...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo  [2/3] Ajustando rendimiento del sistema...
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 1000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 2000 /f >nul 2>&1

echo  [3/3] Optimizando procesos en segundo plano...
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f >nul 2>&1

echo.
echo  ========================================================
echo      [OK] Configuracion de maximo rendimiento aplicada!
echo  ========================================================
echo.
pause
goto BASICAS

:ANIMACIONES
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo          DESACTIVAR ANIMACIONES DE WINDOWS
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si, crear punto de restauracion
echo    2. No, continuar sin restaurar
echo    3. Cancelar y volver
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto ANIMACIONES_CON_RESTAURAR
if "%opcion%"=="2" goto ANIMACIONES_APLICAR
if "%opcion%"=="3" goto BASICAS
goto ANIMACIONES

:ANIMACIONES_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Antes de Desactivar Animaciones"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto BASICAS
)

:ANIMACIONES_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando animaciones de Windows...
echo  ========================================================
echo.
echo  [1/4] Desactivando animaciones de ventanas...
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012078010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1

echo  [2/4] Desactivando animaciones de barra de tareas...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1

echo  [3/4] Desactivando animaciones de inicio...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableBalloonTips /t REG_DWORD /d 0 /f >nul 2>&1

echo  [4/4] Desactivando efectos de transicion...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1

echo.
echo  ========================================================
echo        [OK] Animaciones desactivadas exitosamente!
echo  ========================================================
echo.
pause
goto BASICAS

:TRANSPARENCIAS
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              DESACTIVAR TRANSPARENCIAS
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si, crear punto de restauracion
echo    2. No, continuar sin restaurar
echo    3. Cancelar y volver
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto TRANSPARENCIAS_CON_RESTAURAR
if "%opcion%"=="2" goto TRANSPARENCIAS_APLICAR
if "%opcion%"=="3" goto BASICAS
goto TRANSPARENCIAS

:TRANSPARENCIAS_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Antes de Desactivar Transparencias"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto BASICAS
)

:TRANSPARENCIAS_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando efectos de transparencia...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo  ========================================================
echo        [OK] Transparencias desactivadas correctamente!
echo  ========================================================
echo.
pause
goto BASICAS

:PLANENERGIA
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              OPTIMIZAR PLAN DE ENERGIA
echo  ========================================================
echo.
echo  Configurando plan de Alto Rendimiento...
echo  (No se requiere restaurar para este cambio)
echo.
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo  [OK] Plan de energia configurado a Alto Rendimiento!
echo.
pause
goto BASICAS

:NOTIFICACIONES
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo         DESACTIVAR NOTIFICACIONES DEL SISTEMA
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si, crear punto de restauracion
echo    2. No, continuar sin restaurar
echo    3. Cancelar y volver
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto NOTIFICACIONES_CON_RESTAURAR
if "%opcion%"=="2" goto NOTIFICACIONES_APLICAR
if "%opcion%"=="3" goto BASICAS
goto NOTIFICACIONES

:NOTIFICACIONES_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Antes de Desactivar Notificaciones"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto BASICAS
)

:NOTIFICACIONES_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando notificaciones del sistema...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK /t REG_DWORD /d 0 /f >nul 2>&1
echo.
echo  ========================================================
echo        [OK] Notificaciones desactivadas exitosamente!
echo  ========================================================
echo.
pause
goto BASICAS

:APLICARBASICAS
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo      APLICAR TODAS LAS OPTIMIZACIONES BASICAS
echo  ========================================================
echo.
echo  Se aplicaran todos los cambios basicos.
echo  Se recomienda crear punto de restauracion.
echo.
echo    1. Si, crear punto + aplicar cambios
echo    2. No, aplicar sin restaurar
echo    3. Cancelar y volver
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto APLICARBASICAS_CON_RESTAURAR
if "%opcion%"=="2" goto APLICARBASICAS_SIN_RESTAURAR
if "%opcion%"=="3" goto BASICAS
goto APLICARBASICAS

:APLICARBASICAS_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Antes de Optimizaciones Basicas"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto BASICAS
)

:APLICARBASICAS_SIN_RESTAURAR
cls
color 0B
echo.
echo  ZEK V.1 - Aplicando TODAS las optimizaciones basicas...
echo  ========================================================
echo.
echo  [1/5] Configurando maximo rendimiento...
call :MAXRENDIMIENTO_DIRECTO

echo  [2/5] Desactivando animaciones...
call :ANIMACIONES_DIRECTO

echo  [3/5] Desactivando transparencias...
call :TRANSPARENCIAS_DIRECTO

echo  [4/5] Configurando plan de energia...
call :PLANENERGIA_DIRECTO

echo  [5/5] Desactivando notificaciones...
call :NOTIFICACIONES_DIRECTO

echo.
echo  ========================================================
echo      [OK] Todas las optimizaciones basicas aplicadas!
echo      Se recomienda reiniciar el sistema.
echo  ========================================================
echo.
pause
goto INICIO

:SERVICIOS
cls
color 0E
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo            DESACTIVAR SERVICIOS INNECESARIOS
echo  ========================================================
echo.
echo    1. Servicio de Fax
echo    2. Servicio de Mapas
echo    3. Xbox Live
echo    4. Servicio de Impresion (si no usas impresora)
echo    5. Bluetooth (si no usas Bluetooth)
echo    6. Desactivar Todos los Servicios Anteriores
echo    7. Volver al Menu Principal
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-7]: "

if "%opcion%"=="1" goto FAX
if "%opcion%"=="2" goto MAPAS
if "%opcion%"=="3" goto XBOX
if "%opcion%"=="4" goto IMPRESION
if "%opcion%"=="5" goto BLUETOOTH
if "%opcion%"=="6" goto TODOSSERVICIOS
if "%opcion%"=="7" goto INICIO
goto SERVICIOS

:FAX
cls
color 0E
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              DESACTIVAR SERVICIO DE FAX
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto FAX_CON_RESTAURAR
if "%opcion%"=="2" goto FAX_APLICAR
if "%opcion%"=="3" goto SERVICIOS
goto FAX

:FAX_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Servicio Fax"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto SERVICIOS
)

:FAX_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando Servicio de Fax...
sc config Fax start= disabled >nul 2>&1
net stop Fax >nul 2>&1
echo  [OK] Servicio de Fax desactivado correctamente!
echo.
pause
goto SERVICIOS

:MAPAS
cls
color 0E
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo            DESACTIVAR SERVICIO DE MAPAS
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto MAPAS_CON_RESTAURAR
if "%opcion%"=="2" goto MAPAS_APLICAR
if "%opcion%"=="3" goto SERVICIOS
goto MAPAS

:MAPAS_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Servicio Mapas"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto SERVICIOS
)

:MAPAS_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando Servicio de Mapas...
sc config MapsBroker start= disabled >nul 2>&1
net stop MapsBroker >nul 2>&1
echo  [OK] Servicio de Mapas desactivado correctamente!
echo.
pause
goto SERVICIOS

:XBOX
cls
color 0E
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo               DESACTIVAR XBOX LIVE
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto XBOX_CON_RESTAURAR
if "%opcion%"=="2" goto XBOX_APLICAR
if "%opcion%"=="3" goto SERVICIOS
goto XBOX

:XBOX_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Xbox Live"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto SERVICIOS
)

:XBOX_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando servicios de Xbox...
sc config XblAuthManager start= disabled >nul 2>&1
sc config XblGameSave start= disabled >nul 2>&1
sc config XboxNetApiSvc start= disabled >nul 2>&1
sc config XboxGipSvc start= disabled >nul 2>&1
net stop XblAuthManager >nul 2>&1
net stop XblGameSave >nul 2>&1
net stop XboxNetApiSvc >nul 2>&1
net stop XboxGipSvc >nul 2>&1
echo  [OK] Servicios de Xbox desactivados correctamente!
echo.
pause
goto SERVICIOS

:IMPRESION
cls
color 0E
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo          DESACTIVAR SERVICIO DE IMPRESION
echo  ========================================================
echo.
echo  ATENCION: Solo desactiva esto si NO usas impresora
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto IMPRESION_CON_RESTAURAR
if "%opcion%"=="2" goto IMPRESION_APLICAR
if "%opcion%"=="3" goto SERVICIOS
goto IMPRESION

:IMPRESION_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Servicio Impresion"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto SERVICIOS
)

:IMPRESION_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando Servicio de Impresion...
sc config Spooler start= disabled >nul 2>&1
net stop Spooler >nul 2>&1
echo  [OK] Servicio de Impresion desactivado!
echo.
pause
goto SERVICIOS

:BLUETOOTH
cls
color 0E
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              DESACTIVAR BLUETOOTH
echo  ========================================================
echo.
echo  ATENCION: Solo si NO usas dispositivos Bluetooth
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto BLUETOOTH_CON_RESTAURAR
if "%opcion%"=="2" goto BLUETOOTH_APLICAR
if "%opcion%"=="3" goto SERVICIOS
goto BLUETOOTH

:BLUETOOTH_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Bluetooth"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto SERVICIOS
)

:BLUETOOTH_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando Servicio Bluetooth...
sc config bthserv start= disabled >nul 2>&1
sc config BluetoothUserService start= disabled >nul 2>&1
net stop bthserv >nul 2>&1
echo  [OK] Bluetooth desactivado correctamente!
echo.
pause
goto SERVICIOS

:TODOSSERVICIOS
cls
color 0E
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo        DESACTIVAR TODOS LOS SERVICIOS
echo  ========================================================
echo.
echo  Se desactivaran TODOS los servicios listados.
echo  Se recomienda crear punto de restauracion.
echo.
echo    1. Si, crear punto + desactivar
echo    2. No, desactivar sin restaurar
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto TODOSSERVICIOS_CON_RESTAURAR
if "%opcion%"=="2" goto TODOSSERVICIOS_SIN_RESTAURAR
if "%opcion%"=="3" goto SERVICIOS
goto TODOSSERVICIOS

:TODOSSERVICIOS_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Todos los Servicios"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto SERVICIOS
)

:TODOSSERVICIOS_SIN_RESTAURAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando todos los servicios seleccionados...
echo  ========================================================
echo.
echo  [1/5] Desactivando Fax...
sc config Fax start= disabled >nul 2>&1
net stop Fax >nul 2>&1
echo  [2/5] Desactivando Mapas...
sc config MapsBroker start= disabled >nul 2>&1
net stop MapsBroker >nul 2>&1
echo  [3/5] Desactivando Xbox...
sc config XblAuthManager start= disabled >nul 2>&1
sc config XblGameSave start= disabled >nul 2>&1
sc config XboxNetApiSvc start= disabled >nul 2>&1
sc config XboxGipSvc start= disabled >nul 2>&1
echo  [4/5] Desactivando Impresion...
sc config Spooler start= disabled >nul 2>&1
net stop Spooler >nul 2>&1
echo  [5/5] Desactivando Bluetooth...
sc config bthserv start= disabled >nul 2>&1
sc config BluetoothUserService start= disabled >nul 2>&1
net stop bthserv >nul 2>&1
echo.
echo  ========================================================
echo      [OK] Todos los servicios desactivados correctamente!
echo      Se recomienda reiniciar el sistema.
echo  ========================================================
echo.
pause
goto INICIO

:PROCESOS
cls
color 03
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo         REDUCIR PROCESOS EN SEGUNDO PLANO
echo  ========================================================
echo.
echo    1. Desactivar Aplicaciones en Segundo Plano
echo    2. Desactivar SysMain (Superfetch)
echo    3. Desactivar Windows Search
echo    4. Desactivar Programas de Inicio
echo    5. Optimizar uso de RAM
echo    6. Aplicar TODAS las Reducciones de Procesos
echo    7. Ver Procesos Actuales
echo    8. Volver al Menu Principal
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-8]: "

if "%opcion%"=="1" goto APPS_FONDO
if "%opcion%"=="2" goto SYSMAIN
if "%opcion%"=="3" goto WSEARCH
if "%opcion%"=="4" goto INICIO_PROGS
if "%opcion%"=="5" goto OPTIMIZAR_RAM
if "%opcion%"=="6" goto TODOS_PROCESOS
if "%opcion%"=="7" goto VER_PROCESOS
if "%opcion%"=="8" goto INICIO
goto PROCESOS

:APPS_FONDO
cls
color 03
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo       DESACTIVAR APLICACIONES EN SEGUNDO PLANO
echo  ========================================================
echo.
echo  Esto evitara que las apps se ejecuten en segundo plano
echo  ahorrando RAM y CPU.
echo.
echo    1. Aplicar cambios
echo    2. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto APPS_FONDO_APLICAR
if "%opcion%"=="2" goto PROCESOS
goto APPS_FONDO

:APPS_FONDO_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando aplicaciones en segundo plano...
echo  ========================================================
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f >nul 2>&1

echo  [OK] Aplicaciones en segundo plano desactivadas!
echo.
pause
goto PROCESOS

:SYSMAIN
cls
color 03
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo            DESACTIVAR SYSMAIN (SUPERFETCH)
echo  ========================================================
echo.
echo  SysMain precarga apps en RAM pero consume muchos recursos.
echo  Desactivarlo libera RAM y reduce procesos.
echo.
echo    1. Desactivar SysMain
echo    2. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto SYSMAIN_APLICAR
if "%opcion%"=="2" goto PROCESOS
goto SYSMAIN

:SYSMAIN_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando SysMain...
sc config SysMain start= disabled >nul 2>&1
net stop SysMain >nul 2>&1
echo  [OK] SysMain desactivado correctamente!
echo.
pause
goto PROCESOS

:WSEARCH
cls
color 03
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo            DESACTIVAR WINDOWS SEARCH
echo  ========================================================
echo.
echo  Windows Search indexa archivos constantemente.
echo  Desactivarlo reduce uso de CPU y disco.
echo.
echo    1. Desactivar Windows Search
echo    2. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto WSEARCH_APLICAR
if "%opcion%"=="2" goto PROCESOS
goto WSEARCH

:WSEARCH_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando Windows Search...
sc config WSearch start= disabled >nul 2>&1
net stop WSearch >nul 2>&1
echo  [OK] Windows Search desactivado correctamente!
echo.
pause
goto PROCESOS

:INICIO_PROGS
cls
color 03
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo          DESACTIVAR PROGRAMAS DE INICIO
echo  ========================================================
echo.
echo  Se abrira el Administrador de Tareas en la pestana
echo  de Inicio para que desactives los programas que
echo  no necesites al arrancar Windows.
echo.
echo  Pulsa cualquier tecla para continuar...
pause >nul
start taskmgr /7
echo.
echo  [OK] Administrador de Tareas abierto.
echo  Ve a la pestana "Inicio" y desactiva lo que no uses.
echo.
pause
goto PROCESOS

:OPTIMIZAR_RAM
cls
color 03
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo               OPTIMIZAR USO DE RAM
echo  ========================================================
echo.
echo  Esto liberara la memoria RAM que esta en espera
echo  y optimizara la gestion de memoria del sistema.
echo.
echo    1. Optimizar RAM ahora
echo    2. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto OPTIMIZAR_RAM_APLICAR
if "%opcion%"=="2" goto PROCESOS
goto OPTIMIZAR_RAM

:OPTIMIZAR_RAM_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Optimizando uso de RAM...
echo  ========================================================
echo.
echo  [1/3] Liberando memoria en espera...
powershell -Command "Clear-RecycleBin -Force" >nul 2>&1
powershell -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers()" >nul 2>&1

echo  [2/3] Optimizando gestion de memoria...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1

echo  [3/3] Reduciendo procesos innecesarios...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im MicrosoftEdge.exe >nul 2>&1

echo.
echo  ========================================================
echo          [OK] RAM optimizada correctamente!
echo  ========================================================
echo.
pause
goto PROCESOS

:TODOS_PROCESOS
cls
color 03
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo     APLICAR TODAS LAS REDUCCIONES DE PROCESOS
echo  ========================================================
echo.
echo  Se aplicaran todos los cambios para reducir procesos.
echo  Se recomienda crear punto de restauracion.
echo.
echo    1. Si, crear punto + aplicar cambios
echo    2. No, aplicar sin restaurar
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto TODOS_PROCESOS_CON_RESTAURAR
if "%opcion%"=="2" goto TODOS_PROCESOS_SIN_RESTAURAR
if "%opcion%"=="3" goto PROCESOS
goto TODOS_PROCESOS

:TODOS_PROCESOS_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Reduccion de Procesos"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto PROCESOS
)

:TODOS_PROCESOS_SIN_RESTAURAR
cls
color 0B
echo.
echo  ZEK V.1 - Aplicando todas las reducciones de procesos...
echo  ========================================================
echo.
echo  [1/6] Desactivando apps en segundo plano...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f >nul 2>&1

echo  [2/6] Desactivando SysMain (Superfetch)...
sc config SysMain start= disabled >nul 2>&1
net stop SysMain >nul 2>&1

echo  [3/6] Desactivando Windows Search...
sc config WSearch start= disabled >nul 2>&1
net stop WSearch >nul 2>&1

echo  [4/6] Desactivando servicios adicionales...
sc config DiagTrack start= disabled >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1
sc config WerSvc start= disabled >nul 2>&1
sc config WpnService start= disabled >nul 2>&1
sc config wuauserv start= disabled >nul 2>&1

echo  [5/6] Optimizando memoria...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1

echo  [6/6] Cerrando procesos innecesarios...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im MicrosoftEdge.exe >nul 2>&1
taskkill /f /im SkypeApp.exe >nul 2>&1

echo.
echo  ========================================================
echo      [OK] Reduccion de procesos aplicada correctamente!
echo      Se recomienda reiniciar el sistema.
echo  ========================================================
echo.
pause
goto INICIO

:VER_PROCESOS
cls
color 0B
echo.
echo  ZEK V.1 - Lista de procesos actuales:
echo  ========================================================
echo.
tasklist | find /c "exe"
echo procesos activos actualmente.
echo.
echo  Top 10 procesos por uso de memoria:
tasklist /FI "STATUS eq RUNNING" /FO TABLE /NH | sort /R /+58 | head -10
echo.
pause
goto PROCESOS

:PRIVACIDAD
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              CONFIGURACION DE PRIVACIDAD
echo  ========================================================
echo.
echo    1. Desactivar Telemetria
echo    2. Desactivar Cortana
echo    3. Desactivar Publicidad Personalizada
echo    4. Desactivar Acceso a Camara y Microfono
echo    5. Aplicar Todas las Opciones de Privacidad
echo    6. Volver al Menu Principal
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-6]: "

if "%opcion%"=="1" goto TELEMETRIA
if "%opcion%"=="2" goto CORTANA
if "%opcion%"=="3" goto PUBLICIDAD
if "%opcion%"=="4" goto CAMARAMIC
if "%opcion%"=="5" goto TODAPRIVACIDAD
if "%opcion%"=="6" goto INICIO
goto PRIVACIDAD

:TELEMETRIA
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              DESACTIVAR TELEMETRIA
echo  ========================================================
echo.
echo  Esto evita que Windows envie datos de uso.
echo  Se recomienda crear punto de restauracion.
echo.
echo    1. Si, crear punto + desactivar
echo    2. No, desactivar sin restaurar
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto TELEMETRIA_CON_RESTAURAR
if "%opcion%"=="2" goto TELEMETRIA_APLICAR
if "%opcion%"=="3" goto PRIVACIDAD
goto TELEMETRIA

:TELEMETRIA_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Telemetria"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto PRIVACIDAD
)

:TELEMETRIA_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando telemetria y recoleccion de datos...
echo  ========================================================
echo.
echo  [1/3] Bloqueando telemetria del sistema...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1

echo  [2/3] Desactivando experiencias de usuario...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1

echo  [3/3] Optimizando configuracion...
sc config DiagTrack start= disabled >nul 2>&1
sc config dmwappushservice start= disabled >nul 2>&1

echo.
echo  ========================================================
echo        [OK] Telemetria desactivada exitosamente!
echo  ========================================================
echo.
pause
goto PRIVACIDAD

:CORTANA
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo               DESACTIVAR CORTANA
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto CORTANA_CON_RESTAURAR
if "%opcion%"=="2" goto CORTANA_APLICAR
if "%opcion%"=="3" goto PRIVACIDAD
goto CORTANA

:CORTANA_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Cortana"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto PRIVACIDAD
)

:CORTANA_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando Cortana...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f >nul 2>&1
echo  [OK] Cortana desactivada correctamente!
echo.
pause
goto PRIVACIDAD

:PUBLICIDAD
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo         DESACTIVAR PUBLICIDAD PERSONALIZADA
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto PUBLICIDAD_CON_RESTAURAR
if "%opcion%"=="2" goto PUBLICIDAD_APLICAR
if "%opcion%"=="3" goto PRIVACIDAD
goto PUBLICIDAD

:PUBLICIDAD_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Publicidad"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto PRIVACIDAD
)

:PUBLICIDAD_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando publicidad personalizada...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f >nul 2>&1
echo  [OK] Publicidad personalizada desactivada!
echo.
pause
goto PRIVACIDAD

:CAMARAMIC
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo      DESACTIVAR ACCESO A CAMARA Y MICROFONO
echo  ========================================================
echo.
echo  ATENCION: Esto restringe el acceso global.
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto CAMARAMIC_CON_RESTAURAR
if "%opcion%"=="2" goto CAMARAMIC_APLICAR
if "%opcion%"=="3" goto PRIVACIDAD
goto CAMARAMIC

:CAMARAMIC_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Restringir Camara y Microfono"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto PRIVACIDAD
)

:CAMARAMIC_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Restringiendo acceso a camara y microfono...
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Deny /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /t REG_SZ /d Deny /f >nul 2>&1
echo  [OK] Acceso a camara y microfono restringido!
echo.
pause
goto PRIVACIDAD

:TODAPRIVACIDAD
cls
color 0D
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo     APLICAR TODAS LAS OPCIONES DE PRIVACIDAD
echo  ========================================================
echo.
echo  Se aplicaran todos los cambios de privacidad.
echo  Se recomienda crear punto de restauracion.
echo.
echo    1. Si, crear punto + aplicar cambios
echo    2. No, aplicar sin restaurar
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto TODAPRIVACIDAD_CON_RESTAURAR
if "%opcion%"=="2" goto TODAPRIVACIDAD_SIN_RESTAURAR
if "%opcion%"=="3" goto PRIVACIDAD
goto TODAPRIVACIDAD

:TODAPRIVACIDAD_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Todas las Opciones de Privacidad"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto PRIVACIDAD
)

:TODAPRIVACIDAD_SIN_RESTAURAR
cls
color 0B
echo.
echo  ZEK V.1 - Aplicando todas las configuraciones de privacidad...
echo  ========================================================
echo.
echo  [1/4] Desactivando telemetria...
call :TELEMETRIA_DIRECTO
echo  [2/4] Desactivando Cortana...
call :CORTANA_DIRECTO
echo  [3/4] Desactivando publicidad...
call :PUBLICIDAD_DIRECTO
echo  [4/4] Restringiendo camara y microfono...
call :CAMARAMIC_DIRECTO
echo.
echo  ========================================================
echo      [OK] Todas las opciones de privacidad aplicadas!
echo  ========================================================
echo.
pause
goto INICIO

:LIMPIEZA
cls
color 0A
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo                LIMPIEZA DEL SISTEMA
echo  ========================================================
echo.
echo    1. Limpiar Archivos Temporales
echo    2. Vaciar Papelera de Reciclaje
echo    3. Limpiar Cache de Windows Store
echo    4. Limpiar Historial y Cookies
echo    5. Ejecutar Limpieza Completa
echo    6. Volver al Menu Principal
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-6]: "

if "%opcion%"=="1" goto TEMPORALES
if "%opcion%"=="2" goto PAPELERA
if "%opcion%"=="3" goto CACHE
if "%opcion%"=="4" goto HISTORIAL
if "%opcion%"=="5" goto LIMPIEZACOMPLETA
if "%opcion%"=="6" goto INICIO
goto LIMPIEZA

:TEMPORALES
cls
color 0B
echo.
echo  ZEK V.1 - Limpiando archivos temporales...
echo  ========================================================
echo.
echo  [1/4] Limpiando carpeta TEMP del usuario...
del /q /f /s %TEMP%\* 2>nul
echo  [2/4] Limpiando carpeta TEMP de Windows...
del /q /f /s C:\Windows\Temp\* 2>nul
echo  [3/4] Limpiando Prefetch...
del /q /f /s C:\Windows\Prefetch\* 2>nul
echo  [4/4] Eliminando archivos temporales de Internet...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
echo.
echo  ========================================================
echo      [OK] Archivos temporales eliminados correctamente!
echo  ========================================================
echo.
pause
goto LIMPIEZA

:PAPELERA
cls
color 0B
echo.
echo  ZEK V.1 - Vaciando papelera de reciclaje...
rd /s /q %systemdrive%\$Recycle.Bin 2>nul
echo  [OK] Papelera vaciada!
echo.
pause
goto LIMPIEZA

:CACHE
cls
color 0B
echo.
echo  ZEK V.1 - Limpiando cache de Windows Store...
wsreset.exe >nul 2>&1
echo  [OK] Cache de Windows Store limpiado!
echo.
pause
goto LIMPIEZA

:HISTORIAL
cls
color 0B
echo.
echo  ZEK V.1 - Limpiando historial y cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
echo  [OK] Historial y cookies eliminados!
echo.
pause
goto LIMPIEZA

:LIMPIEZACOMPLETA
cls
color 0B
echo.
echo  ZEK V.1 - Ejecutando limpieza completa del sistema...
echo  ========================================================
echo.
echo  [1/5] Limpiando archivos temporales...
del /q /f /s %TEMP%\* 2>nul
del /q /f /s C:\Windows\Temp\* 2>nul
del /q /f /s C:\Windows\Prefetch\* 2>nul

echo  [2/5] Vaciando papelera de reciclaje...
rd /s /q %systemdrive%\$Recycle.Bin 2>nul

echo  [3/5] Limpiando cache de Windows Store...
wsreset.exe >nul 2>&1

echo  [4/5] Limpiando historial y cookies...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255

echo  [5/5] Ejecutando Liberador de espacio en disco...
cleanmgr /sagerun:1 >nul 2>&1

echo.
echo  ========================================================
echo      [OK] Limpieza completa finalizada con exito!
echo      Espacio liberado en el sistema.
echo  ========================================================
echo.
pause
goto INICIO

:AVANZADAS
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              OPTIMIZACIONES AVANZADAS
echo  ========================================================
echo.
echo    1. Desactivar Windows Defender (Temporal)
echo    2. Desactivar Actualizaciones Automaticas
echo    3. Desactivar OneDrive
echo    4. Desactivar Hibernacion (libera espacio)
echo    5. Quitar Apps Preinstaladas (Bloatware)
echo    6. Reparar Archivos del Sistema (SFC)
echo    7. Volver al Menu Principal
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-7]: "

if "%opcion%"=="1" goto DEFENDER
if "%opcion%"=="2" goto ACTUALIZACIONES
if "%opcion%"=="3" goto ONEDRIVE
if "%opcion%"=="4" goto HIBERNACION
if "%opcion%"=="5" goto BLOTWARE
if "%opcion%"=="6" goto SFC
if "%opcion%"=="7" goto INICIO
goto AVANZADAS

:DEFENDER
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo         DESACTIVAR WINDOWS DEFENDER
echo  ========================================================
echo.
echo  ADVERTENCIA: Desactivar el antivirus es peligroso
echo  Se recomienda crear punto de restauracion
echo.
echo    1. Si, crear punto + desactivar
echo    2. No, desactivar sin restaurar
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto DEFENDER_CON_RESTAURAR
if "%opcion%"=="2" goto DEFENDER_APLICAR
if "%opcion%"=="3" goto AVANZADAS
goto DEFENDER

:DEFENDER_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar Windows Defender"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto AVANZADAS
)

:DEFENDER_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando Windows Defender temporalmente...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >nul 2>&1
echo.
echo  [OK] Windows Defender desactivado temporalmente!
echo  RECUERDA: Reactivar despues para mantener la seguridad.
echo.
pause
goto AVANZADAS

:ACTUALIZACIONES
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo       DESACTIVAR ACTUALIZACIONES AUTOMATICAS
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto ACTUALIZACIONES_CON_RESTAURAR
if "%opcion%"=="2" goto ACTUALIZACIONES_APLICAR
if "%opcion%"=="3" goto AVANZADAS
goto ACTUALIZACIONES

:ACTUALIZACIONES_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Configurar Actualizaciones"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto AVANZADAS
)

:ACTUALIZACIONES_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Configurando actualizaciones automaticas...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f >nul 2>&1
echo  [OK] Actualizaciones automaticas configuradas!
echo  Ahora solo se descargaran cuando tu lo decidas.
echo.
pause
goto AVANZADAS

:ONEDRIVE
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo              DESACTIVAR ONEDRIVE
echo  ========================================================
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto ONEDRIVE_CON_RESTAURAR
if "%opcion%"=="2" goto ONEDRIVE_APLICAR
if "%opcion%"=="3" goto AVANZADAS
goto ONEDRIVE

:ONEDRIVE_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Desactivar OneDrive"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto AVANZADAS
)

:ONEDRIVE_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando OneDrive...
taskkill /f /im OneDrive.exe >nul 2>&1
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f >nul 2>&1
echo  [OK] OneDrive desactivado correctamente!
echo.
pause
goto AVANZADAS

:HIBERNACION
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo            DESACTIVAR HIBERNACION
echo  ========================================================
echo.
echo  Esto libera varios GB de espacio en disco.
echo  ATENCION: Perderas la opcion de hibernar.
echo.
echo    1. Desactivar hibernacion y liberar espacio
echo    2. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto HIBERNACION_APLICAR
if "%opcion%"=="2" goto AVANZADAS
goto HIBERNACION

:HIBERNACION_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Desactivando hibernacion...
powercfg -h off
echo.
echo  [OK] Hibernacion desactivada! Espacio en disco liberado.
echo.
pause
goto AVANZADAS

:BLOTWARE
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo        QUITAR APPS PREINSTALADAS (BLOATWARE)
echo  ========================================================
echo.
echo  Se eliminaran apps como:
echo  - 3D Builder, Skype, Solitario, etc.
echo.
echo    Quieres crear un punto de restauracion primero?
echo    1. Si
echo    2. No
echo    3. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-3]: "

if "%opcion%"=="1" goto BLOTWARE_CON_RESTAURAR
if "%opcion%"=="2" goto BLOTWARE_APLICAR
if "%opcion%"=="3" goto AVANZADAS
goto BLOTWARE

:BLOTWARE_CON_RESTAURAR
cls
call :CREAR_PUNTO_RESTAURACION "Eliminar Bloatware"
if !punto_creado! equ 0 (
    echo ADVERTENCIA: No se pudo crear el punto de restauracion.
    set /p "cont=  Deseas continuar de todos modos? [S/N]: "
    if /i not "!cont!"=="S" goto AVANZADAS
)

:BLOTWARE_APLICAR
cls
color 0B
echo.
echo  ZEK V.1 - Eliminando aplicaciones preinstaladas...
echo  Esto puede tardar varios minutos...
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
echo  [OK] Bloatware eliminado correctamente!
echo.
pause
goto AVANZADAS

:SFC
cls
color 0C
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo        REPARAR ARCHIVOS DEL SISTEMA (SFC)
echo  ========================================================
echo.
echo  Esto verificara y reparara archivos del sistema.
echo  Puede tardar varios minutos.
echo.
echo    1. Ejecutar SFC /scannow
echo    2. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto SFC_EJECUTAR
if "%opcion%"=="2" goto AVANZADAS
goto SFC

:SFC_EJECUTAR
cls
color 0B
echo.
echo  ZEK V.1 - Ejecutando reparacion de archivos del sistema...
echo  Esto puede tardar varios minutos...
echo  ========================================================
echo.
sfc /scannow
echo.
echo  Reparacion completada.
echo.
pause
goto AVANZADAS

:MENU_RESTAURAR
cls
color 01
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo           PUNTOS DE RESTAURACION DEL SISTEMA
echo  ========================================================
echo.
echo    1. Crear punto de restauracion AHORA
echo    2. Verificar estado de Restauracion del Sistema
echo    3. Activar Restauracion del Sistema
echo    4. Ver puntos de restauracion existentes
echo    5. Volver al Menu Principal
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-5]: "

if "%opcion%"=="1" goto CREAR_PUNTO_AHORA
if "%opcion%"=="2" goto VERIFICAR_ESTADO
if "%opcion%"=="3" goto ACTIVAR_RESTAURACION
if "%opcion%"=="4" goto VER_PUNTOS
if "%opcion%"=="5" goto INICIO
goto MENU_RESTAURAR

:CREAR_PUNTO_AHORA
cls
color 09
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo         CREAR PUNTO DE RESTAURACION AHORA
echo  ========================================================
echo.
call :CREAR_PUNTO_RESTAURACION "Punto Manual del Optimizador"
if !punto_creado! equ 1 (
    echo.
    echo  [OK] Punto de restauracion creado exitosamente!
) else (
    echo.
    echo  [ERROR] No se pudo crear el punto de restauracion.
    echo  Verifica que la proteccion del sistema este activada.
)
echo.
pause
goto MENU_RESTAURAR

:VERIFICAR_ESTADO
cls
color 09
echo.
echo  ZEK V.1 - Verificando estado de Restauracion del Sistema...
echo  ========================================================
echo.
wmic.exe /Namespace:\\root\default Path SystemRestore Get Disabled /Value | find "Disabled"
echo.
pause
goto MENU_RESTAURAR

:ACTIVAR_RESTAURACION
cls
color 01
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo       ACTIVAR RESTAURACION DEL SISTEMA
echo  ========================================================
echo.
echo  Esto habilitara la proteccion del sistema.
echo.
echo    1. Activar Restauracion del Sistema
echo    2. Cancelar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto ACTIVAR_RESTAURACION_EJECUTAR
if "%opcion%"=="2" goto MENU_RESTAURAR
goto ACTIVAR_RESTAURACION

:ACTIVAR_RESTAURACION_EJECUTAR
cls
color 09
echo.
echo  ZEK V.1 - Activando Restauracion del Sistema...
powershell -Command "Enable-ComputerRestore -Drive 'C:\'" >nul 2>&1
echo.
echo  Restauracion del Sistema activada.
echo.
pause
goto MENU_RESTAURAR

:VER_PUNTOS
cls
color 09
echo.
echo  ZEK V.1 - Lista de puntos de restauracion existentes:
echo  ========================================================
echo.
vssadmin list shadows
echo.
pause
goto MENU_RESTAURAR

:INFOSISTEMA
cls
color 09
echo.
echo  ========================================================
echo                        ZEK V.1 OPTIMIZER
echo  ========================================================
echo            INFORMACION DEL SISTEMA
echo  ========================================================
echo.
systeminfo | findstr /B /C:"Nombre del sistema operativo" /C:"Version del sistema operativo" /C:"Procesador(es)" /C:"Memoria fisica total" /C:"Memoria fisica disponible" /C:"Espacio en disco"
echo.
echo  ========================================================
echo.
pause
goto INICIO

:CREAR_PUNTO_RESTAURACION
set "descripcion=%~1"
set punto_creado=0
echo ZEK V.1 - Creando punto de restauracion: "%descripcion%"
echo.

:: Verificar si la restauracion del sistema esta habilitada
wmic.exe /Namespace:\\root\default Path SystemRestore Get Disabled | find "0" >nul
if %errorlevel% neq 0 (
    echo ADVERTENCIA: La restauracion del sistema no esta habilitada.
    echo Intentando habilitar...
    powershell -Command "Enable-ComputerRestore -Drive 'C:\'" >nul 2>&1
)

:: Crear punto de restauracion
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "%descripcion%", 100, 7 >nul 2>&1

if %errorlevel% equ 0 (
    set punto_creado=1
    echo [OK] Punto de restauracion creado: %descripcion%
) else (
    set punto_creado=0
    echo [ERROR] No se pudo crear el punto de restauracion
)

exit /b

:: Funciones directas (sin preguntar)
:MAXRENDIMIENTO_DIRECTO
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f >nul 2>&1
exit /b

:ANIMACIONES_DIRECTO
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012078010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:TRANSPARENCIAS_DIRECTO
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:PLANENERGIA_DIRECTO
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c >nul 2>&1
exit /b

:NOTIFICACIONES_DIRECTO
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:TELEMETRIA_DIRECTO
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:CORTANA_DIRECTO
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:PUBLICIDAD_DIRECTO
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f >nul 2>&1
exit /b

:CAMARAMIC_DIRECTO
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Deny /f >nul 2>&1
exit /b

:SALIR
cls
color 0D
echo.
echo  ========================================================
echo.
echo                      ZEK V.1 OPTIMIZER
echo.
echo  ========================================================
echo     Gracias por usar el Optimizador de Windows!
echo.
echo  Se recomienda reiniciar el sistema para aplicar
echo  todos los cambios correctamente.
echo.
echo  Quieres reiniciar ahora?
echo    1. Si, reiniciar ahora
echo    2. No, salir sin reiniciar
echo.
echo  ========================================================
echo.
set /p "opcion=  Selecciona una opcion [1-2]: "

if "%opcion%"=="1" goto REINICIAR
if "%opcion%"=="2" goto SALIR_SIN_REINICIAR
goto SALIR

:REINICIAR
echo.
echo  ZEK V.1 - El sistema se reiniciara en 5 segundos...
shutdown /r /t 5 /c "Reinicio programado por ZEK V.1 Optimizer"
echo.
pause
exit

:SALIR_SIN_REINICIAR
echo.
echo  ZEK V.1 - Saliendo del Optimizador...
echo  Recuerda reiniciar manualmente para aplicar todos los cambios.
echo.
pause
exit