FROM library/nginx:1.13

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN usermod -u ${USER_ID:-1000} www-data \
  && groupmod -g ${GROUP_ID:-1000} www-data

COPY ./docker/nginx/conf/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/conf.d /etc/nginx/conf.d
COPY ./src /var/www/html
