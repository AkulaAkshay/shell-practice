#!/bin/bash

NUMBER=$1

# lt-less than; gt-grater than; eq-equal to; ne-not equal  to;

if [ $NUMBER -lt 10 ]; then
    echo "GIVEN Number "${NUMBER}" is less than 10"
else
    echo "GIVEN Number "${NUMBER}" is grater than or equal to 10"
fi