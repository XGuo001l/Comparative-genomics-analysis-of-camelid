#!/usr/bin/perl -w
use warnings;
#extract lnL values in .lnL files and calculate 2*deltalnL
$dir="/picb/bigdata/project/guoxin/n0tcspamlbranch1/mlc/lnL/";
opendir(DIR,$dir)  || die "Error: cannot open directory $dir\n";
@files=readdir DIR;
foreach $file (@files){  
                           if ($file =~ /^(.+)\.lnL$/) {  
                          	                                       $id = $1;
                                                                   open(FILE,"$dir/$file") or die"cannot open $file\n";
                                                                   
                                                                  $i=0;
                                                                   while($line=<FILE>){chomp $line;
                                                                                       @row=split(' ',$line);
                                                                               
                                                                                       if ($line =~ /lnL/){
                                                                                                           if ($line =~ /alt/){$fir=$row[4];
                                                                                                                                $i++;}
                                                                                                           elsif ($line =~ /nul/){$sec=$row[4];
                                                                                                                                  $i++;}
                                                                                                           }
                                                                                       if ($i ==2 ){
                                                                                                                         $value=$fir-$sec;
                                                                                                                         if ($value >0){$lnL=2*$value;
                                                                                                                                        open(OUTFILE,">$dir/$id.out") or die"cannot open $file.lnL:$!";
                                                                                                                                        print OUTFILE $lnL;}
                                                                                                                         else {$lnL=2*$value;
                                                                                                                                        open(OUTFILE,">$dir/$id.outneg") or die"cannot open $file.lnL:$!";
                                                                                                                                        print OUTFILE $lnL;}
                                                                  
                                                                                                                          
                                                                                                                               
                                                                                                   }
                                                                                        
                                                                  
                                                                   
                                                                                                  
                          
                                                                                       }
                          
                          
                          
                          
                          
                          
                                                       }
                          }
