#!/usr/bin/perl -w
use warnings; #extract gene and daf etal as useful information
$file = "cambcal5new.syn";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split('\t',$lin);
                      @gen1=split(':',$col[1]);
                      @gen=split('-',$gen1[0]);
                      $gene=$gen[1];
                      
                         print $gene,"\t",$col[13],"\t",$col[0],"\n";
                                                                        
                            }
                                         
