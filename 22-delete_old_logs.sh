#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m" #or 0m

LOGS_FOLDER="/var/log/shell-roboshop"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
SCRIPT_DIR=$PWD # for absoulute path
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #full path - /var/log/shell-script/mongodb.log
START_TIME=$(date +%s)
MONGODB_HOST=mongodb.akshaysunny.space
MYSQL_HOST=mysql.akshaysunny.space

mkdir -p $LOGS_FOLDER
echo "script started executed at : $(date)" | tee -a $LOG_FILE

SOURCE_DIR=/home/ec2-user/app-logs

if [ ! -d $SOURCE_DIR ]; then
    echo -e "Source directory $R .. $SOURCE_DIR does not exist. Exiting. $N " | tee -a $LOG_FILE
    exit 1
fi

while IFS= read -r filepath
do
    echo "Deleting the old log file: $filepath" | tee -a $LOG_FILE
    rm -f $filepath
    echo "Deleted the old log file: $filepath" | tee -a $LOG_FILE

done <<< $SOURCE_DIR

# steps:
# 1. Took the source directory and checked whether the source directory exists or not, if it doesn't exist then we will exit the script with non-zero exit code.  
# 2. Then find out the files
# 3. log the files which are going to be deleted
# 4. delete the files
#* we should not delete the application logs according to the government regulations and also if we delete the application logs then we will not be able to debug the application in case of any issues. we should backup the application logs to another server and then delete the application logs from the source server. 