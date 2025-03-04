# Sử dụng PHP 8.2 với Apache trên Ubuntu 22.04
FROM php:8.2-apache

# Cập nhật Ubuntu và cài đặt các package cần thiết
RUN apt-get update && apt-get install -y \
    zip unzip curl git \
    libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo pdo_mysql gd mbstring xml

# Cài đặt Composer (trong trường hợp chạy PHP project như Laravel)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Thiết lập thư mục làm việc
WORKDIR /var/www/html

# Copy toàn bộ mã nguồn vào container
COPY . /var/www/html/

# Phân quyền thư mục
RUN chown -R www-data:www-data /var/www/html

# Mở cổng 80 cho Apache
EXPOSE 80

# Khởi chạy Apache khi container chạy
CMD ["apache2-foreground"]
#Download base image ubuntu 16.04
FROM ubuntu:22.04

# Update Ubuntu Software repository
RUN apt-get update


