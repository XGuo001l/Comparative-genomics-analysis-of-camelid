#!/usr/bin/perl -w
use strict;
#produce .lnL files which includes lnL values of alt and nul
my $dir="/picb/bigdata/project/guoxin/n0tcspamlbranch1/mlc/batch_9/";
opendir(DIR,$dir)  || die "Error: cannot open directory $dir\n";
my @files=readdir DIR;
foreach my $file (@files){
                           if ($file =~ /^(.+)\.alt_codeml.mlc$/) {my $part="alt";
                          	                                       my $id = $1;
                                                                   open(FILE,"$dir/$file") or die"cannot open $file\n";
                                                                   open(OUTFILE,">>$dir/$id.lnL") or die"cannot open $file.lnL:$!";
                                                                   while(my $line=<FILE>){chomp $line;
                                                                                          if ($line=~ /^lnL/){
                                                                                                           print OUTFILE $line,"\t",$part,"\n";}
                                                                                           elsif($line =~ /\) for branches:/){         
                                                                                                           print OUTFILE $line,"\t",$part,"\n";} 
                                                                                                           }}
                           elsif($file =~ /^(.+)\.nul_codeml.mlc$/) {my $part="nul";
                          	                                         my $id = $1;
                                                                     open(FILE,"$dir/$file") or die"cannot open $file\n";
                                                                     open(OUTFILE,">>$dir/$id.lnL") or die"cannot open $file.lnL:$!";
                                                                     while(my $line=<FILE>){chomp $line;
                                                                                            if ($line=~ /^lnL/){
                                                                                                           print OUTFILE $line,"\t",$part,"\n";}}}
                                }
                                                                                                                                                                                       
