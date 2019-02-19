FROM php:7.3-fpm

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN groupmod -g ${GROUP_ID:-1000} www-data \
  && usermod -u ${USER_ID:-1000} www-data

RUN apt-get update && apt-get install -y \
  libzip-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  graphviz

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install zip \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install gettext \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install pdo \
  && docker-php-ext-install pdo_mysql

COPY ./docker/php/php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./docker/php/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

ENTRYPOINT /entrypoint.sh
