#!/usr/bin/perl -w
use warnings;
$file = "camfercorr5.txt"; 
 open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                           
                  while($lin=<FILE>){chomp $lin;
                                     @row=split(' ',$lin);
                                     
                                     $hog=$row[1];
                                     
                                    
                                                                  
                                                                                                   
                              print $hog,"\n";  }                                  
                                     
