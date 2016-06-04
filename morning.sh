#!/bin/bash

IFS=$(echo -en "\n\b")
DIR="$HOME"
WD=$(date -R)
WD=${WD:0:3}

case $WD in
    "Mon")
        WD_DIR="1-Mon"
        ;;
    "Tue")
        WD_DIR="2-Tue"
        ;;
    "Wed")
        WD_DIR="3-Wed"
        ;;
    "Thu")
        WD_DIR="4-Thu"
        ;;
    "Fri")
        WD_DIR="5-Fri"
        ;;
esac

WD_DIR=$DIR"/"$WD_DIR

PROGRAM=$(date +%F)".mp3"

cd $DIR;

if [ -e $PROGRAM ]
	then mplayer -volume 95 $PROGRAM
    exit 0
fi

cd $WD_DIR

if [ -e "pl" ]
    then
        rm "pl"
fi

for songs in $(ls .)
do
    echo $songs>>pl
done
mplayer -volume 95 -playlist pl

exit 0
