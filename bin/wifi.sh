#!/bin/bash
name=`iwconfig wlan0 | grep ESSID | awk '{print $4}' | tr -d 'ESID:"'`
if [ $name == "off/any" ]
then
		echo "OFF"
else
		echo $name
fi
