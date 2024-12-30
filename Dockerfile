# Use the official PHP image with PHP-FPM
FROM php:8.2-fpm

# Install required dependencies for NGINX
RUN apt-get update && apt-get install -y \
    nginx \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions (optional, add the ones your app needs)
# RUN docker-php-ext-install pdo pdo_mysql

# Configure NGINX
COPY ./nginx.conf /etc/nginx/nginx.conf

# Set up the directory for your application
WORKDIR /var/www/html

# Copy the application code into the container
COPY ./src /var/www/html

# Set correct permissions for the /var/www/html directory
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose the necessary ports
EXPOSE 80

# Start PHP-FPM and NGINX in the foreground
CMD php-fpm -F & nginx -g 'daemon off;'
