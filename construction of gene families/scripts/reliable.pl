#/usr/bin/perl -w
use warnings;
$file=<STDIN>;#计算1：1等的数量
$i=0;$m3=0;$m4=0;$m5=0;$m6=0;$m7=0;$m8=0;$m9=0;$sp3=0;$sp4=0;$sp5=0;$sp6=0;$sp7=0;$sp8=0;$sp9=0;$l=0;
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                     @row=split('\t',$line);
                                if ($row[3]==1 && $row[4]==1 && $row[5]==1 && $row[6]==1 && $row[7]==1 && $row[8]==1 && $row[9]==1){
                                                                                                                                                                                                       $i++;}
                               elsif ($row[3]==0&&$row[4]!=0&&$row[5]!=0&&$row[6]!=0&&$row[7]!=0&&$row[8]!=0&&$row[9]!=0){                                                                       
                                                                                                                                                                                                 $m3++;}
                                                                                                                                                                                                         
                               elsif ($row[3]!=0&&$row[4]==0&&$row[5]!=0&&$row[6]!=0&&$row[7]!=0&&$row[8]!=0&&$row[9]!=0){                                                                   
                                                                                                                                                                                                 $m4++;}
                               elsif ($row[3]!=0&&$row[4]!=0&&$row[5]==0&&$row[6]!=0&&$row[7]!=0&&$row[8]!=0&&$row[9]!=0){                                                                      
                                                                                                                                                                                                 $m5++;}
                               elsif ($row[3]!=0&&$row[4]!=0&&$row[5]!=0&&$row[6]==0&&$row[7]!=0&&$row[8]!=0&&$row[9]!=0){
                                                                                                                                                                                                 $m6++;}
                               elsif ($row[3]!=0&&$row[4]!=0&&$row[5]!=0&&$row[6]!=0&&$row[7]==0&&$row[8]!=0&&$row[9]!=0){
                                                                                                                                                                                                $m7++;}
                               elsif ($row[3]!=0&&$row[4]!=0&&$row[5]!=0&&$row[6]!=0&&$row[7]!=0&&$row[8]==0&&$row[9]!=0){
                                                                                                                                                                                                 $m8++;}
                               elsif ($row[3]!=0&&$row[4]!=0&&$row[5]!=0&&$row[6]!=0&&$row[7]!=0&&$row[8]!=0&&$row[9]==0){
                                                                                                                                                                                                 $m9++;}
                               elsif ($row[3]!=0&&$row[4]==0&&$row[5]==0&&$row[6]==0&&$row[7]==0&&$row[8]==0&&$row[9]==0){
                                                                                                                                                                                                        $sp3++;}
                               elsif ($row[3]==0&&$row[4]!=0&&$row[5]==0&&$row[6]==0&&$row[7]==0&&$row[8]==0&&$row[9]==0){
                                                                                                                                                                                                        $sp4++;}
                               elsif ($row[3]==0&&$row[4]==0&&$row[5]!=0&&$row[6]==0&&$row[7]==0&&$row[8]==0&&$row[9]==0){
                                                                                                                                                                                                        $sp5++;}
                               elsif ($row[3]==0&&$row[4]==0&&$row[5]==0&&$row[6]!=0&&$row[7]==0&&$row[8]==0&&$row[9]==0){
                                                                                                                                                                                                        $sp6++;}
                               elsif ($row[3]==0&&$row[4]==0&&$row[5]==0&&$row[6]==0&&$row[7]!=0&&$row[8]==0&&$row[9]==0){
                                                                                                                                                                                                        $sp7++;}
                               elsif ($row[3]==0&&$row[4]==0&&$row[5]==0&&$row[6]==0&&$row[7]==0&&$row[8]!=0&&$row[9]==0){
                                                                                                                                                                                                        $sp8++;}
                              elsif ($row[3]==0&&$row[4]==0&&$row[5]==0&&$row[6]==0&&$row[7]==0&&$row[8]==0&&$row[9]!=0){
                                                                                                                                                                                                        $sp9++;}
                              else {$l++;}

                                 }   
 print "1:1: $i	ms3: $m3	ms4: $m4	ms5: $m5	ms6: $m6	ms7: $m7	miss8: $m8	mis9: $m9	spe3: $sp3	spe4: $sp4	spe5: $sp5	spe6: $sp6	spe7: $sp7	spe8: $sp8	spe9: $sp9	other: $l","\n";
close(FILE);
exit;
