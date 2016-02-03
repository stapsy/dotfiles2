#Script to read your name from key-board
#echo "Your first name please:"
#read fname
#echo "Hello $fname, lets be friends!"

CUR=$(pfw)

lsw | xargs wattr yxi | sort -nr | sed "0,/$CUR/d"
# | sed "1s/^[0-9]* //p;d"


