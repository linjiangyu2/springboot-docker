#!/bin/bash
cat /tmp/sql/*.sql | mysql -uroot -p${MYSQL_ROOT_PASSWORD} 2>&1 &>/dev/null || zcat /tmp/sql/*.sql | mysql -uroot -p${MYSQL_ROOT_PASSWORD} 2>&1 &>/dev/null
psw=$(echo $MYSQL_ROOT_PASSWORD | sed "s/.*/'&'/g")
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "update mysql.user set authentication_string='' where user='root' and host='%';alter user 'root'@'%' identified by ${psw};grant all privileges on *.* to 'root'@'%'"

#mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "update mysql.user set plugin='mysql_native_password' where user='root' and host='%'"
