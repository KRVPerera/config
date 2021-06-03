#!/bin/bash

shopt -s expand_aliases
source /Users/rukshanp/bash_aliases.sh
start=`date +%s`
cd /Users/rukshanp/Movies/TV/Hunters
downWith5Cns "https://www.seedr.cc/zip_premium/120469999?st=f92292ed7208ab5b5635d0388d1cb488bd5faec3f7f3f79570e4c3eec6e039bb&e=1621625597"
end=`date +%s`

runtime=$((end-start))
sleep 1
