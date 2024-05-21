@echo off
:: Проверка прав администратора и перезапуск с правами администратора при необходимости
net session >nul 2>&1
if %errorlevel% == 1 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~0' -Verb runAs" >nul
    exit
)

setlocal

:: Путь, куда будет распакован архив
set "INSTALL_DIR=C:\"

:: Распаковываем архив в указанную директорию
PowerShell -Command "Expand-Archive -Path 'ffmpeg.zip' -DestinationPath '%INSTALL_DIR%' -Force"

:: Добавляем путь к переменной среды PATH через реестр
PowerShell -Command "[Environment]::SetEnvironmentVariable('Path', $env:Path + ';C:\ffmpeg\bin', [EnvironmentVariableTarget]::Machine)"

echo Ready! ffmpeg has been successfully installed and added to PATH.
pause
