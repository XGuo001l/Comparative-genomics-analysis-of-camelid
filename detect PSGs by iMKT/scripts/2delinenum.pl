#!/usr/bin/perl -w
use warnings;
$file = "cambc.syn";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split('\t',$lin);
                       print $col[1],"\t",$col[2],"\t",$col[3],"\t",$col[4],"\t",$col[5],"\t",$col[6],"\t",$col[7],"\t",$col[8],"\n";
                                                                      }   
                            
                                         
