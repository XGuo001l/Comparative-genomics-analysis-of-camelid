#!/usr/bin/perl -w
use strict;
#extract pvalue which not exceeds 0.05 
my $dir="/picb/bigdata/project/guoxin/n0tcspamlbranch1/mlc/out/";
opendir(DIR,$dir)  || die "Error: cannot open directory $dir\n";
my @files=readdir DIR;
foreach my $file (@files){
                           if ($file =~ /^(.+)\.out$/) {
                          	                                       my $id = $1;
                                                                   open(FILE,"$dir/$file") or die"cannot open $file\n";
                                                                   
                                                                   while(my $line=<FILE>){if ($line=~ /prob/){my @row=split('=',$line);
                                                                                                              if ($row[2] < 0.05){open(OUTFILE,">$dir/$id.pval") or die"cannot open $file.lnL:$!";
                                                                                                           print OUTFILE $line,"\n";}}}
                                                        }
                                }
