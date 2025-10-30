@echo off
chcp 65001 >nul
:: ====== MySQL 資料庫自動備份 ======
set dbname=learning
set backup_dir=C:\xampp\mysql\backup-mysql
set mysql_path=C:\xampp\mysql\bin

:: 產生日期時間標籤
for /f "tokens=1-3 delims=/- " %%a in ('date /t') do set mydate=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set mytime=%%a%%b
set filename=%dbname%_backup_%mydate%_%mytime%.sql

:: 匯出資料庫
echo 正在備份 %dbname% ...
"%mysql_path%\mysqldump.exe" -u root %dbname% > "%backup_dir%\%filename%"

if %errorlevel%==0 (
    echo ✅ 備份完成！檔案已儲存為：%filename%
) else (
    echo ❌ 備份失敗，請檢查設定！
)

pause
