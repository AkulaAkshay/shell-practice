#!/bin/bash

#we are installing 3 packages - mongodb, ngix, python3

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "Error: please run the command with the root privilages"
    exit 1 # when we have a probability of failure we need to provide exit code as non-zero
fi

dnf install mysql -y

if [ $? -ne 0]; then
    echo "ERROR: Installing MYSQL is failed"
    exit 1
else
    echo "Installing MYSQL is success"
    #exit 0 -- if we want we can prvide but by default it takes 0 only
fi

dnf install nginx -y

if [ $? -ne 0]; then
    echo "ERROR: Installing NGINX is failed"
    exit 1
else
    echo "Installing NGINX is success"
    #exit 0 -- if we want we can prvide but by default it takes 0 only
fi

dnf install python3 -y

if [ $? -ne 0]; then
    echo "ERROR: Installing mongodb-mongosh is failed"
    exit 1
else
    echo "Installing mongodb-mongosh is success"
    #exit 0 -- if we want we can prvide but by default it takes 0 only
fi