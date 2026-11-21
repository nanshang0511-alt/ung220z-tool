@echo off
rem ung220z-tool local launcher (ASCII only on purpose: cmd parses .bat as GBK)
rem Usage: double-click, or run.bat -i 192.168.1.1 -u user -p yourpassword
chcp 65001 >nul
setlocal
set "PYTHONUTF8=1"
set "PYTHONIOENCODING=utf-8"
cd /d "%~dp0"

set "PY=E:\msys64\mingw64\bin\python.exe"
if not exist "%PY%" set "PY=python"

"%PY%" "%~dp0ung220z.py" %*
set "RC=%ERRORLEVEL%"

rem keep the window open when started by double-click (no arguments)
if "%~1"=="" pause
exit /b %RC%
