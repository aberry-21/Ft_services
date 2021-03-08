# Alpine Linux uses OpenRC for its init system. The service can be started using the commands
# Alpine Linux использует OpenRC для своей системы инициализации. Сервис можно запустить с помощью команд
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
# Set BD
# Устанавливаем наши бд
mysql -u root mysql < baseBD.sql
mysql -u root wordpress < wordPressBD.sql
# Stop init
# Завершаем инициализацию 
rc-service mariadb stop
# Start the MariaDB daemon:
# Запускаем демон бд
/usr/bin/mysqld_safe --datadir='/var/lib/mysql'