#!/bin/sh

#robbie trying to get some group info

#cur=`xprop -root _NET_CURRENT_DESKTOP`

#tot=`xprop -root _NET_NUMBER_OF_DESKTOPS`

#nam=`xprop -root _NET_DESKTOP_NAMES`

#cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
#tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

#cur=$((cur+1))
#echo $((cur+1))/$tot
#for w in `seq 0 $((cur - 1 ))`; do line="${line}"; done
#line="${line}|"
#for w in `seq $((cur + 2)) $tot`; do line="${line}"; done
#echo $line  

panel_workspaces() {
	ws=""
	IFS=':' read -a array <<< $(bspc control --get-status)
	for item in "${array[@]}"
	do
		name=${item#?}
		case $item in
			O*) # focused occupied
				ws="${ws}%{B#cc000000}%{F#ffc3c3c3} ${name} %{F-}%{B-}"
			;;
			F*) # focused free
				ws="${ws}%{B#cc000000}%{F#ffc3c3c3} ${name} %{F-}%{B-}"
			;;
			U*) # focused urgent
				ws="${ws}%{B#cc000000}%{F#ffff4500} ${name} %{F-}%{B-}"
			;;
			o*) # occupied
				ws="${ws}%{B#cc222222}%{F#ffc3c3c3} ${name} %{F-}%{B-}"
			;;
			f*) # free
				ws="${ws}%{F#ffc3c3c3} ${name} %{F-}"
			;;
			u*) # urgent
				ws="${ws}%{F#ffff4500} ${name} %{F-}"
			;;
		esac
		shift
	done
	echo "${ws}"
}

while :; do
	echo $(panel_workspaces)
	sleep 0.1s
done
