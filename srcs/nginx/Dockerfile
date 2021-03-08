FROM alpine:3.11.7

#Install packages
RUN		apk update &&\
		apk add openssl &&\
		apk add nginx

# Create user that the web server will use
RUN		adduser -D -g 'www' www

# Setup web server files and permissions
RUN		mkdir /www;\
		chown -R www:www /var/lib/nginx;\
		chown -R www:www /www;\
		mkdir -p /run/nginx

# Nginx config file and webpage
COPY	nginx.conf /etc/nginx/conf.d/default.conf
COPY	index.html /www/index.html

# Create SSL key
RUN 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj '/C=RU/ST=Moscow/L=Moscow/O=42/OU=21/CN=aberry' \
		-keyout /etc/ssl/nginx_localhost.key \
		-out /etc/ssl/nginx_localhost.crt

# Go to server_start.sh where run nginx
COPY	server_start.sh ./server_start.sh
RUN		chmod +x /server_start.sh
CMD		[ "sh", "server_start.sh" ]
EXPOSE	80 443 22