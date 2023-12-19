#!/usr/bin/perl -w
use warnings; 
$file="Yangtuo_alpacaANNgenomic.gff";#alpaca annotation file

open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                                @line=split('\t',$line);
                
                    $file2="cam-alpc-catle.txt";#gene file
                    open(FILE2,$file2) or die "cannot open $file:$!";
                    @line2=<FILE2>;
                    foreach $line2 (@line2){@lin2=split(' ',$line2);
                                            
                                     
                                            if ($line[2] eq "CDS" ) {@id=split(';',$line[8]);
                                                                     @gene=split('=',$id[5]);
                                                                     @rna=split('=',$id[1]);
                                                                     $rnaid=$rna[1];
                                                                     $start=$line[3]-1;
                                                                     if($gene[1] eq $lin2[0]){
                                                                                            print $line[0],"\t",$start,"\t",$line[4],"\t",$gene[1],"\t",$rnaid,"\t","CDS","\t",$line[6],"\n"; }
                                                                          } 
                                        
       
                                        
       

                                            }
                     }
close(FILE);
exit;
