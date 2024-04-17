#!/bin/sh
# just refresh the screen every minute

#say hi
echo "refresh screen partito (logr)"

#log it to a file in a infinite loop
while true; do
#get the hour and minutes
current_hour=$(date "+%H")
current_minute=$(date "+%M")

#force display image
fbink -q --image file=/mnt/onboard/.kobo/screensaver/current.png && echo "display updated" >> /mnt/onboard/.photoframe/logr.txt
echo "$current_hour:$current_minute" >> /mnt/onboard/.photoframe/logr.txt
sleep 60
done