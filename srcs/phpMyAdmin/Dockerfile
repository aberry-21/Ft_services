FROM alpine:3.11.7


RUN 	apk update
RUN     apk add nginx  \
        php7 php7-fpm php7-mysqli \ 
        php7-zlib php7-curl php7-mbstring \
        php7-json php7-session

RUN     mkdir -p /www/ && \
        mkdir /run/nginx &&\
        chmod 744 /run/nginx &&\
        wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz && \
        tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz && \
        rm phpMyAdmin-5.0.2-all-languages.tar.gz && \
        mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin

# Nginx config file and webpage
COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	config.inc.php /www/phpmyadmin/

# Go to server_start.sh where run nginx
COPY	server_start.sh ./server_start.sh
RUN		chmod +x /server_start.sh

EXPOSE	5000

CMD		[ "sh", "server_start.sh" ]
