#!/bin/bash

### List all directories in current path and throw away the ouput
ls -dS */ >& /dev/null

### Check if current path has directory(s), last status code would be 0(zero)
if [ "$?" -eq "0" ];
then
    ### List all directories followed by selecting name and its size, followed by output formatting
    ls -dS */ | xargs du -hs | awk 'OFS="\t" { gsub("/","",$2); print $2,$1 }'
fi