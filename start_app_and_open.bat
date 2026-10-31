@echo off
echo ========================================================
echo Starting ANN-DAAN AI Platform (Jaipur Pilot Node)
echo ========================================================
start "ANN-DAAN AI Backend" cmd /k "python run_backend.py"
timeout /t 3 /nobreak >nul
start "ANN-DAAN AI Frontend" cmd /k "cd frontend && npm run dev"
timeout /t 4 /nobreak >nul
start http://localhost:3000
echo Both services started! Browser opened at http://localhost:3000

