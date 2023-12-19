#!/usr/bin/perl -w
#有用的长度分布算法
use warnings;
$file=<STDIN>;
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){
                    @row=split(' ',$line);
                    $bizhi1=$row[7]/$row[3]-1;
                    $bizhi2=$row[9]/$row[3]-1;
                    print "$row[0]	$row[1]	$bizhi1	$bizhi2","\n";}
close(FILE);
exit;
