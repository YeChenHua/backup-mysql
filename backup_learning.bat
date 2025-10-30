@echo off
chcp 65001 >nul

:: 1) 匯出資料庫到指定資料夾
set dbname=learning
set backup_dir=C:\xampp\mysql\backup-mysql
set mysql_path=C:\xampp\mysql\bin
set filename=learning_backup.sql

"%mysql_path%\mysqldump.exe" -u root %dbname% > "%backup_dir%\%filename%"

:: 2) 推上 GitHub
cd /d "%backup_dir%"
git add .
git commit -m "Auto DB backup on %date% %time%"
git push

echo ✅ 完成：資料庫已匯出並推送到 GitHub
pause
