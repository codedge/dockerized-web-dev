FROM php:7.0-fpm

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends \
    libfreetype6-dev \
    libcurl4-gnutls-dev \
    libpng-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libicu-dev \
    libedit-dev \
    libxml2-dev \
    libxslt1-dev \
    libxslt1.1

RUN docker-php-ext-install \
    curl \
    json \
    pdo \
    pdo_mysql \
    mbstring \
    intl \
    readline \
    simplexml \
    zip \
    xsl && \ 
    docker-php-ext-install -j$(nproc) iconv mcrypt && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) gd

RUN mkdir -p /usr/local/apache2/htdocs