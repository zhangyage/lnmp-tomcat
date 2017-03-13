#!/bin/bash
pidnginx=/usr/local/nginx/logs/nginx.pid
logpath=/usr/local/nginx/logs
#根据实际情况修改目录配置
mkdir $logpath/older-zip $logpath/old-log
newname=`date -d last-day +"%Y%m%d"`
mv $logpath/error.log $logpath/old-log/error.$newname.log
mv $logpath/access.log $logpath/old-log/access.$newname.log && kill -USR1 `cat $pidnginx`
rm -rf `find $logpath/old-log/* -ctime +7|grep error`
xin=`date +%w`
jiu=`find $logpath/old-log/ -ctime +7`
if [ $xin = "1" ]
    then
	zip -j $logpath/older-zip/$newname.zip $jiu
else
    echo "lingbug"
fi
