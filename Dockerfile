FROM php:8.0-fpm

RUN apt-get update \
    && apt-get install -y git \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y \
    unzip

RUN docker-php-ext-install pdo_mysql

RUN mkdir /var/www/html/weblk

WORKDIR /var/www/html

RUN composer create-project --prefer-dist yiisoft/yii2-app-basic weblk

WORKDIR /var/www/html/weblk

RUN chown -R www-data:www-data /var/www/html