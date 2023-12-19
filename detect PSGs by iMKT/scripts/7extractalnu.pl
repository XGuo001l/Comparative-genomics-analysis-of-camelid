#!/usr/bin/perl -w
use warnings; #match sequence corresponding site base.

$dir="/picb/bigdata/project/guoxin/N0pagan/";
$fl2 = "cambcal3-2.syn";
opendir(DIR,$dir)  || die "Error: cannot open directory $dir\n";
@files=readdir DIR;
foreach $file (@files){  
                       if ($file =~ /^(.+)\.fass$/) { 
                          	                                       $id = $1;
                                                            
                                                                   open(FL,$fl2) || die "Error: cannot open file $fl2:$!";
                                                            
                                                                   while($line=<FL>){chomp $line;
 
                                                                                       @row=split(' ',$line);
                                                                                       $hog=$row[8];
                                                                                  
                                                                                       @preloci1=split('\.',$row[10]);
                                                                                       @preloci2=split('',$preloci1[1]);
                                                                                       $baseend=pop @preloci2;
                                                                                       $basestart=shift @preloci2;
                                                                                       $loci=join('',@preloci2);
                                                                                        $num=$loci*1;
                                                                                  if ($hog eq $id){
                                                                                                     open(FILE,"$dir/$file") or die"cannot open $file\n";
                                                                                                      while($lin=<FILE>){chomp $lin;
                                                                                                                         if ($lin =~ />/){$species = $lin;}
                                                                                                                         else {if($species =~ /alpc/) {$alpa=$lin;}
                                                                                                                               elsif($species =~ /cambac/){$j=0;$i=0;$k=0;
                                                                                                                                                         @bases=split('',$lin);
                                                                                                                                                     
                                                                                                                                                       do  {if($bases[$k] !~ /-/)
                                                                                                                                                             {$i++;$k++;}
                                                                                                                                                            else {$j++;$k++;}
                                                                                                                                                           }until($i>=$num);
                                                                                                                                                             $g=$i+$j-1;
                                                                                                                                                          @basealpc=split('',$alpa);
                                                                                                                                                          print $line,"\t",$basealpc[$g],"\t",$bases[$g],"\t",$k,"\t",$num,"\t",$i,"\t",$j,"\n";}
                                                                                                                                }
                                                                                                                         }

                                                                                                     }
                                                                                      }
                                                                                     
                           
                                                         } 
                           }