# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/19 22:56:16 by aberry            #+#    #+#              #
#    Updated: 2021/03/20 01:29:07 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12.3

# Подключаем необходимые пакеты 
RUN apk update
RUN apk add\
    libc6-compat\
    supervisor

# Установка telegraf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.0_linux_amd64.tar.gz &&\
    tar -xf telegraf-1.17.0_linux_amd64.tar.gz --strip-components=2 -C / &&\
    rm telegraf-1.17.0_linux_amd64.tar.gz
COPY telegraf.conf /etc/telegraf/

# Установка grafana
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.6.linux-amd64.tar.gz &&\
     tar -xf grafana-enterprise-7.3.6.linux-amd64.tar.gz --strip-components=1 -C / &&\
     rm grafana-enterprise-7.3.6.linux-amd64.tar.gz
# копируем dashboards grafana
COPY grafana.db /data/

# Переносим скрипт запуска сервера
COPY    supervisord.conf /etc/supervisord.conf
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем необходимые порты 
EXPOSE 3000

# Запускаем контейнер 
CMD     [ "sh", "start_supervisord.sh" ]

