# delete VM if already exists
minikube delete

# start VM
minikube start --vm-driver=virtualbox

# sets up the docker env variables
eval $(minikube docker-env)

# config metallb (load balancer)
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

# open server page
open http://192.168.99.101

# eun the dashboard
minikube dashboard

