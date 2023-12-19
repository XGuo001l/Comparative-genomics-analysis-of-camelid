#!/usr/bin/perl -w
use warnings;
$file=<STDIN>;
open(FILE,$file) or die"cannot open $file:!";
while($line=<FILE>){
                    @row=split('\t',$line);
                    @rrow=split(';',$row[8]);
                    @rrrow=split('=',$rrow[0]);
                    @rrdow=split('=',$rrow[1]);
                 #  print "$rrrow[1]	$rrdow[1]","\n";}
                   if ($row[2] eq 'gene'){print $line;
                                         # print "$row[0]	$row[1]	$row[2]	$row[3]	$row[4]	$row[5]	$row[6]	$rrrow[1]	$rrdow[1]","\n";
                                          $k=$row[2];}
                   elsif($k eq 'gene')   {print $line;
                                         # print "$row[0]	$row[1]	$row[2]	$row[3]	$row[4]	$row[5]	$row[6]	$rrrow[1]	$rrdow[1]","\n";
                                          $k=$row[2];
                                          $pp=$rrrow[1];}
                   elsif($k ne 'mRNA') {print $line;  
                                        $k=$row[2]; 
                                        $pp=$rrrow[1];}
                   elsif($rrdow[1] eq $pp){print $line;
                                          # print "$row[0]	$row[1]	$row[2]	$row[3]	$row[4]	$row[5]	$row[6]	$rrrow[1]	$rrdow[1]","\n";
                                           }}















close(FILE);
exit;
