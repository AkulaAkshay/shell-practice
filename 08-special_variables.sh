#!/bin/bash

echo "All the variables passed to the script: $@"
echo "All the variables passed to the script: $*"
#we did not pass any variable value for * and @, but still it gives the variable values we passed in the command line,
#these are called special variables i.e., by default the variables given by the shell itself we are not creating any values for these 
#special variables [for every tool we have some special variables like jenkins,etc.,]

echo "name of the script execution : $0" # dynamically provides the name of the script
echo "current working directory : $PWD" #provides present working directory