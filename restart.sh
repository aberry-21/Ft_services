

kubectl delete -f ./srcs/nginx/nginx.yaml

kubectl delete -f ./srcs/phpMyAdmin/phpmyadmin.yaml

kubectl delete -f ./srcs/wordpress/wordpress.yaml

kubectl delete -f ./srcs/mySQL/mysql.yaml



kubectl get PersistentVolumeClaim
kubectl get pods
kubectl get deployments
kubectl get services