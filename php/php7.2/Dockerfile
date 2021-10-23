FROM php:7.2-fpm-stretch

RUN echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y nano mc \
   	libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
	libicu-dev libxml2-dev libxslt-dev libzip-dev procps default-mysql-client git libsodium-dev ssmtp

RUN docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) xsl \
    && docker-php-ext-install -j$(nproc) sockets \
    && docker-php-ext-install -j$(nproc) opcache \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install -j$(nproc) sodium

RUN echo 'log_errors = On\nerror_log = /dev/stderr\n' > /usr/local/etc/php/conf.d/logs.ini

COPY .ssh/ /var/www/.ssh/
COPY composer /usr/local/bin/composer

RUN chown -R www-data:www-data /var/www
RUN su - www-data -s /bin/bash -c "rm -r html; git clone git@gitlab.com:docker_redingo/bagstar.git html"
RUN su - www-data -s /bin/bash -c "cd html; composer install"

COPY ./start.sh /usr/local/bin/
CMD ["start.sh"]
