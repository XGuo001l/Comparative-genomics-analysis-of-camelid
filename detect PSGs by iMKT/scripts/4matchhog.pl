#!/usr/bin/perl -w
use warnings; 
$file=<STDIN>;
#$i=0;
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                                @line=split('\t',$line);
                                @pregene=split(':',$line[1]);
                                @gene=split('-',$pregene[0]);
           
                    $file2="n0humangenename.csv";
                    open(FILE2,$file2) or die "cannot open $file:$!";
                    @line2=<FILE2>;
                    foreach $line2 (@line2){@lin2=split(',',$line2);
                                            
                                   
                                             if ($gene[1] eq $lin2[3]){
                                                                     print $line,"\t",$lin2[1],"\n"; }#print $j,"\n";}
                                        
       

                                               }
                    }
close(FILE);
exit;

