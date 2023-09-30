FROM php:7.4-apache


RUN apt-get update \
  && apt-get install --yes --no-install-recommends libpq-dev \
  && docker-php-ext-install mysqli pdo_pgsql pdo_mysql

COPY api/* /var/www/html/

COPY ports.conf /etc/apache2/ports.conf
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
