#!/bin/bash
start=`date +%s`
rsync -av /Users/rukshanp/Projects/ballerina-lang /Users/rukshanp/Projects/backups/ballerina-lang-daily
end=`date +%s`

runtime=$((end-start))

if [[ $buildStatus -ne 0 ]]; then
    osascript -e 'display notification "Backup okay" with title "Daily Backup" subtitle "Backup"'
    osascript -e 'say "Backup daily $runtime"'
    exit 1
fi
sleep 1
