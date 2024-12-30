FROM php:8.4-fpm-alpine
WORKDIR /var/www/html
COPY ./php.ini /usr/local/etc/php/conf.d/

RUN apk --no-cache add \
    curl \
    git \
    bash \
    unzip

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY ./src/composer.json /var/www/html/

# Optionally, expose port 9000 (for PHP-FPM)
EXPOSE 9000

# Set the entrypoint for PHP-FPM
CMD ["sh", "-c", "composer dump-autoload && php-fpm"]