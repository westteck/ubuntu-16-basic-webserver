#!/usr/bin/env bash

#********** Set varibles

user=myuser

#********* End varibles

apt-get update && apt-get -V upgrade

apt-get install -y locate mlocate debian-goodies apticron htop zip rkhunter needrestart logwatch fail2ban apt-utils dialog nano
updatedb

if [ $(getent passwd $user) ] ; then
        echo user $user exists
    else
        adduser $user
    fi
# Set VI editor for editing SUDO
update-alternatives --config editor
# Add user to SUDO 
visudo
# ********* install virtualmin
mkdir /home/$user/virtualmin_install

wget http://software.virtualmin.com/gpl/scripts/install.sh -O /home/$user/virtualmin_install/install.sh
apt-get update && apt-get -V upgrade

