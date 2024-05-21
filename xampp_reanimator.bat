@echo off

SETLOCAL EnableExtensions
Set Process=xampp-control
tasklist | Find /i "%Process%.exe" || (goto FOUND)

echo Not running

exit 0
:FOUND
:: echo Running
:: Указываем полный путь к файлу xampp-control.exe
start "" "C:\xampp\xampp-control.exe" -screen 0 -clipboard -multiwindow
exit 0


