# Inception


### SSH Commands


    sudo apt install openssh-server
    sudo nano /etc/ssh/sshd_config
    sudo systemctl restart ssh
    sudo systemctl status ssh
    sudo service ssh start
    sudo service ssh stop

### Firewall

      sudo apt install ufw
      sudo ufw status
      sudo ufw enable
      sudo ufw allow 4242

### Connecting to a Server Using SSH
        hostname -I
        ssh UserName@IPAddressHostname -p 4242
      
my containers :

-- project java 

-- setup a ‎JDK 21

-- WordPress + php-fpm

-- MariaDB

-- NGINX with TLSv1.2 or TLSv1.3 only


This document is a System Administration related exercise.
