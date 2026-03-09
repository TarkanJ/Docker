# Základní image
FROM ubuntu:24.04

# Zastav interaktivní prompty během instalace
ENV DEBIAN_FRONTEND=noninteractive

# Aktualizace a instalace Apache, MySQL a PHP
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y apache2 mysql-server php libapache2-mod-php php-mysql wget curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Nastavení MySQL (root bez hesla pro jednoduchý test)
RUN service mysql start && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

# Vytvoření testovací PHP stránky
RUN echo "<?php phpinfo(); ?>" > /var/www/html/index.php

# Exponuj porty
EXPOSE 80 3306

# Spuštění Apache a MySQL při startu kontejneru
CMD service mysql start && apachectl -D FOREGROUND
