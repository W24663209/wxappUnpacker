#!/usr/bin/env bash
pkg_path=/data/data/com.tencent.mm/MicroMsg/806da40006a9cd2389d8465cfb3121fe/appbrand/pkg/
for file in $(adb shell su -c "ls $pkg_path") ; do
    #复制出来
    adb shell su -c "mv $pkg_path$file /storage/emulated/0/Download/"
    #上传到电脑
    adb pull "/storage/emulated/0/Download/$file" pkg
    #判断长度
    filesize=`ls -l pkg/$file | awk '{ print $5 }'`
    maxsize=$((1024*1024*8))
    if [ $filesize -gt $maxsize ]
    then
        #大于8m删除
        echo $filesize,pkg/$file
        rm -f pkg/$file
    else
        #解包
        ./bingo.sh pkg/$file
    fi

done

#删除
adb shell "rm -f /storage/emulated/0/Download/*.wxapkg"


