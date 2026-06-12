@echo off
title Deploy dashboard
setlocal

set "URL=https://alexprikhodk-code.github.io/hrconnect-dashboard/"

echo ============================================================
echo  Deploy: AI TESTING CANDIDATES (HRconnect)
echo ============================================================
cd /d "%~dp0"

echo.
echo [1/3] git add
git add -A

echo.
echo [2/3] commit
for /f "tokens=*" %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm"') do set "TS=%%a"
git commit -m "Update %TS%"

echo.
echo [3/3] push
git push
if errorlevel 1 goto err

echo.
echo ============================================================
echo  Deploy complete
echo  URL: %URL%
echo  Refresh page in ~30 seconds
echo ============================================================
pause
exit /b 0

:err
echo Push failed - check connection / token
pause
exit /b 1
