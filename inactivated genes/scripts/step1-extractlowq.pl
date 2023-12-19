#!/usr/bin/perl -w
use warnings;
print "Your file name:";
$file  = <STDIN>; # Full path of gbff file
open(FILE,$file) || die "Error: cannot open file $file:$!";
                   $K=1;                                                          
                  while($lin=<FILE>){chomp $lin;
                                     @row=split(' ',$lin);
                                     if($row[0] =~ /DEFINITION/ ){
                                                                  $genename=$lin;
                                                                  $K=0;}
                                     elsif($K==0 && $row[0] !~ /ACCESSION/){$genename=$genename.$lin;
                                                                    $K=0;}
                                     elsif($row[0] =~ /ACCESSION/){$rnaid = $lin;
                                                                   $K=1;}
                                     
                                                                   
                                     elsif($lin =~ /corrected/){
                                                                                                   
                                                                  print $genename,"\t",$rnaid,"\t",$lin,"\n";  }                                  
                                     }

