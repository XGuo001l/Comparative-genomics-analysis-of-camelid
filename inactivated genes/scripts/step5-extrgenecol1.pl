#!/usr/bin/perl -w
use warnings;
$file = "alpacacorr4.txt"; 
 open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                           
                  while($lin=<FILE>){chomp $lin;
                                     @row=split('\t',$lin);
                                     
                                     $gene=$row[0];
                                     
                                    
                                                                  
                                                                                                   
                              print $gene,"\t",$row[4],"\n";  }                                  
                       
                                     
                                      
