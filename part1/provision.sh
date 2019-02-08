#!/usr/bin/env bash
# Provison script for Vagrant, Ubuntu 16.04 box.  Installs php 7.2, composer, modules and apache web server
# It creates temp folders and log files and updates php.ini parameters for using them
# Create a phpinfo page, which we will use to verify the PHP environment settings
# sets sys_temp_dir to “/tmp/php/showtime”
# and sets error log to php_showtime_error.log; this is where script errors should be logged to

set -euo pipefail
set -x

echo ">>> Starting Install Script"
if ! grep -q "phpdevbox" /etc/hosts; then
    echo "127.0.0.1 phpdevbox" >> /etc/hosts
fi

APACHE_LOG_DIR="/var/log/apache2"
TEMP_DIR="/tmp/php/showtime"
LOG_FILE="/var/log/php_showtime_error.log"
RESULTS_FOLDER="/var/www/html/results"

# Create necessary folders, files and permissions
mkdir -p ${TEMP_DIR} ${RESULTS_FOLDER}
chmod 1777 ${TEMP_DIR} ${RESULTS_FOLDER}
touch ${LOG_FILE}
chown www-data:www-data ${LOG_FILE} ${RESULTS_FOLDER}
chmod 664 ${LOG_FILE}
ln -s ${LOG_FILE} php_showtime_error.log

# Install packages
add-apt-repository ppa:ondrej/php
apt-get update
apt-get install -y apache2 git curl php7.2 php7.2-bcmath php7.2-bz2 php7.2-cli php7.2-curl php7.2-intl php7.2-json php7.2-mbstring php7.2-opcache php7.2-soap php7.2-sqlite3 php7.2-xml php7.2-xsl php7.2-zip libapache2-mod-php7.2

# Change phpini sys_temp_dir and error_log
sed -i.bak "/sys_temp_dir.*/c\sys_temp_dir=${TEMP_DIR}" /etc/php/7.2/apache2/php.ini
sed -i.bak "/sys_temp_dir.*/c\sys_temp_dir=${TEMP_DIR}" /etc/php/7.2/cli/php.ini
sed -i.bak "/error_log = php.*.log/c\error_log = ${LOG_FILE}" /etc/php/7.2/apache2/php.ini
sed -i.bak "/error_log = php.*.log/c\error_log = ${LOG_FILE}" /etc/php/7.2/cli/php.ini

# Build phpinfo page
echo "<?php
        // Show all information, defaults to INFO_ALL
        phpinfo();
?>" > /var/www/html/phpinfo.php

git clone 
# Build testerror page 
# echo "<?php
#         // Script opens unexisting file so it generates an error.
#         $file=fopen("nonexistent.txt","r");
# ?>" > /var/www/html/testerror.php

# # Function to see test folder
# echo "<?php 
#     // Generate a random temp file in sys_temp_folder
#     $temp_file = tempnam(sys_get_temp_dir(), 'Testtempfile');
#     echo $temp_file;
# ?>" > /var/www/html/testtempfolder.php

# mv html index file 
mv /home/vagrant/IndexST.html /var/www/html/

# Configure Apache
echo "<VirtualHost *:80>
    DocumentRoot /var/www/html
    AllowEncodedSlashes On
    <Directory /var/www/html>
        Options +Indexes +FollowSymLinks
        DirectoryIndex IndexST.html
        Order allow,deny
        Allow from all
        AllowOverride All
    </Directory>
     <Directory /var/www/html/${RESULTS_FOLDER}>
        Options Indexes FollowSymLinks
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/000-default.conf

a2enmod rewrite
service apache2 restart

if [ -e /usr/local/bin/composer ]; then
    /usr/local/bin/composer self-update
else
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
fi

# Reset home directory of vagrant user
echo "** PHP Environment Visit http://localhost:5051 or http://phpdevbox.test.com in your browser for to view the application **"
echo " done"
