# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/12 14:04:43 by rmarguri          #+#    #+#              #
#    Updated: 2021/03/08 16:38:06 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.11.7

RUN		apk update && \
		apk add openrc 

RUN		apk add mysql mysql-client && \
		mkdir "/run/mysqld" && \
		chown -R mysql /run/mysqld

COPY	./wordPressBD.sql ./start.sh ./baseBD.sql ./

COPY	./my.cnf /etc/my.cnf

EXPOSE	3306

CMD		[ "sh", "bd_start.sh" ]