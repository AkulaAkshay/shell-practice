#!/bin/bash

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

TOTAL_TIME_DURATION=$(($END_TIME-$START_TIME))

echo "The script executed in: $TOTAL_TIME_DURATION seconds"