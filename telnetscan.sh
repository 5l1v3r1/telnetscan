#!/bin/bash

cat log.txt | while read IP
do

nc -z -v $IP 23; 
if [[ $? == 0 ]]; then
USER='admin'
PASS='admin'
#CMD=''

check=$((echo open "$IP"
sleep 4
echo "$USER"
sleep 4
echo "$PASS"
sleep 4
echo "exit"
) | telnet | grep -o "incorrect")
if [[ $check != "incorrect" ]]; then
echo "found": $IP; echo "$IP" >> foundip.txt
continue
fi
else
continue
fi
done
echo "found:"
cat foundip.txt
