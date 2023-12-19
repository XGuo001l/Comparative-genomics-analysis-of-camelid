#!/usr/bin/perl -w
use warnings; 
$file=<STDIN>;
#$i=0;
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                                @line=split('\t',$line);
                  #  $i++;
                    $file2="n3-1-1.txt";
                    open(FILE2,$file2) or die "cannot open $file:$!";
                    @line2=<FILE2>;
                    foreach $line2 (@line2){@lin2=split(' ',$line2);
                                            
                                     #   print $line2;
                                            if ($line[0] eq $lin2[0]){
                                                                     print $line,"\n"; } #print $j,"\n";}
                                        
       

                    }}
close(FILE);
exit;

