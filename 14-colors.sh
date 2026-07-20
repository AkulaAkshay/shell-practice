#!/bin/bash

#green - success; red- failure; yellow - skip

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m" #or 0m

#echo -e "$G Hello World" # color mentioned here will go to further lines of code also. hence we need to stop it
echo -e "$G Hello World $N"
echo "check this color"