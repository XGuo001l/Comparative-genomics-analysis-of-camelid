#!/usr/bin/perl -w
use warnings;
$file = "cambcal3-1.syn";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split(' ',$lin);
                      @rnaxm=split('\.',$col[10]);
                      $rnax=$rnaxm[0];
                      @prerna1=split(':',$col[2]);
                      $i=0;$num=1000;
                      foreach $prna (@prerna1){$i++;
                                                  if($prna =~ /rna/){@rnaxm1=split('\.',$prna);
                                                                     if($rnaxm1[0] eq  $rnax){$num=$i;}}
                                                 elsif($i == $num+2) {print $col[0],"\t",$col[2],"\t",$col[3],"\t",$col[4],"\t",$col[5],"\t",$col[6],"\t",$col[7],"\t",$col[8],"\t",$col[9],"\t",$col[10],"\t",$prna,"\n"}}
                          }           
