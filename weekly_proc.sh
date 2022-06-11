#!/bin/bash

## backup


today=$(date '+%Y%m%d')
docker exec tpac_db /usr/bin/mysqldump -u root --password=rootpassword tpac_db > /var/backups/tpac/tpac_db_a_$today.sql


docker exec tpac_db /bin/sh -c  'mysql -v -u root -prootpassword tpac_db < /docker-entrypoint-initdb.d/003-weekly.sql'


docker exec tpac_db /usr/bin/mysqldump -u root --password=rootpassword tpac_db > /var/backups/tpac/tpac_db_b_$today.sql

