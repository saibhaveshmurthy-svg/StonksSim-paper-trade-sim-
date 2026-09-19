BharatTrade Simulator — Full application package

This package contains the complete responsive web UI, Flask API, SQLite database layer, seeded simulated Indian instruments, order engine, learning centre, CSV export and Windows desktop build files.

Start on Windows:
  START_BharatTrade.bat

Build a real Windows executable:
  build_windows.bat
or
  build_windows.ps1

The supplied environment for this delivery is Linux, so a native Windows .exe is not embedded in this ZIP. The Windows build script creates it on Windows with PyInstaller. The GitHub Actions workflow can also build the EXE on a Windows runner.

Paper-trading safety:
  - virtual money only
  - simulated/seeded market data only
  - no broker connection
  - no real orders

AUTHENTICATION UPDATE
---------------------
The local application now uses username + password only. Email is not requested by the UI.
New registrations receive the login cookie immediately, so dashboard/API authentication works
immediately after registration. Existing older local databases are migrated to a username field
when the app starts.
