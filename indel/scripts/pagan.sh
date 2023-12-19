#!/bin/bash



for file in $(ls /picb/bigdata/project/guoxin/N0/N0.HOG*);do
/home/guoxin/pagan/bin/pagan -s $file -t allspeciestree.nwk -o  $file --translate --events
done
