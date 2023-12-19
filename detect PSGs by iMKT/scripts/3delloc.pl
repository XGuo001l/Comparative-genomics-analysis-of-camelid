#!/usr/bin/perl -w
use warnings;
$file = "cambcsyn.syn";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split('\t',$lin);
                      
                      if($col[1] !~ /LOC/){
                                         
                                               print $lin,"\n";
                                                                      }   
                            }