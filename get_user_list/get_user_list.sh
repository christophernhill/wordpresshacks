#!/bin/bash

# Set WP_INSTANCE to your wordpress site name
if [ x${WP_INSTANCE} == x ]; then
 WP_INSTANCE=foo
fi
WP_ROOT=/var/www/html
WP_CONFIG=${WP_ROOT}/${WP_INSTANCE}/wp-config.php

# Get key parameters
dbname=`grep DB_NAME ${WP_CONFIG} | sed 's/define[^ ]*\(.*\)).*/\1/' | tr '\047' ' '`
dbuser=`grep DB_USER ${WP_CONFIG} | sed 's/define[^ ]*\(.*\)).*/\1/' | tr '\047' ' '`
dbpass=`grep DBPASSWORD ${WP_CONFIG} | sed 's/define[^ ]*\(.*\)).*/\1/' | tr '\047' ' '`
