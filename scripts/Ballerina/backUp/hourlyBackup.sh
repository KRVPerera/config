#!/bin/bash
start=`date +%s`

roundedMin=$(echo "$(date "+%M") - ($(date +%M)%10)" | bc)

rsync -ah --delete --exclude-from=/Users/rukshanp/Projects/backups/exclude_list.txt --log-file=/Users/rukshanp/Projects/backups/$(date +%Y-%m-%d)_hourly_rsync.log  "/Users/rukshanp/Projects/ballerina-lang" "/Users/rukshanp/Projects/backups/ballerina-lang-hourly/$(date +%Y-%m_hour_%H)_$roundedMin"


end=`date +%s`

cd /Users/rukshanp/Projects/backups/ballerina-lang-hourly
du -h -d 1 . | tee ../hour_backup_sizes.txt


runtime=$((end-start))

if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "Backup failed" with title "Hourly Backup" subtitle "Backup"'
    osascript -e 'say "Backup hourly $runtime"'
    exit 1
fi
sleep 1
