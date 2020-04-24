#!/usr/bin/env bash
filename=pkg/_1123949441_404.wxapkg
filesize=`ls -l $filename | awk '{ print $5 }'`
maxsize=$((1024*10))
if [ $filesize -gt $maxsize ]
then
    echo "$filesize > $maxsize"
else
    echo "$filesize < $maxsize"
fi