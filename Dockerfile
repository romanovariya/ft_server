FROM debian:buster

#  обновляем локальный индекс пакетов
RUN apt-get -y update

# устанавливаем веб-сервер, mysql, fpm нужен для того, чтобы енджин передавал ему пхп запросы для последующей обработки
RUN apt-get install -y nginx php7.3 \
    php7.3-fpm default-mysql-server \
    php-mysql

#получение сертификата Let's Encrypt
# RUN add-apt-repository -y ppa:certbot/certbot && sudo apt install -y python3-certbot-nginx
# настраиваем nginx так, чтобы он использовал менеджер процессов php, для этого создаем конфиг  

# RUN  ln -s /srcs/php_config /etc/nginx/sites-enabled
COPY ./srcs/ ./

RUN cp my_config /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/my_config /etc/nginx/sites-enabled
RUN rm /etc/nginx/sites-enabled/default
RUN rm /etc/nginx/sites-available/default

RUN service mysql start && mysql < init_base.sql

CMD bash
