# Удаляем предыдущий minikube если он есть
minikube delete

# Запускаем новый
minikube start --vm-driver=virtualbox

# Устанавливаем docker env
eval $(minikube docker-env)

minikube addons enable metallb
kubectl apply -f ./srcs/metallb.yaml

docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build -t phpmyadmin_image ./srcs/phpMyAdmin
kubectl apply -f ./srcs/phpMyAdmin/phpmyadmin.yaml

docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

docker build -t mysql_image ./srcs/mySQL
kubectl apply -f ./srcs/mySQL/mysql.yaml

docker build -t ftps_image ./srcs/FTPS
kubectl apply -f ./srcs/FTPS/ftps.yaml

docker build -t grafana_image ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

docker build -t influxdb_image ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

# Открываем дашборд
minikube dashboard
