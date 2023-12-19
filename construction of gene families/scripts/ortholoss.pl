#!/usr/bin/perl -w
use warnings;
$file = "/picb/bigdata/project/guoxin/geneloss/N3.txt"; 
 open(FILE,$file) || die "Error: cannot open file $file:$!";
                                                                           
                  while($lin=<FILE>){chomp $lin;
                                     @species=split('\t',$lin);
                                     @alpc=split(',',$species[3]);
                                     @cambac=split(',',$species[4]);
                                     @camdro=split(',',$species[5]);
                                     @camfer=split(',',$species[6]);
                                     @guanc=split(',',$species[7]);
                                     @llama=split(',',$species[8]);
                                     @vicgn=split(',',$species[9]);
                                     
                                     $cb= scalar @cambac;
                                     $cd=scalar @camdro;
                                     $cf=scalar @camfer;
                                     $alp=scalar @alpc;
                                    
                                     $gua=scalar @guanc;
                                   
                                     $lama=scalar @llama;
                                   
                                    
                                     $vic=scalar @vicgn;
                                     if($cb==0 && $cd==0 && $cf==0 &&$alp !=0 &&  $gua !=0 &&  $lama !=0 &&  $vic !=0){
                                                                  
                                                                                                   
                                                                                                                                                                print $species[0],"\t",$species[3],"\n"; }
                                     }            
