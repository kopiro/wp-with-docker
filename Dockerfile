FROM php:7.1-fpm-alpine

WORKDIR /app
ENTRYPOINT entrypoint

RUN set -ex && apk update 
RUN apk add --no-cache nano unzip git

RUN apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
&& export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
&& pecl install imagick-3.4.3 \
&& docker-php-ext-enable imagick \
&& apk add --no-cache --virtual .imagick-runtime-deps imagemagick \
&& apk del .phpize-deps

RUN docker-php-ext-install mysqli

RUN apk add --no-cache nginx
RUN apk add --no-cache supervisor

RUN rm /etc/localtime; ln -s /usr/share/zoneinfo/UTC /etc/localtime
RUN mkdir -p /run/nginx

COPY ./conf/php-fpm-pool.conf /usr/local/etc/php-fpm.d/zzzz-docker.conf
COPY ./conf/php.ini /usr/local/etc/php/php.ini
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./conf/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl -sS -k https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY ./app/composer.json /composer/composer.json
RUN cd /composer && composer install --no-scripts --no-autoloader --no-progress --no-suggest --no-dev \
&& rm -rf ~/.composer/cache

COPY ./entrypoint.sh /bin/entrypoint

COPY ./app /app

RUN ln -svf /composer/vendor /app/vendor
RUN ln -svf /composer/wordpress /app/public/wordpress
RUN ln -svf /app/public/wp-config.php /app/public/wordpress/wp-config.php

RUN composer dump-autoload --optimize

EXPOSE 80
