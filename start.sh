#!/usr/bin/env bash
pkg_path=/data/data/com.tencent.mm/MicroMsg/95b7572f28f381bf675af45407f560b2/appbrand/pkg

#全部复制出来
adb pull $pkg_path .

#全部删除(虚拟机)
adb shell "rm -f $pkg_path/*"

#全部删除(手机)
#adb shell su -c "rm -f $pkg_path/*"


for file in $(ls pkg) ; do
    echo $file
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


