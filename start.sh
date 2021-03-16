docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t phpmyadmin_image ./srcs/phpMyAdmin
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml

docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

docker build -t mysql_image ./srcs/mySQL
kubectl apply -f ./srcs/mySQL/mysql.yaml