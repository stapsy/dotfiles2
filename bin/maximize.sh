#!/bin/sh

usage() {
        echo "usage: $(basename $0) [-hv] wid" >&2
        exit 1
}

while getopts hv OPT; do
    case $OPT in
        h) MAX=horz ;;
        v) MAX=vert ;;
        *) usage ;;
    esac
done
shift $((OPTIND -1))

test -n "$1" && WID=$1 || usage

MAX=${MAX:-full}
EXPANDIR=/tmp/.expan.d
BW=$(wattr b $WID)
SW=$(( $(wattr w `lsw -r`) - 2*$BW))
SH=$(( $(wattr h `lsw -r`) - 2*$BW))

test -d $EXPANDIR || mkdir -p $EXPANDIR

is_maxed() {
    case $MAX in
        vert) test $(wattr h $WID) -eq $SH && return 0 ;;
        horz) test $(wattr w $WID) -eq $SW && return 0 ;;
        full) test "$(wattr wh $WID)" = "$SW $SH" && return 0 ;;
    esac

    return 1
}

expand_win() {
    wattr xywhi $WID > $EXPANDIR/$WID
    case $MAX in
        vert) GEOMETRY=$(printf '%d 0 %d %d' $(wattr xw $WID) "$SH") ;;
        horz) GEOMETRY=$(printf '0 %d %d %d' $(wattr y $WID) "$SW" $(wattr h $WID)) ;;
        full) GEOMETRY=$(printf '0 0 %d %d' "$SW" "$SH") ;;
    esac
    wtp ${GEOMETRY} ${WID}
}

collapse_win() {
    test -f $EXPANDIR/$WID || return
    wtp $(grep $WID $EXPANDIR/$WID)
    rm $EXPANDIR/$WID
}

is_maxed && collapse_win || expand_win ;

