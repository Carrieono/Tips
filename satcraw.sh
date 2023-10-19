#!/bin/sh
while true
do
STIME=$(date +%F"@"%H%M%S)     #抓取抓包时间
DATE_DIR=$(date +%F)           #抓取抓包文件夹日期
if [ ! -d ./data/"$DATE_DIR" ];then
mkdir -p ./data/"$DATE_DIR"      #check for dest-dir 判断目标文件夹下是否有该日期的目录,有则忽略,无则创建
fi

gtimeout 10 tcpdump -i any -G 10 -s 0 -Z root -w ./data/"$DATE_DIR"/"$STIME".pcap

sleep 10m  # capture every 10 minutes
done
