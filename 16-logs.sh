#!/bin/bash

#we are installing 3 packages - mongodb, ngix, python3

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m" #or 0m

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #full path - /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo "script started executed at : $(date)" | tee -a $LOG_FILE #tee is used because by echo statemnet it prints in the terminal but dosen't
# store in the logs, in order to print in the terminal and store in the logs we use tee command.

if [ $USERID -ne 0 ]; then 
    echo "Error: please run the command with the root privilages"
    exit 1 # when we have a probability of failure we need to provide exit code as non-zero
fi

VALIDATE(){

    if [ $1 -ne 0 ]; then
      echo -e "ERROR: Installing $2 is $R failed $N" | tee -a $LOG_FILE
      exit 1
    else
      echo -e "Installing $2 is $G success $N" | tee -a $LOG_FILE
      #exit 0 -- if we want we can prvide but by default it takes 0 only
    fi

}


dnf list installed mysql &>>$LOG_FILE
#install if not found
if [ $? -ne 0 ]; then
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "MYSQL"
else
   echo -e "MYSQL is already installed so $Y skipping $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
#install if not found
if [ $? -ne 0 ]; then
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "NGINX"
else
   echo -e "NGINX is already installed so $Y skipping $N" | tee -a $LOG_FILE
fi


dnf list installed python3 &>>$LOG_FILE
#installed if not found
if [ $? -ne 0 ]; then
   dnf install python3 -y &>>$LOG_FILE
   VALIDATE $? "PYTHON3"
else
   echo -e "PYTHON3 is already installed do $Y skipping $N" | tee -a $LOG_FILE
fi

