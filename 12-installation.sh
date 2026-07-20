#!/bin/bash

#checking whether the user is sudo or not - for sudo/root user id=0; for non-root users id=!0
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

#shell scripting biggest dis-advantage is- when there is an error in the script --> it should stop generally, but in shell even if we have 
#error the shell will proceed further which is not good. Hence we need to stop the shell from procedding further in case of any failure