FROM mysql:5.7

COPY mysql.cnf /etc/mysql/conf.d/mysql.cnf

COPY db /docker-entrypoint-initdb.d

COPY scripts/* /usr/local/bin/

RUN chmod -R 777 /usr/local/bin/*.sh
