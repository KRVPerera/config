#!/bin/bash
start=`date +%s`
rsync -av /Users/rukshanp/Projects/ballerina-lang /Users/rukshanp/Projects/backups/ballerina-lang-hourly
end=`date +%s`

runtime=$((end-start))

if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "Backup failed" with title "Hourly Backup" subtitle "Backup"'
    osascript -e 'say "Backup hourly $runtime"'
    exit 1
fi
sleep 1
