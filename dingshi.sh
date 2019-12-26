#!/bin/bash
myscript=resume_backup.sh
filePath=$(cd "$(dirname "$0")";pwd)
echo $filePath
crontab -l > cron
number=`grep -n "$myscript" cron | cut -d ":" -f 1`
aa=$number
echo $aa
if [ -z $aa ];
then
echo "该任务不存在，将添加"
echo '30 1 * * * docker restart $(docker ps -a | awk '{ print $1}' | tail -n +2)' >> cron
crontab cron
rm -f cron
else
echo "该任务已经存在，将会先删除再添加"
sed -i '/'$myscript'/d' cron
echo '1 12 * * * root $myscript' >> cron
crontab cron
rm -f cron
fi
