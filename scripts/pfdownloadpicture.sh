#!/bin/sh
# download a new picture once a day (when kobo automatically exit from sleepmode, if not done already)

#say hi
echo "download_picture partito (logd)"

# load picture url from config file
picture_url=$(cat "config")

if [ $? -ne 0 ]; then
 echo "No picture url specified, failed." >> /mnt/onboard/.photoframe/logd.txt
 exit
fi

while true; do
current_date=$(date -d "$(date +%Y-%m-%d)" +%s)

# read already present picture date of birth
pic_date=$(date -d "$(stat -c %y /mnt/onboard/.kobo/screensaver/current.png | cut -c 1-10)" +%s)

# if that picture is 1 day old, download the new one
if [ "$pic_date" -ne "$current_date" ]; then 
    wget $picture_url -O /mnt/onboard/.photoframe/downloaded.png && mv /mnt/onboard/.photoframe/downloaded.png /mnt/onboard/.kobo/screensaver/current.png && echo "pic downloaded and moved" >> /mnt/onboard/.photoframe/logd.txt
fi

echo "$current_hour:$current_minute" >> /mnt/onboard/.photoframe/logd.txt
sleep 60

done