#!/usr/bin/perl -w
use warnings; 
$file="alpacaCDS.bed";

open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                    
                    @chr1=split('\t',$line);
                                   $rna=$chr1[4];
                                  
                  
                   
                                   print $rna,"\n"; }
                                    
                                    
       

                                        
                    
close(FILE);
exit; 
