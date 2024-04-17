#!/bin/sh
# download a new picture once a day

#say hi
echo "download_picture partito (logd)"

# load picture url from config file
picture_url=$(cat "config")

if [ $? -ne 0 ]; then
 echo "No picture url specified, failed." >> /mnt/onboard/.photoframe/logd.txt
 exit
fi

# continuesly check if the current hour matches the desired hour
desired_hour="22" # (24-hour format)
desired_minute="30"

while true; do

disp=false
current_hour=$(date "+%H")
current_minute=$(date "+%M")

if [ "$current_hour" -eq "$desired_hour" -a "$current_minute" -eq "$desired_minute" ]; then
   	echo "It's $desired_hour:$desired_minute o'clock!" >> /mnt/onboard/.photoframe/logd.txt
    #check if is disp on libero and download new picture
    wget $picture_url -O /mnt/onboard/.photoframe/downloaded.png && mv /mnt/onboard/.photoframe/downloaded.png /mnt/onboard/.kobo/screensaver/current.png  && echo "pic downloaded and moved" >> /mnt/onboard/.photoframe/logd.txt
fi

echo "$current_hour:$current_minute" >> /mnt/onboard/.photoframe/logd.txt
sleep 60

done
