FROM php:8.1-fpm-alpine

WORKDIR /var/www/html

COPY ./php-fpm.d/www.conf /usr/local/etc/php-fpm.d/www.conf

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apk update && apk add \
    build-base \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    oniguruma-dev \
    curl

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl

# Get latest Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN addgroup -g 1000 www
RUN adduser -G www -u 1000 www -D

# Install ssl certificate for PHP curl requests
RUN apk add ca-certificates && rm -rf /var/cache/apk/*
RUN curl https://curl.se/ca/cacert.pem --output /usr/local/share/ca-certificates/cacert.pem
RUN update-ca-certificates

# Copy existing application directory contents
COPY ./Backend /var/www/html

# Copy existing application directory permissions
COPY --chown=www:www ./Backend /var/www/html

# Change current user to www
USER www