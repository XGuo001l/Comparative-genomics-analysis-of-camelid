#!/usr/bin/perl -w
use warnings; 
$file="/picb/bigdata/project/guoxin/lossgeneseq/targetfasta22/bacdrofergullvial7.txt";

open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                                @line=split('\t',$line);
                                $start=$line[3]-1;
                                @id=split(';',$line[8]);
                                @gene=split('-',$id[0]);
                                print $line[0],"\t",$start,"\t",$line[4],"\t",$gene[1],"\t",$line[5],"\t",$line[6],"\n";
                    }
