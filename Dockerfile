FROM php:7.4.5-alpine

LABEL maintainer="me@mnunes.com"

ENV PHALCON_VERSION=4.0.5
ENV REDIS_VERSION=3.0.0

RUN apk add --no-cache bzip2-dev zlib-dev libpng-dev gettext-dev gmp-dev imap-dev icu-dev openldap-dev libxml2-dev tidyhtml-dev libxslt-dev libzip-dev && \
    docker-php-ext-install bcmath bz2 calendar dba exif gd gettext gmp imap intl ldap soap sockets tidy pdo_mysql xmlrpc xsl zip && \
    curl -LO https://github.com/phpredis/phpredis/archive/${REDIS_VERSION}.tar.gz && \
    tar -zxf ${REDIS_VERSION}.tar.gz && \
    docker-php-ext-install ${pwd}/phpredis-${REDIS_VERSION} && \
    curl -LO https://github.com/jbboehr/php-psr/archive/v1.0.0.tar.gz && \
    tar -zxf v1.0.0.tar.gz && \
    docker-php-ext-install ${pwd}/php-psr-1.0.0 && \
    curl -LO https://github.com/phalcon/cphalcon/archive/v${PHALCON_VERSION}.tar.gz && \
    tar -zxf v${PHALCON_VERSION}.tar.gz && \
    docker-php-ext-install ${pwd}/cphalcon-${PHALCON_VERSION}/build/php7/64bits && \
    rm -r ${REDIS_VERSION}.tar.gz phpredis-${REDIS_VERSION} v1.0.0.tar.gz php-psr-1.0.0 v${PHALCON_VERSION}.tar.gz cphalcon-${PHALCON_VERSION} && \
    rm -rf /var/cache/apk/* && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/bin/composer
