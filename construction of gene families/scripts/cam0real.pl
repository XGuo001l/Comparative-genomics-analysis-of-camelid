#!/usr/bin/perl -w
use warnings; 
$file="n3camloss1.txt";
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                    @lin=split(' ',$line);
         
                    $file2="N0.tsv";
                    open(FILE2,$file2) or die "cannot open $file:$!";
                    @line2=<FILE2>;
                    foreach $line2 (@line2){chomp $line2;
                                            @lin2=split('\t',$line2);
                                           @hum=split(',',$lin2[9]);
                                            @mou=split(',',$lin2[11]);
                                          $human=scalar @hum;
                                           $mouse=scalar @mou;
                                     
                                            if ($lin2[3] =~ $lin[1] && $human ne 0) {
                                                                                       print $lin[0],"\t",$lin[1],"\t",$hum[0],"\t","h","\n"; }
                                            elsif ($lin2[3] =~ $lin[1] && $mouse ne 0){
                                                                                       print $lin[0],"\t",$lin[1],"\t",$mou[0],"\t","m","\n"; }
                                            
                                        
       
                                        
       

                                            }
                     }
close(FILE);
exit;
