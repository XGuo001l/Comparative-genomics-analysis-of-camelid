#!/usr/bin/perl -w
use warnings; 
$file="/picb/bigdata/project/guoxin/lossgeneseq/targetfasta22/lgvicindex.fa";
$aln_dir="/picb/bigdata/project/guoxin/lossgeneseq/targetfasta22/fasta/";

open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                    if($line=~/>/){
                                   @chr1=split('\t',$line);
                                   $gene=$chr1[1];
                                   open(OUTFILE,">>$aln_dir/$gene.fasta") or die"cannot open n0indell.csv:$!";
                  
                   
                                   print OUTFILE ">vicugn","\t",$gene,"\n"; }
                                    
                    else{print OUTFILE $line,"\n";}
                    } 
                                        
       

                                        
                    
close(FILE);
exit;