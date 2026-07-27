#!/bin/bash

count=5

echo "starting the countdown from $count"

while [ $count -gt 0 ]
do
    echo "time left: $count"
    sleep 1
    count=$((count-1))
done

echo "countdown completed"
echo "time completed"
