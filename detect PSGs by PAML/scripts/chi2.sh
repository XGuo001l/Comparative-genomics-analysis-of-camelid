#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#$ -q bigdata.q


for file in $(ls /home/guoxin/n5phytest/mlc/batch_0/*.out); do
	var=$(cat $file)

kk=1
/home/guoxin/paml4.8/bin/chi2 $kk $var  >> $file
done
