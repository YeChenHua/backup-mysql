@echo off
chcp 65001 >nul

:: ====== 參數設定 ======
set dbname=learning
set backup_dir=C:\xampp\mysql\backup-mysql
set mysql_path=C:\xampp\mysql\bin
set filename=learning_backup.sql

:: ====== 匯出資料庫 ======
"%mysql_path%\mysqldump.exe" -u root %dbname% > "%backup_dir%\%filename%"
if %errorlevel% NEQ 0 (
    echo ❌ 匯出失敗
    goto end
)

:: ====== 推上 GitHub ======
cd /d "%backup_dir%"
git add .
git commit -m "Auto DB backup on %date% %time%"
git push

:end
echo ✅ 自動備份完成