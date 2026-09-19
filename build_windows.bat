@echo off
setlocal EnableExtensions
cd /d "%~dp0"
set "ROOT=%CD%"
set "BACKEND=%ROOT%backend"
set "RELEASE=%ROOT%release"
set "LOG=%ROOT%build_log.txt"

echo BharatTrade Simulator - Windows EXE Builder > "%LOG%"
echo Started: %date% %time%>> "%LOG%"
echo.>> "%LOG%"

where py >nul 2>&1
if errorlevel 1 (
  echo ERROR: Python launcher ^(py^) was not found.
  echo Install Python 3.11+ from python.org and enable the Python launcher.
  echo ERROR: Python launcher not found>> "%LOG%"
  pause
  exit /b 1
)

py -3 --version >> "%LOG%" 2>&1
if errorlevel 1 (
  echo ERROR: Python 3 could not be started.>> "%LOG%"
  type "%LOG%"
  pause
  exit /b 1
)

echo [1/5] Creating build environment...
if exist "%BACKEND%\.buildenv" rmdir /s /q "%BACKEND%\.buildenv" >> "%LOG%" 2>&1
py -3 -m venv "%BACKEND%\.buildenv" >> "%LOG%" 2>&1
if errorlevel 1 goto :fail
call "%BACKEND%\.buildenv\Scripts\activate.bat"

 echo [2/5] Installing dependencies...
python -m pip install --upgrade pip >> "%LOG%" 2>&1
if errorlevel 1 goto :fail
python -m pip install -r "%BACKEND%\requirements.txt" pyinstaller >> "%LOG%" 2>&1
if errorlevel 1 goto :fail

 echo [3/5] Building BharatTrade-Simulator.exe...
cd /d "%BACKEND%"
if exist build rmdir /s /q build >> "%LOG%" 2>&1
if exist dist rmdir /s /q dist >> "%LOG%" 2>&1
if exist "%RELEASE%" rmdir /s /q "%RELEASE%" >> "%LOG%" 2>&1
mkdir "%RELEASE%" >> "%LOG%" 2>&1

pyinstaller --noconfirm --clean --onefile --windowed --name BharatTrade-Simulator --add-data "templates;templates" --add-data "static;static" --add-data "data;data" desktop.py >> "%LOG%" 2>&1
if errorlevel 1 goto :fail

 echo [4/5] Copying release files...
copy /Y "dist\BharatTrade-Simulator.exe" "%RELEASE%\BharatTrade-Simulator.exe" >> "%LOG%" 2>&1
if errorlevel 1 goto :fail
copy /Y "%ROOT%\RUN_BharatTrade_EXE.bat" "%RELEASE%\RUN_BharatTrade_EXE.bat" >> "%LOG%" 2>&1
copy /Y "%ROOT%\README_WINDOWS.txt" "%RELEASE%\README_WINDOWS.txt" >> "%LOG%" 2>&1
copy /Y "%LOG%" "%RELEASE%\build_log.txt" >> "%LOG%" 2>&1

 echo [5/5] Build complete.
echo.
echo ========================================
echo EXE CREATED SUCCESSFULLY:
echo %RELEASE%\BharatTrade-Simulator.exe
echo ========================================
echo.
echo You can double-click RUN_BharatTrade_EXE.bat in the release folder.
echo A detailed log is at:
echo %LOG%
echo.
pause
exit /b 0

:fail
echo.
echo ========================================
echo BUILD FAILED
echo ========================================
echo Check this log for the exact error:
echo %LOG%
echo.
type "%LOG%"
pause
exit /b 1
