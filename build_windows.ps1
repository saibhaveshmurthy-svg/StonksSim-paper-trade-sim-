Set-Location $PSScriptRoot\backend
py -3 -m venv .buildenv
& .\.buildenv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt pyinstaller
pyinstaller --noconfirm --clean --onefile --name BharatTrade-Simulator --add-data "templates;templates" --add-data "static;static" --add-data "data;data" desktop.py
New-Item -ItemType Directory -Force ..\release | Out-Null
Copy-Item dist\BharatTrade-Simulator.exe ..\release\BharatTrade-Simulator.exe -Force
Write-Host "Created release\BharatTrade-Simulator.exe"
