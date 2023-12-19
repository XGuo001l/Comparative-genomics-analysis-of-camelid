#!/bin/bash
#$ -cwd
#$ -S /bin/bash
#$ -q bigdata.q


for file in $(ls /picb/bigdata/project/guoxin/lossgeneseq/exonalpc22/bed/*.bed);do
/home/guoxin/bedtools2-2.25.0/bin/bedtools getfasta -fi Yangtuo_alpaca_genomic.fna -bed $file -s -fo $file.fa
done

