#!/bin/bash



for file in $(ls /picb/bigdata/project/guoxin/n0tcspaml1/ctl/batch_0/*.ctl);do
/home/guoxin/paml4.8/bin/codeml $file
done