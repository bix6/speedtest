#!/bin/bash

# To view the CSV output with bash
# Using sed to account for the comma in Server Name
# and the blank Share result
# Speeds are recorded in bit/s
# Divide by 1,000,000 to get megabits/s (mbps)
# sed 's/, CA/ CA/; s/,,/, ,/' speedtest.csv | column -s, -t

# Setup Vars
outfile="speedtest.csv"
# 600s=10m
sleepTime=600

# Reset File
# speedtest-cli --csv-header > $outfile

#86400 seconds in a day / sleepTime = loop for a day
maxLoops=$((86400/$sleepTime))

i=0

while [ $i -le $maxLoops ]
do
        speedtest-cli --secure --csv >> $outfile

        i=$(( i+1 ))
        sleep $sleepTime
done

