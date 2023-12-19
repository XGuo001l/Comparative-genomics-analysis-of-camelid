#!/usr/bin/perl -w
use warnings;
$file = "alpacacorr3.txt"; 
 open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                           
                  while($lin=<FILE>){chomp $lin;
                                     @row=split('\(',$lin);
                                     $num=scalar @row;
                                     @gene1=split('\)',$row[$num-1]);
                                     $gene=$gene1[0]; #extract gene symbol
                                     
                                    
                                                                  
                                                                                                   
                              print $gene,"\t",$gene1[1],"\n";  }          #output symbol and other information                    
                                     
                                      
