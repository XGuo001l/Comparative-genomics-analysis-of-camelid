#!/usr/bin/perl -w
use warnings;

print "Please type the file name:";

$file=<STDIN>;
open(FILE,$file) or die"cannot open $file,$!";
$i=0;$j=0;
@intronseq=<FILE>;
foreach $seq (@intronseq) {$i++;
                           chomp $seq;#move the newline symbol in the end of the strings
                          if ($seq=~ /^\s*$/){ $i--;
                                               } 
                         
                         elsif ($seq=~ />/){$i--;
                                             }
                           
                          else {@base=split('',$seq);
                                if (scalar @base <= 5)  {$i--;
                                                          }
                                else {
                                
                                $base1=shift @base;
                                $base2=shift @base;
                       
                                $beginbases="$base1$base2";
             
                                $case2=pop @base;
                                $case1=pop @base;
                                $endbases="$case1$case2";
      
                                if ($beginbases =~ /GT/ig && $endbases =~ /AG/ig ){ $j++;}
                
                                      }
                                } 
                           }   

print "$j  $i\t",$j/$i,"\n";






close(FILE);
exit;
