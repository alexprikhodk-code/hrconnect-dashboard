@echo off
title Fix git identity and push
setlocal

set "USERNAME=alexprikhodk-code"
set "EMAIL=alexprikhodk@gmail.com"

echo ============================================================
echo  FIX: set git identity, commit, push
echo ============================================================
cd /d "%~dp0"

echo.
echo [1/4] Set git user.email
git config --global user.email "%EMAIL%"

echo.
echo [2/4] Set git user.name
git config --global user.name "%USERNAME%"

echo.
echo [3/4] Commit staged files
git commit -m "Initial deploy"
if errorlevel 1 (
  echo If "nothing to commit" - that is OK, going to push.
)

echo.
echo [4/4] Push to GitHub
echo.
echo === Login dialog ===
echo Username: %USERNAME%
echo Password: Personal Access Token
echo.
git push -u origin main
if errorlevel 1 goto err

echo.
echo ============================================================
echo  PUSH OK
echo ============================================================
echo.
echo Opening final instructions...
start "" notepad "%~dp0INSTRUCTIONS.txt"
pause
exit /b 0

:err
echo.
echo ============================================================
echo  PUSH FAILED - see message above
echo ============================================================
echo.
echo Common reasons:
echo  - Wrong Personal Access Token
echo  - Repo on GitHub not created yet
echo  - Repo name is not "perfomia-dashboard"
echo.
pause
exit /b 1
