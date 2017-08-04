#!/bin/bash

# Set WP_INSTANCE to your wordpress site name
# e.g. export WP_INSTANCE=XXXXXX
if [ x${WP_INSTANCE} == x ]; then
 WP_INSTANCE=foo
fi
WP_ROOT=/var/www/html
WP_CONFIG=${WP_ROOT}/${WP_INSTANCE}/wp-config.php

# Get key parameters
dbname=`grep DB_NAME ${WP_CONFIG} | sed 's/define[^ ]*\(.*\)).*/\1/' | tr '\047' ' ' | sed s'/ //g'`
dbuser=`grep DB_USER ${WP_CONFIG} | sed 's/define[^ ]*\(.*\)).*/\1/' | tr '\047' ' '  | sed s'/ //g'`
dbpass=`grep DB_PASSWORD ${WP_CONFIG} | sed 's/define[^ ]*\(.*\)).*/\1/' | tr '\047' ' ' | sed s'/ //g'`

utab=`mysql -u ${dbuser} -p${dbpass} ${dbname}  -e "show tables"   2>&1  | grep _users`
umtab=`mysql -u ${dbuser} -p${dbpass} ${dbname}  -e "show tables"  2>&1  | grep _usermeta`

mysql -u ${dbuser} -p${dbpass} ${dbname}  -e "select * from "${utab}"" -B   > ${WP_INSTANCE}${utab}.tsv
mysql -u ${dbuser} -p${dbpass} ${dbname}  -e "select * from "${umtab}"" -B   > ${WP_INSTANCE}${umtab}.tsv

echo "# Wordpress instance name: "${WP_INSTANCE}
echo "# Wordpress config: "${WP_CONFIG}
echo "# users tsv: "${WP_INSTANCE}${utab}.tsv
echo "# user meta tsv: "${WP_INSTANCE}${umtab}.tsv
