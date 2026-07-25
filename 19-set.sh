#!/bin/bash


#here even though we have an error, both the statements 1,2 will be executed because by default the shell archicheture is designed in such  a way that whole code will be exexuted irrespective of any error present, that is the reason in shell-roboshop for every line we execute, we use VALIDATE function. AND we have something called set if we use this we can stop the execution of the code whenever we see an error

#echo "HELLO"
#echo "statement1: Before error statements"
#kjnjnjlkdsa
#echo "statement2: After error statements"


#set -e #e- exit i.e., when we experience an error immediatey exit

#echo "HELLO"
#echo "statement1: Before error statements"
#kjnjnjlkdsa
#echo "statement2: After error statements"

# we have set -e, even though we wrote the VALIDATE function but to show the whole procredure i.e, whole sequentail flow will be understood by user and immediately get the attention that where the error has occured but when we use set -e the script just stops and throw error ,  if we want to check the error we need to go to logs and investigate this can be done by an engineer but cant be done by an user this is the issue when we use set -e.
#VALIDATE function is not on;y for validation but also we can also know the progress of the script for the user
#  if we choose set -e, we can decrease a line by removing VALIDATE fucntion line but sequential flow and immediate traceout of the error is not possible we need to investigate
#if we want to know at which command we got error i.e., in which line we got the error - we have something called set -euo pipe filed --> this command says that , when we encounter an error give the complete error don't mask anything --> on high level we are saying the script to fail don't proceed
#when we  use the VALIDATE function we will clearly know where there is an error but what if we don't want to use VALIDATE function, in order to know that in which line we got the error -> we have some thing called trap command


set -e

error(){
    echo "There is an error"
}

trap error ERR

echo "HELLO"
echo "statement1: Before error statements"
kjnjnjlkdsa # shell will uderstand that there is an error here and signals ERR. since ERR is in line 32 (3rd word), the 32nd line executes that will intern call the error function and that error function will be called and content present in that function will be executed.
echo "statement2: After error statements"
