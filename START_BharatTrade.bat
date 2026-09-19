@echo off
setlocal
cd /d "%~dp0backend"
if not exist ".venv\Scripts\python.exe" (
  echo Creating a local Python environment...
  py -3 -m venv .venv
  if errorlevel 1 (
    echo Python 3 was not found. Install Python 3.11+ and run this file again.
    pause
    exit /b 1
  )
  call .venv\Scripts\activate.bat
  python -m pip install --upgrade pip
  python -m pip install -r requirements.txt
) else call .venv\Scripts\activate.bat
python desktop.py
pause
