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
echo "Time is up !!"


while IFS= read -r line; do

    echo "processing line is:: $line"

done < "20-script1.sh" #Input to the while loop is coming from the file 20-script1.sh, so we are using the redirection operator "<" to redirect the content of the file to the while loop.
