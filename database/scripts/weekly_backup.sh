#!/bin/bash

## backup

echo `date`
today=$(date '+%Y%m%d')
mkdir -p /var/lib/mysql/backups/

## /usr/bin/mysql -v -u root --password=rootpassword tpac_db < /usr/local/bin/tpac_weekly.sql

/usr/bin/mysqldump -u root --password=rootpassword tpac_db > /var/lib/mysql/backups/tpac_db_$today.sql
