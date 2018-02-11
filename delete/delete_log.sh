#!/bin/bash
wwwroot="/home/wwwsy"
dir[0]=${wwwroot}"/sy.center.yocent.cn/runtime/log"
dir[1]="/home/wwwsy/sy.dydl.yocent.cn/Runtime/Logs"
dir[2]="/home/wwwsy/sy.file.yocent.cn/runtime/log"
dir[3]="/home/wwwsy/sy.im.yocent.cn/runtime/log"
dir[4]="/home/wwwsy/sy.log.yocent.cn/runtime/log"
dir[5]="/home/wwwsy/sy.notice.yocent.cn/runtime/log"
dir[6]="/home/wwwsy/sy.qr.yocent.cn/runtime/log"
dir[7]="/home/wwwsy/sy.queue.yocent.cn/runtime/log"
dir[8]="/home/wwwsy/sy.sms.yocent.cn/runtime/log"
dir[9]="/home/wwwsy/tuanjie.tripbe-gmp.com/runtime/log"
dir[10]="/home/wwwsy/sy.log.yocent.cn/runtime/log"

for var in ${dir[@]};  
do
	find $var -name "*.log" -type f -mtime +7 -delete
done
