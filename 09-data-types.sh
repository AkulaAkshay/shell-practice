#!/bin/bash

#There are no explcit dta types in shell, usually shell will consider every thing as string initially, but when we are using that data type 
# shell behaves intelligent and adapt accoridng to the given data type

N1=100
N2=200
NAME="AKSHAY" #this is a string, not a number hence shell will consider it as zero "0"

SUM=$(($N1+$N2+$NAME))
echo "sum of two numbers is: ${SUM}"

#-----------------------------------
#ARRAY - list of string or numbers
LEADERS=("modi", "putin", "trump") # size of array=3, max index=2

echo "ALL Leaders: ${LEADERS[@]}"
echo "ALL Leaders: ${LEADERS[*]}"
echo "first Leader: ${LEADERS[0]}"
echo "second Leader: ${LEADERS[1]}"
echo "second Leader: ${LEADERS[10]}" #it dosen't throw any error in shell,but in other programming language it throws error-index out of range