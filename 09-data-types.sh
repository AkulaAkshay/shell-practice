#!/bin/bash

#There are no explcit dta types in shell, usually shell will consider every thing as string initially, but when we are using that data type 
# shell behaves intelligent and adapt accoridng to the given data type

N1=100
N2=200
NAME="AKSHAY"

SUM=$(($N1+$N2+$NAME))
echo "sum of two numbers is: ${SUM}"
