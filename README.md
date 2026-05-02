Basic Docker deployment for Dummies ;)

👋 Hi from highly-tuned Linux dear Jay!

This Dockefile contains:


- PHP-FPM (FastCGI Process Manager)
- an advanced, high-performance alternative to standard PHP FastCGI,
designed to handle heavy-loaded, high-traffic websites efficiently.
- MySQL database 
- Apache HTTP server


# HowTo

## Build image
```
docker build -t db-test .
```
## Run container

```
docker run -d -p 3696:80 -p 3306:3306 --name database-php-test db-test
```

👉 alternative port is used :3696 instead of :80(0.0.0.0:3696->80/tcp)
due to possible collision in network

## Connect to a container
```
docker exec -it database-php-test bash

OR you can try

docker exec -it database-php-test /bin/sh
```

## Find out, what kind of shell is used:
```
/etc # echo $0
/bin/sh
```

## Connect to mysql database inside a container
```
mysql -u root -ptoor
```

## MYSQL/MariaDB COMMANDS
### SQL BASICs:
```
SHOW DATABASES;
SHOW TABLES;
DESCRIBE <table_name>;
```

### Creating a user "martin" with password "martin"
```
CREATE USER 'martin'@'%' IDENTIFIED BY 'martin';
GRANT ALL PRIVILEGES ON martin.* TO 'martin'@'%';
FLUSH PRIVILEGES;
```

## Creating a new database named "guitarshop" if not exists
## and grant all privileges to user "martin"
```
CREATE DATABASE IF NOT EXISTS guitarshop;
GRANT ALL PRIVILEGES ON guitarshop.* TO 'martin'@'%';
FLUSH PRIVILEGES;

```
## Checking permissions for user martin
```
SHOW GRANTS FOR 'martin'@'%';
```

## IMPORT SQL database
```
mysql -u martin -p guitarshop.sql < guitarshop.sql
```

## IMPORT database through DOCKER connection directly to container:
```
docker exec -i <db_container> mysql -u martin -pmartin <db_name> < dump.sql
```

## MariaDB
```
docker exec -i <db_container> mariadb -u martin -pmartin <db_name> < database.sql
```

## Check Database through DOCKER
```
docker exec -it <db_container> mysql -u martin -pmartin -e "SHOW DATABASES;"
```

## MariaDB
```
docker exec -it <db_container> mariadb -u martin -pmartin -e "SHOW DATABASES;"
```

## COPYING a FILE/DIR through DOCKER to container
```
docker cp index.html <container_name>:/var/www/html/
```
### for whole directory
```
docker cp dir/ <db_container>:/var/www/html
```

## Check if PHP-FPM listens in running container
```
docker exec -it <php-fpm_container> netstat -tlnp
```

### Output something like that:
```
#Active Internet connections (only servers)
#Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
#tcp        0      0 :::9000                 :::*                    LISTEN      1/php-fpm.conf)
```

## Check if PHP has installed driver
### Inside container run:
```
php -m | grep mysql
```

## Check if MySQL listens on right IP
### Inside containter run these commands:
```
sed -i 's/^bind-address.*/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
```

## Creating a testing PHP page(test.php) about details PHP & MySQL(MariaDB)
```
cat << EOF > /var/www/html/test.php
<?php
phpinfo();
?>
EOF
```

DevOps Martino 2022-2026
