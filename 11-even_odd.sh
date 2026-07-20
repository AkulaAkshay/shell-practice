#!/bin/bash

echo "please provide the number :"
read NUMBER

if [$(($NUMBER % 2)) -eq 0 ]; then
    echo "The Number "${NUMBER}" is an even number"
else
    echo "The Number "${NUMBER}" is an odd number"
fi