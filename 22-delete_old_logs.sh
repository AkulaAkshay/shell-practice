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

SOURCE_DIR= "/root"

if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "Source directory $SOURCE_DIR does not exist. Exiting."
    exit 1
fi

while IFS= read -r filepath
do
    echo "Deleting the old log file: $filepath" 
done <<< $SOURCE_DIR