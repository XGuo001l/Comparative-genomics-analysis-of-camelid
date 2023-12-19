#!/usr/bin/perl -w
use warnings;
$file = "cambac.exonic_variant_function
";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split('\t',$lin);
                      
                      if($col[1] =~ /synonymous/){
                                         
                                               print $lin,"\n";
                                                                      }   
                            }
                                         
