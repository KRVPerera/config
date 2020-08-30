#!/bin/bash
start=`date +%s`
rsync -a --delete --exclude-from=/Users/rukshanp/Projects/backups/exclude_list.txt --log-file=/Users/rukshanp/Projects/backups/$(date +%Y%m%d)_daily_rsync.log /Users/rukshanp/Projects/ballerina-lang /Users/rukshanp/Projects/backups/ballerina-lang-daily/$(date +%Y-%m-%d_%H-%M)
end=`date +%s`

runtime=$((end-start))

if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "Backup okay" with title "Daily Backup" subtitle "Backup"'
    osascript -e 'say "Backup daily $runtime"'
    exit 1
fi
sleep 1
