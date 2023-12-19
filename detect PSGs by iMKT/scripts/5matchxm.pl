#!/usr/bin/perl -w
use warnings; 
$file=<STDIN>;
#$i=0;
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                                @line=split(' ',$line);
                              #  @pregene=split(':',$line[1]);
                           #     @gene=split('-',$pregene[0]);
               
                    $file2="n0-1-1genename.tsv";
                    open(FILE2,$file2) or die "cannot open $file:$!";
                    @line2=<FILE2>;
                    foreach $line2 (@line2){@lin2=split('\t',$line2);
                                            
                                   
                                             if ($line[9] eq $lin2[0]){
                                                                     print $line,"\t",$lin2[2],"\n"; }#print $j,"\n";}
                                        
       

                                               }
                    }
close(FILE);
exit;


