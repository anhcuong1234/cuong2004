@echo off
echo ==========================================
echo    KHOI DONG SPRING BOOT BACKEND
echo ==========================================
echo.

cd /d "%~dp0backend"
echo Dang build va chay Spring Boot...
echo (Co the mat 1-2 phut lan dau tien)
echo.
call mvn spring-boot:run -q
