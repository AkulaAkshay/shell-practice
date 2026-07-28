#!/bin/bash

# acc to govt rules we should not delete the app logs, we should keep the logs of atleast past 5yrs.

#steps
# ---------
# we will have source directory and destination directory
# check whether the source directory and destination directory exists or not, if it doesn't exist then we will exit the script with non-zero exit code.
# find out the files which are older than $DAYS (14) days
# zip the files which are older than $DAYS days 
# move the zipped files to the destination directory -> there will be some teams like storage teams, etc., they will keep the zipped files in the another storage server for backup purpose, so that if we need the logs in future we can get it from the backup server.
# delete the files which are older than $DAYS days from the source directory
# Daily login into the server and deleting the old logs is a tedious task, so we will automate this process --> we have some thing called crone tab (automatic scheduler).


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

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14} #if user doesn't provide the 3rd argument then by default it will take 14 days, if user provides the 3rd argument then it will take that value.

mkdir -p $LOGS_FOLDER
echo "script started executed at : $(date)" | tee -a $LOG_FILE

#usually this is an adminstration task, hence we will check whether the user is root user or not, if not then we will exit the script with non-zero exit code.
if [ $USERID -ne 0 ]; then 
    echo "Error: please run the command with the root privilages"
    exit 1 # when we have a probability of failure we need to provide exit code as  non-zero
fi  

# for our script we are aking the user to  give the argumnets dynaically, so that we can use this script for any source directory and destination directory, so we will take the source directory and destination directory as command line arguments.
# sh backup.sh <source_directory> <destination_directory> <number_of_days (optional)> --> this is thecommand line arguments which we are going to provide while executing the script. 

USAGE(){
    
    echo -e " $R Usage:: sudo su backup.sh <source_directory> <destination_directory> <number_of_days (optional, by default 14)> $N"  
}

if [ $# -lt 2 ]; then
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]; then
    echo -e " $R source directory $SOURCE_DIR does not exist. $N" #| tee -a $LOG_FILE
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]; then
    echo -e " $R destination directory $DESTINATION_DIR does not exist. $N" #| tee -a $LOG_FILE
    exit 1
fi

# if [ ! -d "$SOURCE_DIR" ]; then
#     echo -e " $R source directory $SOURCE_DIR does not exist. $N"
#     exit 1
# elif [ ! -d "$DESTINATION_DIR" ]; then
#     echo -e " $R destination directory $DESTINATION_DIR does not exist. $N"
#     exit 1
# fi

FILES=$( find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS ) #find command will find the files which are older than $DAYS days and it will store in the variable FILE.

#z- check whether the variable FILES is empty or not, if it is empty then it means there are no files which are older than $DAYS days, if it is not empty then it means there are files which are older than $DAYS days.

if [ ! -z "${FILES}" ]; then
    #not empty
    echo -e " Found files $FILES" 
     # if files are found then we will zip the files and move to the destination directory and delete the files from the source directory.
    #we need to decide the file name with the timestamp
    TIMESTAMP=$(date +%F-%H-%M-%S)
    #ZIPFILE
    ZIP_FILE_NAME=$"DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "zip file name: $ZIP_FILE_NAME"
    echo $FILES | zip -@ -j "$ZIP_FILE_NAME" 
     
else
    echo -e " $G No files older than $DAYS days found in $SOURCE_DIR $N so $Y skipping... $N" 

fi

