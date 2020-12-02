#!/bin/bash

# how to call the script
# /opt/mongodb-backup/mongo_backup.sh NumberOfDaysOfRetention NumberOfPigzThreads

# install cronjob
installCronjob()
{
if [[ ! -f /etc/cron.d/mongodb-backup ]]
then
  cat <<EOF> /etc/cron.d/mongodb-backup
SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
# everyday 4AM
0 4 * * * /opt/mongodb-backup/mongo_backup.sh $NumberOfDaysOfRetention $NumberOfPigzThreads

# everyday two times a day examples:
# 0 */12 * * *
# 0 12,4 * * * 
# read more: https://crontab.guru/
EOF
fi
}

# get timestamp
timestamp()
{
  date +"%s" # current time
}

# global vars
backup_date=$(timestamp)
backup_path=/backup
backup_numberofdays=$1
pigz_threads=$2

# install cronjob
installCronjob

# guarantee that dir exist and enter there
mkdir -p $backup_path
cd $backup_path

# dump and compress
mongodump &> /dev/null
tar --remove-files --use-compress-program="pigz -p${pigz_threads} --rsyncable" -cf mongodb.dump.$backup_date.tar.gz dump

# find and remove backups older than 7 days
find $backup_path -mtime $backup_numberofdays -exec rm -f {} \;
