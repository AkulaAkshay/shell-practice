#!/bin/bash

NAME=INDIA

echo "My country name is $NAME"
echo "PID of the script-1 is: $$"
sh 21-script2.sh #-->we are calling script2 from script1, hence the PID of script2 will be different from script1, because when we call script2 from script1 it will create a new process for script2 and hence the PID of script2 will be different from script1. And also script2 will not have access to the variables of script1, because script2 is a new process and hence it will not have access to the variables of script1. Hence the output of script2 will be "My country name is " and not "My country name is INDIA" because script2 will not have access to the variable NAME of script1.
# By default the variables of script1 will not be available to script2, because of the process isolation i.e., independent processes (no relation), and security reasons, hence the variables of script1 will not be available to script2. But if we want to make the variables of script1 available to script2, we can use the export command, which will make the variables of script1 available to script2. Hence the output of script2 will be "My country name is INDIA" because script2 will have access to the variable NAME of script1.
echo "PID of the script-1 is: $$" 

#-----------------Differences 
#Scope and Purpose:
#------------------
#export: Turns a local shell variable into an environment variable. Any child process or subshell launched from that terminal can see it, but it does not read configuration files or load external code blocks into your active session.
#source (or the shortcut .): Runs every line of a text file inside your current running shell process. It is used to apply configuration changes (like updating your .bashrc file) immediately without opening a new terminal.
#Execution Context:
#------------------
#export: Operates on a single variable name and value pair.
#source: Evaluates an entire file of multiple commands, functions, and variable assignments sequentially

#DB source and export
#-----------------export example-----------------
# Define a normal local variable
#MY_VAR="hello"

# Launch a child bash shell and try to read it
#bash -c 'echo $MY_VAR'   # Output is empty (child cannot see it)

# Now export the variable
#export MY_VAR="hello"

# Launch a child bash shell again
#bash -c 'echo $MY_VAR'   # Output: hello (child inherits the environment variable)
#-----------------source example-----------------
# Contents of config.sh
#APP_NAME="MyApp"
#export API_KEY="12345"

# Run source on the file
#source config.sh

# Check the variable in your current terminal
#echo $APP_NAME   # Output: MyApp
#echo $API_KEY    # Output: 12345
#-----------------------------------------------------

#by default when we issue a command in the terminal, it will search in echo $PATH --> /root/.local/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin (when we say source it will search in the PATH echo $PATH) and if it finds the command in any of the directories present in the PATH then it will execute that command, but if it doesn't find the command in any of the directories present in the PATH then it will throw an error saying command not found. Hence if we want to know where a command is present we can use which command.
#which ls -> /usr/bin/ls ; which cp -> /usr/bin/cp ; which bash -> /usr/bin/bash ; which python3 -> /usr/bin/python3 ; which java -> /usr/bin/java ; which node -> /usr/bin/node ; which npm -> /usr/bin/npm



NAME=INDIA

echo "My country name is $NAME"
echo "PID of the script-1 is: $$"
#source 21-script2.sh -> by default source command will search in the PATH echo $PATH and if it finds the command in any of the directories present in the PATH then it will execute that command, but if it doesn't find the command in any of the directories present in the PATH then it will throw an error saying command not found. Hence if we want to know where a command is present we can use which command.
source ./21-script2.sh #./ --> this will search in the current directory (we need to specify the current path inorder to check in the current path)  -->we are calling script2 from script1, hence the PID of script2 will be same as script1, because when we call script2 from script1 it will not create a new process for script2 and hence the PID of script2 will be same as script1. And also script2 will have access to the variables of script1, because script2 is not a new process and hence it will have access to the variables of script1. Hence the output of script2 will be "My country name is INDIA" because script2 will have access to the variable NAME of script1.

#How can you call a script from another script in Linux?
#There are two ways to call a script from another script in Linux:
#1. Using the source command: This will execute the script in the current shell, and any variables or functions defined in the called script will be available in the calling script. - script2 failure will also cause script1 to fail because script2 is running in the same shell as script1 (same PID). Hence if script2 fails, script1 will also fail. - if we want to write some thing in common then we can choose this method.
#2. Using the bash command: This will execute the script in a new shell, and any variables or functions defined in the called script will not be available in the calling script. - script2 failure will not cause script1 to fail because script2 is running in a new shell (diff PID). Hence if script2 fails, script1 will continue to run. - if the scripts 1, 2 are independent of each other then we can use bash command to call script2 from script1, but if the scripts 1, 2 are dependent on each other then we can use source command to call script2 from script1.
