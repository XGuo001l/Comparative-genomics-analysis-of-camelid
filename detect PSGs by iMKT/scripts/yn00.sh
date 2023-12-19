#!/bin/bash



for file in $(ls /picb/bigdata/project/guoxin/n0yn00/ctl/batch_0/*.ctl);do
/home/guoxin/paml4.8/bin/yn00 $file
done