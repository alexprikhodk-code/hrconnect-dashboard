@echo off
title One-time setup
setlocal

set "USERNAME=alexprikhodk-code"
set "EMAIL=alexprikhodk@gmail.com"
set "REPO=perfomia-dashboard"
set "REMOTE=https://github.com/%USERNAME%/%REPO%.git"

echo ============================================================
echo  ONE-TIME SETUP - GitHub Pages
echo ============================================================
echo.
echo Username: %USERNAME%
echo Email:    %EMAIL%
echo Repo:     %REPO%
echo Remote:   %REMOTE%
echo.
echo Before continuing make sure you created an EMPTY PUBLIC repo
echo named %REPO% on https://github.com/new
echo.
pause

cd /d "%~dp0"

echo.
echo [1/8] Set git identity
git config --global user.email "%EMAIL%"
git config --global user.name "%USERNAME%"

echo.
echo [2/8] git init
git init
if errorlevel 1 goto err

echo.
echo [3/8] branch main
git branch -M main

echo.
echo [4/8] remote add origin
git remote remove origin >nul 2>&1
git remote add origin "%REMOTE%"

echo.
echo [5/8] git add
git add -A

echo.
echo [6/8] commit
git commit -m "Initial deploy"

echo.
echo [7/8] push
echo.
echo === Login dialog will appear ===
echo Username: %USERNAME%
echo Password: Personal Access Token (NOT regular password)
echo.
git push -u origin main
if errorlevel 1 goto err

echo.
echo [8/8] DONE
echo.
echo ============================================================
echo  SETUP OK
echo ============================================================
echo.
echo Opening final instructions in Notepad...
start "" notepad "%~dp0INSTRUCTIONS.txt"
pause
exit /b 0

:err
echo.
echo ============================================================
echo  ERROR - see message above
echo ============================================================
pause
exit /b 1
