FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    zip unzip curl git libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY . .

RUN composer install

EXPOSE 8000

CMD php artisan serve --host=127.0.0.1 --port=8000
