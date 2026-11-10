@echo off
echo ==========================================
echo    KHOI DONG WEB QUAN LY PRO
echo ==========================================
echo.

echo [1/2] Cai dat Node.js dependencies...
cd /d "%~dp0bff"
call npm install --silent
if errorlevel 1 (
    echo LOI: Khong the cai dat npm packages!
    pause
    exit /b 1
)

echo [2/2] Khoi dong Node.js BFF server...
echo.
echo ==========================================
echo   HUONG DAN:
echo   1. Mo tab moi va chay: start-spring.bat
echo   2. Sau do truy cap: http://localhost:3000
echo   3. Dang nhap: admin / admin123
echo ==========================================
echo.
node server.js
