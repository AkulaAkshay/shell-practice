#!/bin/bash

#we are installing 3 packages - mongodb, ngix, python3

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "Error: please run the command with the root privilages"
    exit 1 # when we have a probability of failure we need to provide exit code as non-zero
fi

VALIDATE(){

    if [ $1 -ne 0]; then
      echo "ERROR: Installing $2 is failed"
      exit 1
    else
      echo "Installing $2 is success"
      #exit 0 -- if we want we can prvide but by default it takes 0 only
    fi

}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install python3 -y
VALIDATE $? "PYTHON3"