@echo off
title Rename repo: update local remote
setlocal

set "USERNAME=alexprikhodk-code"
set "OLD_REPO=perfomia-dashboard"
set "NEW_REPO=hrconnect-dashboard"
set "NEW_REMOTE=https://github.com/alexprikhodk-code/hrconnect-dashboard.git"

echo ============================================================
echo  UPDATE LOCAL REMOTE TO NEW REPO NAME
echo ============================================================
echo.
echo BEFORE running this, you must rename the repo on GitHub:
echo.
echo  1. Open: https://github.com/%USERNAME%/%OLD_REPO%/settings
echo  2. In "Repository name" change %OLD_REPO% to %NEW_REPO%
echo  3. Click Rename
echo.
echo After that, press any key here to continue.
pause

cd /d "%~dp0"

echo.
echo [1/3] Show current remote
git remote -v

echo.
echo [2/3] Set new remote URL: %NEW_REMOTE%
git remote set-url origin "%NEW_REMOTE%"

echo.
echo [3/3] Verify new remote
git remote -v

echo.
echo ============================================================
echo  DONE
echo  New URL for dashboard:
echo  https://%USERNAME%.github.io/%NEW_REPO%/
echo  (GitHub Pages will update automatically in 1-2 minutes)
echo ============================================================
pause
exit /b 0
