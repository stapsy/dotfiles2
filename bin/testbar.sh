#!/bin/bash
alert='#FFFE8019'

workspace=(I I II III IV V VI)

clock() {
	echo "| $(date +'%A, %b %-d %-I:%M %p') | "
}

#volume() {
#	if [[ "$(amixer get Master)" == *"[on]"* ]]; then
#		vol=`pactl list sinks | grep "Volume: front-left"| awk 'FNR == 2 {print $5}'`
#	else
		#vol="muted"
#	fi
#	echo "| Volume: $vol "
#}

#for alsamixer
#volume() {
#	if [[ "$(amixer get Master)" == *"[on]"* ]]; then
#		vol=`amixer get Master | awk '/%/{gsub(/[\[\]]/, "", $5); print $5}'`
#	else
#		vol="muted"
#	fi
#	echo "| Volume: $vol "
#}

workspace() {
	cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3+1}'`
	tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`
	line=" "
	for i in `seq 1 $tot`; do
		if [[ $i -eq $cur ]]; then
			line="$line|%{F$alert} ${workspace[$i]}%{F-} "
		else
			line="$line| ${workspace[$i]} "
		fi
			
	done
	line="$line|"
	echo $line
}

while :; do
	out=""
	out="${out}$(workspace)"
	out="${out}%{r}$(clock)"
	#out="${out}$(clock)"

	echo $out
	sleep 0.5
done
