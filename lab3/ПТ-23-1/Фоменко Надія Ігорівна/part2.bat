@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set "directory=D:\Фоменко Надія\Архітектура\lab3\lab3\ПТ-23-1\Фоменко Надія Ігорівна"

echo Starting to process directory: %directory%
echo.

:calculate_size
for %%i in ("Batch" "command line") do (
    set "subdir=%directory%\%%~i"
    call :get_size
)

pause
goto :eof

:get_size
set "subdir_path=%subdir:\=\\%"
for /f "usebackq tokens=*" %%a in (`powershell -NoProfile -Command "Get-ChildItem -Path '%subdir_path%' -Recurse | Measure-Object -Property Length -Sum | ForEach-Object { $_.Sum }"`) do (
    set "size=%%a"
    if "!size!"=="" set "size=0"
    echo Size of folder "%subdir%": !size! bytes
)
goto :eof
