# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/13 16:45:03 by aberry&lmit       #+#    #+#              #
#    Updated: 2021/03/16 19:50:35 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM    alpine:3.11.7

# Устанавливаем необходимые пакеты
RUN     apk update &&\
        apk add mysql \
        mysql-client\
        supervisor\
        openrc

# Копируем необходимые базы данных и конфиги в образ 
COPY    supervisord.conf /etc/supervisord.conf
COPY    my.cnf /etc/my.cnf
COPY    main_bd.sql ./main_bd.sql

# Копируем инициализацию баз данных
COPY    bd_init.sh /bd_init.sh
RUN     chmod +x /bd_init.sh

# Копируем и даем права на запуск скрипта supervisord
COPY    start_supervisord.sh ./start_supervisord.sh
RUN     chmod +x /start_supervisord.sh

# Слушаем 3306 порт
# Порт 3306 - это порт по умолчанию для классического протокола MySQL
EXPOSE  3306

# Запускаем контейнер 
CMD    ["sh", "start_supervisord.sh"]