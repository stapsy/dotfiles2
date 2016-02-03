#!/bin/bash

clock() {
	date '+%I:%M %p |  %d/%m/%Y '
}

#date() {
#	date '+%d/%m/%Y'
#}

cpuload() {
	t=`ps -eo pcpu | awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}'`
echo $t
}

memused() {
	read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
	bc <<< "scale=2; 100 - $f /$t * 100" | cut -d. -f1
}

network() {
name=`iwconfig wlan0 | grep ESSID | awk '{print $4}' | tr -d "ESID:"`
if `[ $name == "off/any"]`
then
	echo "OFF"
else
	echo $name
fi

#	ping -c 1 8.8.8.8 >/dev/null 2>&1 &&
#		echo "$int connected" || echo "$int disconnected"
}

groups() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

#	for w in 'seq 0 $((cur - 1))'; do line="${line}="; done
#	line="${line}|"
#	for w in 'seq $((cur + 2)) $tot'; do line="${line}="; done
	echo $((cur+1))/$tot
#	echo $line
}


#loopdeloop
while :; do
	buf=""
	buf="${buf} %{l} $(groups) "
	buf="${buf} %{r}  $(clock) |"
	buf="${buf}	NET $(network) |"
	buf="${buf} CPU $(cpuload)% |"
	buf="${buf} RAM $(memused)% "
#	buf="${buf} DATE: $(date) "	
		
	echo $buf
	sleep 1
done

	
