#!/usr/bin/env bash

if [ "${RUN_MIGRATIONS}" = true ]; then
    sleep 30

    php /var/www/html/artisan migrate
fi

docker-php-entrypoint php-fpm
