#!/bin/bash

echo "All the variables passed to the script: $@"
echo "All the variables passed to the script: $*"
#we did not pass any variable value for * and @, but still it gives the variable values we passed in the command line,
#these are called special variables i.e., by default the variables given by the shell itself we are not creating any values for these 
#special variables [for every tool we have some special variables like jenkins,etc.,]

echo "name of the script execution : $0" # dynamically provides the name of the script
echo "current working directory : $PWD" #provides present working directory
echo "who is running this: $USER" #who is running this script
echo "User's home directory: $HOME" # Users home directory
echo "PID of the script: $$" #when we are executing this script PID will be generated, PID of the scrit
sleep 10 &
echo "PID of the last command in background is : $!" #PID of last command which is running in the background 

#$? - exit code --> 0-success; 1 to 127-failure ----> #? - checks for last executed command in the shell
#[when we provide a command , the exit status of that particular command i.e., whether it 
#got success or failed, the shell stores in this #? - we only need to print and check from this]

