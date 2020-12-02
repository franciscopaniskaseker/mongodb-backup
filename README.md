# mongodb-backup
A very very simple script to do mongodb backup with rotation

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
```bash
cd /opt/
git clone https://github.com/franciscopaniskaseker/mongodb-backup.git
sudo /opt/mongodb-backup/mongo_backup.sh 7 2
```

# script parameters
/opt/mongodb-backup/mongo_backup.sh NumberOfDaysOfRetention NumberOfPigzThreads

Example:
```bash
/opt/mongodb-backup/mongo_backup.sh 7 2
```

# to customize the crontab file
Edit the file /etc/cron.d/mongodb-backup

# to customize the backup directory
Edit the mongo_backup.sh script or create a symbolic link pointing /backup to anywhere.

# to update this script
Just do git pull under /opt/mongodb-backup

Important:
- If you customized the backup directory, make sure that will continue working with git pull

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
- [ ] Create a SFTP solution
- [ ] Create a S3 object capable solution
