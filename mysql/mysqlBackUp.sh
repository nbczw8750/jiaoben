#!/bin/bash
BackupPath="/home/backup/mysql"

database[0]="activate"
database[1]="lh_erp"
database[2]="sms"

user="root"
passwd="YSmysql1509"

if !(test -d $BackupPath)
then
  mkdir $BackupPath
fi


for var in ${database[@]};  
do
	/usr/bin/mysqldump --login-path=mysqlroot $var --default-character-set=utf8 > $BackupPath"/$var"_$(date +%y%m%d_%H)".sql"
done


find "$BackupPath" -name "*.sql" -type f -mtime +7 -exec rm -rf {} \;
