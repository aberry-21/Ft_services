# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry&lmittie <aberry>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/13 17:10:48 by aberry&lmit       #+#    #+#              #
#    Updated: 2021/03/13 18:20:04 by aberry&lmit      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.11.7

RUN     apk update;\
        apk add\
        nginx\
        supervisor\
        php7 php7-fpm php7-mysqli \ 
        php7-zlib php7-curl php7-mbstring \
        php7-json php7-session


# Установка 
RUN     mkdir -p /www/ && \
        mkdir /run/nginx &&\
        chmod 744 /run/nginx &&\
        cd /www &&\
        wget http://wordpress.org/latest.tar.gz && \
        tar -xzvf latest.tar.gz && \
        rm latest.tar.gz && \
        cd - 

# Копируем необходимые конфиги в образ 
COPY    nginx.conf /etc/nginx/conf.d/default.conf
COPY    supervisord.conf /etc/supervisord.conf
COPY    wp-config.php /www/wordpress
# Копируем и даем права на запуск скрипта supervisord
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем 5050 порт
EXPOSE  5050

# Запускаем контейнер 
CMD    ["sh", "start_supervisord.sh"]