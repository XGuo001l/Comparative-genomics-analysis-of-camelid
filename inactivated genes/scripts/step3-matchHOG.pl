#!/usr/bin/perl -w 
use warnings; 
$file="/picb/bigdata/project/guoxin/geneloss/newgenelossN0/alpacacorr2.txt";

$file2="n0-1-1genename.txt";
open(FILE,$file) or die "cannot open $file:$!";

while($line=<FILE>){chomp $line;
                    @lin=split("\t",$line);
              
                    $accession=$lin[1];
                    @rnaid=split(' ',$accession);
                    $rna=$rnaid[1];
             
               
                                    open(FILE2,$file2) or die "cannot open $file:$!";
                                    @line2=<FILE2>;
                                    foreach $line2 (@line2){@lin2=split('\t',$line2);
                                            
                                    
                                                   if ($lin2[1] =~ $rna) {
                                                                            print $line,"\t",$lin2[0],"\n";
                                                                            }
                                                                          }
                 
                                    
                    
                    } 
                                        
       

                                        
                    
close(FILE);
exit;

                    
