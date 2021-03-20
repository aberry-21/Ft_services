# Ft_services
<img width="722" alt="Screen Shot 2021-03-20 at 3 05 01 AM" src="https://user-images.githubusercontent.com/73585355/111852721-1a218180-8929-11eb-8bc3-27244c74b76f.png">

## Kubernetes

Открыть веб-панель Kubernetes в браузере: `minikube dashboard`\
Посмотреть информацию о Deployments: `kubectl get deployments`\
Посмотреть информацию о Pods: `kubectl get pods`\
Посмотреть информацию о Services: `kubectl get services`\
Зайти в pod: `kubectl exec -it <pod> sh`

## Информация о контейнерах
### nginx
Контейнер с сервером nginx, который прослушивает порты 80 и 443. Порт 80 будет в
http и должно быть систематическим перенаправлением типа 301 на 443, которое будет в https.
Отображаемая страница не имеет значения, если это не ошибка http.
Этот контейнер разрешит доступ к маршруту /wordpress, который выполняет перенаправление 307
на IP: WPPORT.
Он также должен разрешить доступ к /phpmyadmin через прокси-сервер, обратный IP:PMAPORT.
### WordPress
Веб-сайт WordPress, прослушивающий порт 5050, который будет работать с базой данных MySQL.
Обе службы должны работать в отдельных контейнерах. На сайте WordPress будет
несколько пользователей и администратор. Wordpress нужен собственный сервер nginx.
Балансировщик нагрузки должен иметь возможность перенаправлять напрямую на эту службу.

### phpMyAdmin
• phpMyAdmin, прослушивающий порт 5000 и связанный с базой данных MySQL. PhpMyAdmin нужен собственный сервер nginx.
Балансировщик нагрузки должен иметь возможность перенаправлять прямо в этот сервис.

### FTPS
Сервер FTPS прослушивает порт 21.
### Grafana
Платформа Grafana, прослушивающая порт 3000, связанная с базой данных InfluxDB.
Grafana будет следить за всеми вашими контейнерами. Вы должны создать одну панель управления
за услугу. InfluxDB и графана будут находиться в двух разных контейнерах.

## Полезные ссылки
### mySQL
https://techviewleo.com/how-to-install-mariadb-on-alpine-linux/
https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/
### telegraf
https://grafana.com/grafana/dashboards/928
https://github.com/influxdata/telegraf/blob/master/plugins/inputs/docker/README.md
https://github.com/influxdata/telegraf/tree/master/plugins/outputs/influxdb
https://github.com/influxdata/telegraf/blob/master/plugins/inputs/cpu/README.md
https://github.com/influxdata/telegraf/blob/master/plugins/inputs/disk/README.md
https://qastack.ru/devops/2506/docker-in-kubernetes-deployment