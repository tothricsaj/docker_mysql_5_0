#!/bin/bash

mysql=( /mysql/bin/mysql -uroot -proot -h127.0.0.1)

${mysql[@]} <<-EOSQL || true
    CREATE USER 'pepsi'@'%' IDENTIFIED BY 'pepsi' ;
    GRANT ALL ON *.* TO 'pepsi'@'%' WITH GRANT OPTION ;
EOSQL
