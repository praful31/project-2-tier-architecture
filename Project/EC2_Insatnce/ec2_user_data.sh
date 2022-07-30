##########      Link = https://registry.terraform.io/providers/serverscom/serverscom/latest/docs/guides/user-data       #########

#!/bin/bash

###  SYSTEM UPDATE ###
sudo apt update -y
sudo apt upgrade -y


###   INSTALL REQUIRED SOFTWARE AND DATABASE  ###
sudo apt install apache2 -y
sudo apt install mariadb-server -y
sudo apt install php7.2 -y
sudo apt install default-jdk -y
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.20/bin/apache-tomcat-10.0.20.tar.gz
sudo tar xzvf apache-tomcat-10*tar.gz -C /mnt






###   START ENABLE AND RESTART WEB SERVER AND DATABASE SERVER   ###  
systemctl start apache2
systemctl enable apache2
systemctl start mariadb
systemctl enable mariadb

###    SET MARIA DB ROOT PASSWORD    ###
mysqladmin -u root password $DBRootPassword



### DATABASE NAME AND PASSWORD SETUP WITH USING VARIABLES   ###
DBName='my_database'
DBUser='student'
DBPassword='student123'
DBRootPassword='student123'
DBEndpoint='terraform-20220728140711562300000001.c51ts2vw0rg9.us-east-1.rds.amazonaws.com'



