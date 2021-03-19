# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/19 22:56:16 by aberry            #+#    #+#              #
#    Updated: 2021/03/19 23:06:47 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3

# Подключаем необходимые пакеты 
RUN apk update
RUN apk add\
    libc6-compat\
    supervisor\
    influxdb

# Установка telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz &&\
    tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C / &&\
    rm telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf /etc/telegraf/

# Переносим скрипт запуска сервера
COPY    supervisord.conf /etc/supervisord.conf
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем необходимые порты 
EXPOSE 3000

# Запускаем контейнер 
CMD     [ "sh", "start_supervisord.sh" ]

