#!/bin/bash
start=`date +%s`

roundedMin=$(echo "$(date "+%M") - ($(date +%M)%10)" | bc)
previousMonth=$(date -v -1m +%Y-%m)

cd /Users/rukshanp/Projects/backups/ballerina-lang-hourly
rm -Rf empty_dir
mkdir empty_dir

/usr/local/bin/rsync -ah --delete empty_dir/ $previousMonth &
pid=$!

month=$(date +%Y-%m)
mkdir  "/Users/rukshanp/Projects/backups/ballerina-lang-hourly/"$month""

rsync -ah --delete --delete-excluded --exclude-from=/Users/rukshanp/Projects/backups/exclude_list.txt --log-file=/Users/rukshanp/Projects/backups/$(date +%Y-%m-%d)_hourly_rsync.log  "/Users/rukshanp/Projects/ballerina-lang" "/Users/rukshanp/Projects/backups/ballerina-lang-hourly/"$month"/$(date +hour_%H)_$roundedMin"


end=`date +%s`

#du -h -d 1 . | tee ../hour_backup_sizes.txt

wait $pid
runtime=$((end-start))

if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "Backup failed" with title "Hourly Backup" subtitle "Backup"'
    osascript -e 'say "Backup hourly $runtime"'
    exit 1
fi


sleep 1
