#!/usr/bin/perl -w
use warnings; 
$file="lgvic.fa";

 $file2="bacdrofergullvial6.bed"; #fasta file and corresponding annotation bed file
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                    if($line=~/>/){
                     @chr1=split(':',$line);
                  
                     @start1=split('-',$chr1[1]);
                     $start=$start1[0];       
                     $end=$start1[1];
                    open(FILE2,$file2) or die "cannot open $file:$!";
                    @line2=<FILE2>;
                    foreach $line2 (@line2){@lin2=split('\t',$line2);
                                           if($start == $lin2[1] && $end =~ $lin2[2]){
                                                                                       print $line,"\t",$lin2[3],"\n"; }} # use loci to match gene
                                    }
                   else{print $line,"\n";}
                    } 
                                        
       

                                        
                    
close(FILE);
exit;