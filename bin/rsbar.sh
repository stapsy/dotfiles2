#!/bin/bash
alert='#98971a'
alertfg='#141414'
#grey='#505050'
grey='#a89984'
grey2='#282828'

workspace=(I 1 2 3 4 5 6)

clock() {
	echo " $(date +'%H:%M') "
}

clock2() {
	echo " $(date +'%d/%m/%Y')"
}

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
}

groups() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3+1}'`
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`
	line=" "
	for i in `seq 1 $tot`; do
		if [[ $i -eq $cur ]]; then
			line="$line%{B$alert}%{F$alertfg}  ${workspace[$i]} %{F-}%{B-}"
		else
			line="$line%{F$grey} ${workspace[$i]} %{F-}"
		fi

	done
	line="$line"
	echo $line
}


#loopdeloop
while :; do
	buf=""
	buf="${buf} %{l} $(groups) "
	buf="${buf}%{r}%{F$grey2} %{F-} $(clock) %{F$grey2}|"
	buf="${buf}%{F-}$(clock2) %{F$grey2}|"
	buf="${buf}	%{F-}NET $(network) %{F$grey2}|"
	buf="${buf} %{F-}CPU $(cpuload)% %{F$grey2}|"
	buf="${buf} %{F-}RAM $(memused)%  %{F$grey2} "
#	buf="${buf} DATE: $(date) "	
		
	echo $buf
	sleep 0.5 
done

	
