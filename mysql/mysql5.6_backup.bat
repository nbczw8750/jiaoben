@echo off
set BackupPath=D:\backup\data

set database=ccthink3 ccthink5

set "Ymd=%date:~,4%%date:~5,2%%date:~8,2%"

echo 正在备份数据库
for %%i in (%database%) do mysqldump --login-path=root %%i --default-character-set=utf8 > %BackupPath%/%%i_%Ymd%.sql

echo 正在删除7天前的备份
forfiles /p %BackupPath% /s /m *.sql /d -7 /c "cmd /c del @path"
echo 结束
