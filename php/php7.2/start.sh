#!/bin/bash
echo "sendmail_path = '/usr/sbin/ssmtp -t'" > /usr/local/etc/php/conf.d/mail.ini
echo "opcache.memory_consumption = 768M" >> /usr/local/etc/php/conf.d/opcache.ini
echo "max_input_vars = 10000" >> /usr/local/etc/php/conf.d/maxinputvars.ini
echo "memory_limit = 512M" >> /usr/local/etc/php/conf.d/memory.ini
sed -i "s/#FromLineOverride/FromLineOverride/g" /etc/ssmtp/ssmtp.conf  
#sed -i "s/hostname=.*/hostname=${VIRTUAL_HOST}/g" /etc/ssmtp/ssmtp.conf
sed -i "s/mailhub=.*/mailhub=s42.mhost.eu:25/g" /etc/ssmtp/ssmtp.conf
sed -i "s/pm.max_children = 5/pm.max_children = 25/g" /usr/local/etc/php-fpm.d/www.conf
#sed -i "s/;listen.allowed_clients = 127.0.0.1/listen.allowed_clients = 172.20.0.3/g" /usr/local/etc/php-fpm.d/www.conf
#usermod -u 2019 www-data
#groupmod -g 2019 www-data
#chown www-data:www-data /var/www/
#su - www-data -s /bin/bash -c "cd html && git clone git@gitlab.com:docker_redingo/bagstar.git ."
#su - www-data -s /bin/bash -c "cd html && git pull"
#su - www-data -s /bin/bash -c "cd html && composer install"
php-fpm
