FROM php:7.4-fpm
WORKDIR /www

RUN apt-get update
RUN apt-get install -y \
            git \
            libzip-dev \
            libc-client-dev \
            libkrb5-dev \
            libpng-dev \
            libjpeg-dev \
            libwebp-dev \
            libfreetype6-dev \
            libkrb5-dev \
            libicu-dev \
            zlib1g-dev \
            zip \
            ffmpeg \
            libmemcached11 \
            libmemcachedutil2 \
            build-essential \
            libmemcached-dev \
            gnupg2 \
            libpq-dev \
            libpq5 \
            libz-dev


#RUN apt-get update && apt-get install -y postgresql-client-9.5

#RUN docker-php-ext-configure gd \
#    --with-webp=/usr/include/ \
#    --with-freetype=/usr/include/ \
#    --with-jpeg=/usr/include/
#RUN docker-php-ext-install gd
#
#RUN docker-php-ext-configure imap \
#    --with-kerberos \
#    --with-imap-ssl
#RUN docker-php-ext-install imap

RUN docker-php-ext-configure zip

RUN docker-php-ext-install zip

RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install exif
RUN docker-php-ext-install fileinfo



#MAINTAINER Descamps Antoine <antoine.descamps@ineat-conseil.fr>

#RUN apt-get update && apt-get install -y \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#        libmcrypt-dev \
#        libpng-dev \
#        libicu-dev \
#        libpq-dev \
#        libxpm-dev \
#        libvpx-dev \
#    && pecl install xdebug \
#    && docker-php-ext-enable xdebug \
#    && docker-php-ext-install -j$(nproc) mcrypt \
#    && docker-php-ext-install -j$(nproc) gd \
#    && docker-php-ext-install -j$(nproc) intl \
#    && docker-php-ext-install -j$(nproc) zip \
#    && docker-php-ext-install -j$(nproc) pgsql \
#    && docker-php-ext-install -j$(nproc) pdo_pgsql \
#    && docker-php-ext-install -j$(nproc) exif \
#    && docker-php-ext-configure gd \
#        --with-freetype-dir=/usr/include/ \
#        --with-jpeg-dir=/usr/include/ \
#        --with-xpm-dir=/usr/lib/x86_64-linux-gnu/ \
#        --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \
# Install dependencies
#RUN apt-get update && apt-get install -qy --no-install-recommends \
#    curl \
#    openssl \
#    libfreetype6-dev \
#    libjpeg62-turbo-dev \
#    libmagickwand-dev \
#    libmcrypt-dev \
#    libgmp-dev\
#    libpng-dev \
#    zlib1g-dev \
#    libxml2-dev \
#    libzip-dev \
#    libonig-dev \
#    zip \
#    unzip
#RUN apt-get update
#RUN apt-get install -y libpq-dev \
#    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
#    && docker-php-ext-install pdo pdo_pgsql pgsql


    #RUN docker-php-ext-install \
#    bcmath \
#    ctype \
#    json \
#    mbstring \
#    pdo \
#    tokenizer \
#    xml \
#    pdo_mysql \
#    gmp \
#    intl \
#
#
#
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#
#RUN docker-php-ext-install pgsql pdo pdo_pgsql
#
##RUN npm i npm@latest -g
#RUN apt-get update && apt-get install -y \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#        libmcrypt-dev \
#        libpng-dev \
#        libicu-dev \
#        libpq-dev \
#        libxpm-dev \
#        libvpx-dev \
#    && pecl install xdebug \
#    && docker-php-ext-enable xdebug \
#    && docker-php-ext-install -j$(nproc) mcrypt \
#    && docker-php-ext-install -j$(nproc) gd \
#    && docker-php-ext-install -j$(nproc) intl \
#    && docker-php-ext-install -j$(nproc) zip \
#    && docker-php-ext-install -j$(nproc) pgsql \
#    && docker-php-ext-install -j$(nproc) pdo_pgsql \
#    && docker-php-ext-install -j$(nproc) exif \
#    && docker-php-ext-configure gd \
#        --with-freetype-dir=/usr/include/ \
#        --with-jpeg-dir=/usr/include/ \
#        --with-xpm-dir=/user/lib/x86_64-linux-gnu/ \
#        --with-vpx-dir=/usr/lib/x86_64-linux-gnu/ \

RUN usermod -u 1000 www-data

RUN chown -R www-data:www-data /www