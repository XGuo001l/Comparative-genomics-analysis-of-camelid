#!/usr/bin/perl -w
use warnings;
#$file="test1.txt";
print "Please type the file name:";

$file=<STDIN>;
open(FILE,$file) or die"cannot open $file,$!";
$i=0;$j=0;
@intronseq=<FILE>;
foreach $seq (@intronseq) {$i++;
                           chomp $seq;#move the newline symbol in the end of the strings
                          if ($seq=~ /^\s*$/){ $i--;#print "i am the blank    $i","\n";
                                               } 
                         
                         elsif ($seq=~ />/){$i--;#print "i am the chromosome $seq    $i","\n";
                                             }
                           
                          else {@base=split('',$seq);
                                if (scalar @base <= 5)  {$i--;#print scalar @base,"i have less than three $seq   $i","\n";
                                                          }
                                else {
                                
                                $base1=shift @base;
                                $base2=shift @base;
                            #    $base3=shift @base;
                                $beginbases="$base1$base2";
              #               $case3=pop @base;#This step is necessary when donnot subtract 1 in the start of genes and exons.
                                $case2=pop @base;
                                $case1=pop @base;
                                $endbases="$case1$case2";
         #                       print "$base1 $base2 $base3  $endbases","\n";
                                if ($beginbases =~ /GT/ig && $endbases =~ /AG/ig ){ $j++;}
              #  print "$i   $j","\n";                     
                                      }
                                } 
                           }   

print "$j  $i\t",$j/$i,"\n";





#@row=split('\n',$line);
 #                   $i++; 
  #                  foreach $sequence (@row){
   #                 if ($i==1){$j=0;
    #                           foreach $title (@row){
    #                                                 $j++;
     #                                                if ($title eq 'MHALS'){
      #                                                                   print $j,"\n";}
      #                                                  }
       #                           }
        #                        }
close(FILE);
exit;
