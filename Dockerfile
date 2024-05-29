FROM php:8.2.6-fpm-alpine3.17
# Apk install
RUN apk --no-cache update && apk --no-cache add bash git


# Install pdo
RUN set -ex \
&& apk --no-cache add \
postgresql-dev

RUN docker-php-ext-install pdo pdo_pgsql pgsql

#Install npm
#RUN apk add --update yarn

#RUN apk add --update npm

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer

# Cron
#RUN apt-get update && apt-get install -y cron

# Install Xdebug
#RUN pecl install xdebug-3.1.5 && docker-php-ext-enable xdebug

# Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash &&  mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

WORKDIR /var/www/html