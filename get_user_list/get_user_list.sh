#!/bin/bash
WP_INSTANCE=foo
WP_ROOT=/var/www/html
WP_CONFIG=${WP_ROOT}/${WP_INSTANCE}/wp-config.php

grep DB_NAME ${WP_CONFIG}
