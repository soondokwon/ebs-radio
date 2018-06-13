#!/bin/sh

PROGRAM_NAME=$1
RECORD_SECS=$2
DEST_DIR=$3

RADIO_ADDR="rtsp://ebsonairandaod.ebs.co.kr:554/fmradiobandiaod/bandiappaac"
#CHROOTTARGET=/usr/local/debian-chroot/var/chroottarget
CHROOTTARGET=/home/soondo/music
TITLE=$PROGRAM_NAME`date "+ %Y.%_m.%_d."`
TEMP_AAC=/home/soondo/music/tmp/`date +%H%M%S%N`.m4a
FINAL_AAC=$PROGRAM_NAME`date +_%y%m%d`.m4a

avconv -rtsp_transport tcp -i $RADIO_ADDR -t $RECORD_SECS -codec:a copy -metadata title="$TITLE" $TEMP_AAC

mkdir -p "$DEST_DIR"
mv $TEMP_AAC "$DEST_DIR/$FINAL_AAC"
/home/soondo/music/tomp3.sh "$DEST_DIR/$FINAL_AAC"
rm "$DEST_DIR/$FINAL_AAC"
chown -R soondo:soondo /home/soondo/music
