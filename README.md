# BharatTrade Simulator — Desktop-ready full application

A beginner-friendly Indian stock-market **paper trading simulator**. It uses virtual money and seeded/simulated prices only. It does not connect to a broker and cannot place real trades.

## What is included

- Flask + SQLite backend
- Polished responsive web application served directly by Flask
- Sign up / sign in / sign out
- Virtual portfolio setup and reset
- NSE/BSE sample instruments
- Simulated market status and price history
- BUY/SELL MARKET and LIMIT paper orders
- Simulated brokerage, exchange charges, GST, SEBI charges, stamp duty, STT and slippage
- Holdings, average cost, realised/unrealised/total P&L
- Watchlists
- Order history and CSV export
- Beginner learning centre
- Automatic browser launch for the desktop launcher
- Windows PyInstaller build script

## Run from source on Windows

1. Install Python 3.11+.
2. Double-click `START_BharatTrade.bat`.
3. The script creates a local virtual environment, installs dependencies and starts the app.
4. Your browser opens at `http://127.0.0.1:5000/`.

## Build a standalone Windows EXE

On a Windows PC with Python 3.11+:

1. Double-click `build_windows.bat`.
2. The script installs PyInstaller in a temporary build environment.
3. It creates `release/BharatTrade-Simulator.exe`.
4. Copy that EXE to another Windows PC and run it.

The EXE starts the local Flask server, seeds the simulator database when needed, and opens the browser automatically.

> This workspace cannot reliably produce a native Windows PE `.exe` from its Linux build environment. The included Windows build script is therefore the reproducible way to create the actual `.exe` on Windows.

## Manual source run

```text
cd backend
python -m venv .venv
# activate the environment
pip install -r requirements.txt
python seed.py
python desktop.py
```

## API

The UI and API are served from the same origin:

- App: `http://127.0.0.1:5000/`
- API: `http://127.0.0.1:5000/api`
- Health: `GET /api/health`

## Data and trading limitations

- Prices are explicitly marked `SIMULATED`.
- There is no live NSE/BSE feed.
- No broker API is used.
- No real money can be deposited or withdrawn.
- No short selling, margin, options or futures.
- LIMIT orders that do not cross the current simulated price remain `OPEN`; version 1 does not run a continuous background matching engine.
- Fees are configurable learning assumptions and are not guaranteed to match any real broker or exchange.
- Daily P&L is based on the simulator's current portfolio valuation; historical portfolio snapshots are not stored.

## Replacing simulated data later

Keep the UI and order engine unchanged and replace the price-loading layer in `market.py` with a provider adapter that returns validated OHLC/quote data. Keep provider status and timestamps so stale or unavailable quotes are rejected rather than silently treated as live.
