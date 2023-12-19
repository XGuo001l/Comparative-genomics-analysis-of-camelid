#!/usr/bin/perl -w
use warnings; 
$file="/picb/bigdata/project/guoxin/lossgeneseq/exonalpc22/alpcexon.bed";

open(FILE,$file) or die "cannot open $file:$!";
$aln_dir="/picb/bigdata/project/guoxin/lossgeneseq/exonalpc22/bed";
while($line=<FILE>){chomp $line;
                                @line=split('\t',$line);
                              $id=$line[3];  
                              $rna=$line[4];
                              open(OUTFILE,">>$aln_dir/$id.$rna.bed") or die"cannot open n0indell.csv:$!";
                              print OUTFILE $line,"\n";
                    }