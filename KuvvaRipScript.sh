#!/bin/bash

# HOW TO:
# can turn on and off the script by going into /Library/LaunchAgents/
# and load by invoking launchdctl load KuvvaRipScript.plist
# or unload by invoking launchdctl unload KuvvaRipScript.plist

# compares two files (in my case images)
# if files are the same then we do not add to the folder
# if files are different then we will add to the folder

saveDir=~/Desktop/backgrounds/*
kuvvaDir=~/Library/Containers/com.kuvva.Kuvva-Wallpapers/Data/Library/Application\ Support/Kuvva/*

IFS="" # don't split on any white space

kuvvaFilePath=""
for k in $kuvvaDir
do
kuvvaFilePath=$k
	for f in $saveDir
	do
		if cmp -s $k $f
		then
			echo "Files are the same, will NOT save to directory"
			exit
		fi
	done
done

#will only save if program does not terminate
echo "Files are different, will save to directory"
# echo $kuvvaFilePath
fileNewName=~/Desktop/backgrounds/$(basename $kuvvaFilePath)'.png'
# echo $fileNewName
cp $kuvvaFilePath $fileNewName
