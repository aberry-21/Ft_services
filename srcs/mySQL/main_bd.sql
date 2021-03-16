# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    main_bd.sql                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/16 19:44:13 by aberry            #+#    #+#              #
#    Updated: 2021/03/16 19:44:32 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CREATE DATABASE wordpress;
CREATE USER 'aberry'@'%' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON wordpress.* TO 'aberry'@'%';
FLUSH PRIVILEGES;