#!/usr/bin/perl -w
use warnings;
$file=<STDIN>;$i=0;$j=0;
open (FILE,$file) or die"cannot open $file:$!";
while($line=<FILE>){$j++;
                    if ($line =~ /ATG/ || $line =~ /atg/){#chomp $line;
                                                          $i++;
           
                                     }}
print $i,"\t",$j,"\t",$i/$j;
close(FILE);
exit;      
#calculate atg number  original 21.02.27
