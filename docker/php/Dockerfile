FROM php:7.1-fpm

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupmod -g ${GROUP_ID:-1000} www-data \
  && usermod -u ${USER_ID:-1000} www-data

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	libpng12-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install gettext \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo \
    && docker-php-ext-install pdo_mysql

COPY ./docker/php/php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./docker/php/entrypoint.sh /entrypoint.sh
COPY ./src /var/www/html

RUN touch /var/www/html/storage/logs/laravel.log \
  && chown -R www-data:www-data /var/www/html/storage \
  && chown -R www-data:www-data /var/www/html/bootstrap/cache \
  && touch /var/log/cron.log \
  && chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
