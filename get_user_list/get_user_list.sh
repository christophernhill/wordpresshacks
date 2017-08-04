#!/bin/bash

# Set WP_INSTANCE to your wordpress site name
if [ x${WP_INSTANCE} == x ]; then
 WP_INSTANCE=foo
fi
WP_ROOT=/var/www/html
WP_CONFIG=${WP_ROOT}/${WP_INSTANCE}/wp-config.php

# Get key parameters
grep DB_NAME ${WP_CONFIG}
