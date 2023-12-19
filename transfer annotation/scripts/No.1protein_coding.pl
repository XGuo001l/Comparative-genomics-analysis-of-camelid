#!/usr/bin/perl -w
use warnings;
#extract protein_coding gene.
$file=<STDIN>;
open(FILE,$file) or die "cannot open the file $file:$!";
while($feature=<FILE>){
                       @factor=split('\t',$feature);
                       if (scalar @factor >= 9){
                       if ($factor[8] =~ /protein_/){
                           
                                                      print $feature;}
                       elsif ($factor[8] =~ /mRNA/){ 
                                                      print $feature;}
                   
                                                                        }}
close(FILE);
exit;
