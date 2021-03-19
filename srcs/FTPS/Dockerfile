# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/19 17:44:03 by aberry            #+#    #+#              #
#    Updated: 2021/03/19 23:17:11 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3

# Подключаем необходимые пакеты и создаем необходимую директорию 
RUN apk update
RUN apk add\
    libc6-compat\
    vsftpd\
    openssl\
    supervisor &&\
    mkdir -p /var/ftp

# Установка telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz &&\
    tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C / &&\
    rm telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf /etc/telegraf/

# Создаем самоподписанный SSL протокол 
RUN     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=aberry' \
        -keyout /etc/vsftpd/ftps.key\
        -out /etc/vsftpd/ftps.crt

# Создаем пользователя и переносим конфиг ftps
RUN adduser -D -g 'www' www
RUN echo "www:www" | chpasswd
COPY    vsftpd.conf /etc/vsftpd/

# Переносим скрипт запуска сервера
COPY    supervisord.conf /etc/supervisord.conf
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем необходимые порты 
EXPOSE 21 21000

# Запускаем контейнер 
CMD     [ "sh", "start_supervisord.sh" ]
