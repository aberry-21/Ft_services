# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start_supervisord.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aberry <aberry>                            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/12 00:01:23 by aberry            #+#    #+#              #
#    Updated: 2021/03/20 03:11:28 by aberry           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# Запускаем supervisord
supervisord -c /etc/supervisord.conf