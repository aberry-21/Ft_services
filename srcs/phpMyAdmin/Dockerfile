# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/12 00:00:42 by aberry&lmit       #+#    #+#              #
#    Updated: 2021/03/16 21:34:12 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.11.7

# Подключаем необходимые пакеты для работы nginx, supervisor и phpMyAdmin
RUN     apk update;\
        apk add\
        nginx\
        supervisor\
        php7 php7-fpm php7-mysqli \ 
        php7-zlib php7-curl php7-mbstring \
        php7-json php7-session

# Установка phpMyAdmin и создание необходимых директорий 
RUN     mkdir -p /www/ && \
        mkdir /run/nginx &&\
        mkdir /www/phpmyadmin/tmp/ &&\
        chmod 744 /run/nginx &&\
        wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
        tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
        rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
        mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin

# Копируем необходимые конфиги в образ 
COPY    nginx.conf /etc/nginx/conf.d/default.conf
COPY    config.inc.php /www/phpmyadmin/
COPY    supervisord.conf /etc/supervisord.conf

# Копируем и даем права на запуск скрипта supervisord
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем 5000 порт
EXPOSE  5000

# Запускаем контейнер 
CMD    ["sh", "start_supervisord.sh"]
