#!/usr/bin/perl -w
use warnings;
#提取ID相同序列
$file=<STDIN>;
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){
                    @row=split(' ',$line);
                    if ($row[1] eq $row[0]){
                                              print $line;
                                                          }
                    }
close(FILE);
exit;

