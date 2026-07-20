#!/bin/bash

#we are installing 3 packages - mongodb, ngix, python3

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m" #or 0m

if [ $USERID -ne 0 ]; then 
    echo "Error: please run the command with the root privilages"
    exit 1 # when we have a probability of failure we need to provide exit code as non-zero
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then
      echo -e "ERROR: Installing $2 is $R failed $N"
      exit 1
    else
      echo -e "Installing $2 is $G success $N"
      #exit 0 -- if we want we can prvide but by default it takes 0 only
    fi

}


dnf list installed mysql
#install if not found
if [ $? -ne 0 ]; then
   dnf install mysql -y
   VALIDATE $? "MYSQL"
else
   echo -e "MYSQL is already installed so $Y skipping $N"
fi

dnf list installed nginx
#install if not found
if [ $? -ne 0 ]; then
   dnf install nginx -y
   VALIDATE $? "NGINX"
else
   echo -e "NGINX is already installed so $Y skipping $N"
fi


dnf list installed python3
#installed if not found
if [ $? -ne 0 ]; then
   dnf install python3 -y
   VALIDATE $? "PYTHON3"
else
   echo -e "PYTHON3 is already installed do $Y skipping $N"
fi


