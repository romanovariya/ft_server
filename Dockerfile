FROM debian:buster

#  обновляем локальный индекс пакетов
RUN apt-get -y update
RUN apt-get -y upgrade

# устанавливаем веб-сервер, mysql, fpm нужен для того, чтобы енджин передавал ему пхп запросы для последующей обработки
RUN apt-get install -y nginx \
    php7.0-mysql php7.0-curl \
    php7.0-json php7.0-cgi php7.0 \
    libapache2-mod-php7.0 php7.0-xml \
    php-fpm php-mysql

# настраиваем nginx так, чтобы он использовал менеджер процессов php, для этого создаем конфиг  

RUN  ln -s /srcs/php_config /etc/nginx/sites-enabled




