#!/usr/bin/perl -w
use warnings;
$aln_dir="/picb/bigdata/project/guoxin/lossgeneseq/targetfasta22/fasta/";
opendir(DIR,$aln_dir) || die "cannot open $aln_dir\n";

@files = readdir DIR;
foreach $file (@files) {
                        if ($file =~ /^(.+)\.fasta$/) {$id =$1;
  
                                                      open(OUTFILE,">>$aln_dir/$id.fass") or die"cannot open $id.fass:$!";
                                                      open(FILE,$file) || die "cannot open $file";


                                                                         while($line=<FILE>){chomp $line;
                                                                                             if ($line =~ />/){print OUTFILE $line,"\n";}
                                                                                             elsif ($line !~ />/){$liner=uc($line); #trans spell
                                                                                                                  print OUTFILE $liner,"\n";}
                                                                                             }
                                                                                               }
                                                                           }
                                                         