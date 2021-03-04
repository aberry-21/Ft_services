# delete VM if allready exists
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

# open server page
open http://192.168.99.201

# eun the dashboard
minikube dashboard



