#!/usr/bin/perl -w
use warnings;
$file = "/picb/bigdata/project/guoxin/geneloss/newgeneloss/alpacacorr.txt"; #if corrected information contains frameshift and/or stop codon, pick them out.
 open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                           
                  while($lin=<FILE>){chomp $lin;
                                     
                                     if($lin =~ /frameshifts/ || $lin =~ /stop codon/ ){
                                                                  
                                                                                                   
                                                                  print $lin,"\n";  }  #outfile xxcor2.txt                                
                                     }
                                                 