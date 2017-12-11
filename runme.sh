## JustaDebianDistros's simple ffmpeg metadata format script 

#!/bin/bash
    
    	dialog --no-cancel --inputbox "what is the Artist name?" 10 60 2> /tmp/.name
	NAME=$(cat /tmp/.name)
	
	dialog --no-cancel --inputbox "what is the file name?" 10 60 2> /tmp/.filename
	FNAME=$(cat /tmp/.filename)
	
dialog --no-cancel --inputbox "what is the New file name?" 10 60 2> /tmp/.newfilename
        NFNAME=$(cat /tmp/.newfilename)      

	dialog --no-cancel --inputbox "what is the song name?" 10 60 2> /tmp/.songname
	SNAME=$(cat /tmp/.songname)

	dialog --no-cancel --inputbox "what is the album name?" 10 60 2> /tmp/.albumname
	ANAME=$(cat /tmp/.albumname)

dialog --no-cancel --inputbox "what is the song track number?" 10 60 2> /tmp/.tracknum
	TN=$(cat /tmp/.tracknum)

dialog --no-cancel --inputbox "what year is the song from?" 10 60 2> /tmp/.trackyear
	YEAR=$(cat /tmp/.trackyear)

	dialog --no-cancel --inputbox "what is the songs genre?" 10 60 2> /tmp/.genre
	GENRE=$(cat /tmp/.genre)
	
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

	rm -rf /tmp/.name
	rm -rf /tmp/.filename
	rm -rf /tmp/.newfilename
	rm -rf /tmp/.songname
	rm -rf /tmp/.tracknum
	rm -rf /tmp/.trackyear
	rm -rf /tmp/.albumname
	rm -rf /tmp/.genre
clear
