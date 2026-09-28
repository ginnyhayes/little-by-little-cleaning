@echo off
cd /d "%~dp0"
start "" http://localhost:4173
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start-App.ps1"
pause
