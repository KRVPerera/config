#!/bin/bash
roundedMin=$(echo "$(date "+%M") - ($(date +%M)%10)" | bc)
timeN=$(date +%Y-%m_hour_%H)_$roundedMin

echo "Print all"
cat hour_backup_sizes.txt | sort -n
echo ""
echo "Current rounded time $timeN"
echo "Nearest backup"
cat hour_backup_sizes.txt | grep $timeN
