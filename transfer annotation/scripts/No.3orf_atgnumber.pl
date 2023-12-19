#!/usr/bin/perl -w
use warnings;
$file=<STDIN>;$i=0;$j=0;
open (FILE,$file) or die"cannot open $file:$!";
while($line=<FILE>){$j++;
                    if ($line =~ /ATG/ || $line =~ /atg/){#chomp $line;
                                                          $i++;
                                   #   @row=split('',$line);
                                    #  $start1=shift @row;
                                     # @start=$start1;
                                     # $start2=shift @row;
                                      #$start3=shift @row;
                                     # $start=$start1.$start2.$start3;
                                    #  $end3=pop @row;
                                    #  $end2=pop @row;
                                   #   $end1=pop @row;
                                   #   $end=$end1.$end2.$end3;print $end,"\n";
                                    #  if ($start eq 'ATG'){$i++;}
                                   #   elsif ($start eq 'ATG' && $end eq 'TGA'){$i++;}
                                   #   elsif ($start eq 'ATG' && $end eq 'TAG'){$i++;}
                                     }}
print $i,"\t",$j,"\t",$i/$j;
close(FILE);
exit;      
#calculate atg number  original 21.02.27