# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    bd_init.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/16 19:45:14 by aberry            #+#    #+#              #
#    Updated: 2021/03/19 17:52:07 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Alpine Linux использует OpenRC для своей системы инициализации.
# Сервис можно запустить с помощью команд
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
# Устанавливаем наши бд
mysql -u root mysql < main_bd.sql
mysql -u root wordpress < wordpress_bd.sql
# Завершаем инициализацию 
rc-service mariadb stop