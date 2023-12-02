@echo off
setlocal

REM Ruta del repositorio local
set REPO_PATH=C:\Users\Andrés\Pictures\wallpapers

REM Obtiene la fecha actual en el formato deseado (YYYY-MM-DD)
for /f %%x in ('powershell Get-Date -Format yyyy-MM-dd') do set "DATE=%%x"

REM Mensaje de commit (puedes personalizarlo)
set COMMIT_MESSAGE="Carga de trabajo diaria - %DATE%"

REM Cambia al directorio del repositorio
cd %REPO_PATH%

REM Solicita al usuario que elija una opción
echo Seleccione una opción:
echo 1 - Realizar git pull
echo 2 - Realizar git commit y push
set /p OPTION="Opcion: "

REM Realiza la acción según la opción seleccionada
if "%OPTION%"=="1" (
REM Realiza un pull para obtener los cambios más recientes del repositorio remoto
    git pull
    echo Pull realizado exitosamente.
) else if "%OPTION%"=="2" (
    REM Agrega todos los cambios y realiza el commit
    git add .
    git commit -m %COMMIT_MESSAGE%

    REM Realiza el push al repositorio remoto (asegúrate de haber configurado un origen remoto)
    git push origin main

    echo Commit y push realizados exitosamente.
) else (
    echo Opción no válida.
)

REM Pausa para que puedas ver el resultado antes de que la ventana se cierre
pause