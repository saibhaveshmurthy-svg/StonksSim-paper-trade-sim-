@echo off
setlocal
cd /d "%~dp0"
if not exist "BharatTrade-Simulator.exe" (
  echo BharatTrade-Simulator.exe was not found in this folder.
  echo Run build_windows.bat first.
  pause
  exit /b 1
)
start "BharatTrade Simulator" "BharatTrade-Simulator.exe"
exit /b 0
