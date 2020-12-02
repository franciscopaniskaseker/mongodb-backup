# mongodb-backup
A very simple script to do mongodb backup with rotation

# requirements
- pigz, tar and git packages

Ubuntu/Debian:
```bash
apt update
apt install pigz tar git
```

CentOS/Redhat:
```bash
yum install pigz tar git
```

# first setup
cd /opt/
git clone https://github.com/franciscopaniskaseker/mongodb-backup.git
sudo /opt/mongodb-backup/mongo_backup.sh 7 2

# script parameters
/opt/mongodb-backup/mongo_backup.sh NumberOfDaysOfRetention NumberOfPigzThreads

Example:
```bash
/opt/mongodb-backup/mongo_backup.sh 7 2
```

# to customize the crontab file
Edit the file /etc/cron.d/mongodb-backup

# backup file name explained
mongodb.dump.LINUXTIMESTAMP.tar.gz
Example:
```bash
mongodb.dump.1606878175.tar.gz
```
To convert Linux timestamp to human date:
```bash
date -d @1606878175
Wed Dec  2 03:02:55 UTC 2020
```

# TO-DO
- [x] MongoDB dump
- [x] Dump archive (tar)
- [x] Dump compression (pigz)
- [ ] Create logs under /var/log/
