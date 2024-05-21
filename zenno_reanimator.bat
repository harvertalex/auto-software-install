@echo off
SETLOCAL EnableExtensions
Set Process=Zennoposter

:: Проверка запущен ли процесс ZennoPoster
tasklist | Find /i "%Process%.exe" || goto :FOUND 

exit 0

:FOUND
:: Поиск последней версии ZennoPoster
for /f "delims=" %%i in ('dir "C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\*" /b /ad-h /o-n') do (
    set "latestVersion=%%i"
    goto :LAUNCH
)

:LAUNCH
:: Запуск ZennoPoster из последней найденной версии
echo Found latest version: %latestVersion%
start "" "C:\Program Files\ZennoLab\RU\ZennoPoster Pro V7\%latestVersion%\Progs\ZennoPoster.exe" -screen 0 -clipboard -multiwindow

exit 0
