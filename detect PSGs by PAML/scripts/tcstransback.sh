#!/bin/bash




for file1 in $(ls /picb/bigdata/project/guoxin/testTCS0301/*.fa.fas);do              #pgtcsN0/*.fa.aln);do
   hog1=${file1%.*}

  for file2 in $(ls /picb/bigdata/project/guoxin/testTCS0301/*.fa.score_ascii);do
    hog2=${file2%.*}
 
     for file3 in $(ls /picb/bigdata/project/guoxin/testTCS0301/*.fa.dna);do
      hog3=${file3%.*}

     if  [ $hog1 = $hog2 ]   
      then 
       if [ $hog2 = $hog3 ]
        then
          base=`basename $hog1`
          /home/guoxin/T-COFFEE/bin/t_coffee -other_pg seq_reformat -in $file1 -in2 $file3 -struc_in $file2 -struc_in_f number_aln -output tcs_column_filter5 -out $base.codonfilter
       fi
      fi
       done
  done
done
