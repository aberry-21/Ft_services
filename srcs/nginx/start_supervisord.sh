# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_supervisord.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry&lmittie <aberry>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/12 00:01:23 by aberry&lmit       #+#    #+#              #
#    Updated: 2021/03/12 00:18:43 by aberry&lmit      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Запускаем supervisord

supervisord -c /etc/supervisord.conf