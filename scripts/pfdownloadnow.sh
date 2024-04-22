#!/bin/sh
# download a new picture on demand

#say hi
echo "download_picture partito (logd)"

# load picture url from config file
picture_url=$(cat "config")

if [ $? -ne 0 ]; then
 echo "No picture url specified, failed." >> /mnt/onboard/.photoframe/logd.txt
 exit
fi

#check if is disp on libero and download new picture
wget $picture_url -O /mnt/onboard/.photoframe/downloaded.png && mv /mnt/onboard/.photoframe/downloaded.png /mnt/onboard/.kobo/screensaver/current.png  && echo "pic downloaded and moved" >> /mnt/onboard/.photoframe/logd.txt

echo "$current_hour:$current_minute" >> /mnt/onboard/.photoframe/logd.txt
echo "manual download" >> /mnt/onboard/.photoframe/logd.txt
sleep 60

