# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry&lmittie <aberry>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/12 00:04:37 by aberry&lmit       #+#    #+#              #
#    Updated: 2021/03/13 16:44:28 by aberry&lmit      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.11.7

# Устанавливаем необходимые пакеты
RUN     apk update &&\
        apk add openssl\
        nginx\
        supervisor

# Создаем пользователя 
RUN     adduser -D -g 'www' www

# Создаем необходимые директории и выдаем права 
RUN     mkdir /www;\
        chown -R www:www /var/lib/nginx;\
        chown -R www:www /www;\
        mkdir -p /run/nginx

# Перезаписываем конфиги nginx и supervisord, закидываем страницу index.html
COPY    nginx.conf /etc/nginx/conf.d/default.conf
COPY    index.html /www/index.html
COPY    supervisord.conf /etc/supervisord.conf

# Создаем самоподписанный SSL протокол 
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=aberry' \
        -keyout /etc/ssl/nginx_localhost.key \
        -out /etc/ssl/nginx_localhost.crt

# Переносим скрипт запуска сервера
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем необходимые порты 
EXPOSE  80 443

# Запускаем контейнер 
CMD     [ "sh", "start_supervisord.sh" ]