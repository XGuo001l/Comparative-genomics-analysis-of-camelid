#!/usr/bin/perl -w
use warnings; #delete the line which not match the base
$file = "cambcal3new.syn";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                             
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split(' ',$lin);
                     $cambac=$col[12];
                     @preloci1=split('\.',$col[10]);
                   @preloci2=split('',$preloci1[1]);
                     $baseend=pop @preloci2;
                  $basestart=shift @preloci2;
                  if($cambac eq $basestart && $col[11] eq $basestart || $cambac eq $basestart && $col[11] eq $baseend){
                     print $col[0],"\t",$col[1],"\t",$col[2],"\t",$col[5],"\t",$col[6],"\t",$col[7],"\t",$col[8],"\t",$col[9],"\t",$col[10],"\t",$col[11],"\t",$col[12],"\t",$col[13],"\t",$col[14],"\n";}
                     }
                                   

