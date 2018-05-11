## JustaDebianDistros's simple ffmpeg metadata format script

#!/bin/bash

### FOLDER CREATION ###
temp_dir=$(mktemp -d -t mdfolder.XXXXXX) || exit 1
echo "tmpdir = ${temp_dir}"

### Input ###
dialog  --inputbox "What is the file's name?" 10 60 2> ${temp_dir}/filename
	FNAME=$(cat ${temp_dir}/filename)

dialog  --inputbox "what is the NEW file name?" 10 60 2> ${temp_dir}/newfilename
        NFNAME=$(cat ${temp_dir}/newfilename)

dialog --inputbox "What is the artist's name?" 10 60 2> ${temp_dir}/name
	NAME=$(cat ${temp_dir}/name)

dialog  --inputbox "what is the song name?" 10 60 2> ${temp_dir}/songname
	SNAME=$(cat ${temp_dir}/songname)

dialog  --inputbox "what is the album name?" 10 60 2> ${temp_dir}/albumname
	ANAME=$(cat ${temp_dir}/albumname)

dialog  --inputbox "what is the song track number?" 10 60 2> ${temp_dir}/tracknum
	TN=$(cat ${temp_dir}/tracknum)

dialog  --inputbox "what year is the song from?" 10 60 2> ${temp_dir}/trackyear
	YEAR=$(cat ${temp_dir}/trackyear)

dialog  --inputbox "what is the songs genre?" 10 60 2> ${temp_dir}/genre
	GENRE=$(cat ${temp_dir}/genre)

### ffmpeg  ###
ffmpeg -i ~/Music/$FNAME \
    -metadata title="$SNAME" \
    -metadata artist="$NAME" \
    -metadata composer="$NAME" \
    -metadata album="$ANAME" \
    -metadata album_artist=$NAME \
    -metadata year="$YEAR" \
    -metadata track="$TN" \
    -metadata comment="None" \
    -metadata genre="$GENRE" \
    -metadata copyright="None" \
    -metadata description="None" \
    -vcodec copy \
    -acodec copy \
    -y ~/Music/$NFNAME && rm -rf $FNAME

### Clean up option  ###
dialog --no-cancel --yesno "Delete Folder and log files?" 10 60 && rm -R ${temp_dir} && clear || echo "tempdir is here ${temp_dir}" && exit 1

