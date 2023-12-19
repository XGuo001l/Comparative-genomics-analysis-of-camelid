#!/usr/bin/perl -w
use warnings;
$aln_dir = "/picb/bigdata/project/guoxin/n0pagan1/";
opendir(DIR, $aln_dir) || die "Error: cannot open directory $aln_dir\n";
@files = readdir DIR;
foreach $file (@files) {
	if ($file =~ /^(.+)\.fa$/) {$id = $1;
                                        
                                                                                 open(OUTFILE,">$aln_dir/$id.fas") or die"cannot open n0indell.csv:$!";
                                                                                 open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
                                                                                 while($lin=<FILE>){chomp $lin;
                                                                                                    if($lin =~ />/ ){$title=$lin;
                                                                                                                     if ($lin !~ /\#/)
                                                                                                                         { print OUTFILE $lin,"\n";}}
                                                                                                                         
                                                                                                    elsif($lin !~ />/ && $title !~ /\#/)
                                                                                                                                               
                                                                                                                            { print OUTFILE $lin,"\n";}
                                                                                                           }
                                                                                      }
                                                                   }
