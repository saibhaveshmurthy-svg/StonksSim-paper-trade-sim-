BharatTrade Simulator - Windows
================================

Simple local paper-trading simulator. No real broker connection and no real money.

EASIEST OPTION (Python)
-----------------------
Double-click START_BharatTrade.bat.
It creates a local Python environment, installs dependencies, seeds the database,
and opens the application in your browser.

STANDALONE EXE
--------------
1. Install Python 3.11+ with the Python launcher enabled.
2. Double-click build_windows.bat.
3. Wait for the build to finish.
4. Open the release folder.
5. Run BharatTrade-Simulator.exe or RUN_BharatTrade_EXE.bat.

The executable and build log are placed in:
    release\

If the build fails, read:
    build_log.txt

DATA LOCATION
-------------
The standalone EXE stores bharattrade.db beside the EXE in the release folder.
This keeps your local simulator data between launches.

LOGIN
-----
There is no email login.
Create an account with:
    Username
    Password

A display name is optional.

SECURITY / SCOPE
----------------
This is intended for local learning and paper trading. It does not place real orders,
connect to a broker, or handle real money.
