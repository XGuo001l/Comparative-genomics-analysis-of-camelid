#!/usr/bin/perl -w
use warnings;  #calculate daf
$file = "cambcal4new.syn";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split(' ',$lin);
                     $alpc=$col[9];
                     @preloci1=split('\.',$col[8]);
                   @preloci2=split('',$preloci1[1]);
                     $baseend=pop @preloci2;
                  $basestart=shift @preloci2;
                  if($alpc eq $basestart) {@predaf=split('=',$col[5]);
                                            $daf=1-$predaf[1];
                     print $col[0],"\t",$col[1],"\t",$col[2],"\t",$col[3],"\t",$col[4],"\t",$col[5],"\t",$col[6],"\t",$col[7],"\t",$col[8],"\t",$col[9],"\t",$col[10],"\t",$col[11],"\t",$col[12],"\t",$daf,"\n";}
                  elsif($alpc eq $baseend){@predaf=split('=',$col[5]);
                                            $daf=$predaf[1];
                                             print $col[0],"\t",$col[1],"\t",$col[2],"\t",$col[3],"\t",$col[4],"\t",$col[5],"\t",$col[6],"\t",$col[7],"\t",$col[8],"\t",$col[9],"\t",$col[10],"\t",$col[11],"\t",$col[12],"\t",$daf,"\n";}
                     }
                                   

