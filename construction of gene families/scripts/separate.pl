#!/usr/bin/perl -w
use warnings;
$file=<STDIN>;
open(FILE,$file) or die "cannot open $file:$!";
while($line=<FILE>){chomp $line;
                    @row=split('\t',$line);
 #                  print "$row[0]	$row[1]	$row[2]	$row[9]","\n";}
                   @rrow9=split(',',$row[9]);
                  $num9=scalar @rrow9;
                  @rrow3=split(',',$row[3]);
                   $num3=scalar @rrow3;
                  @rrow4=split(',',$row[4]);
                   $num4=scalar @rrow4;
                  @rrow5=split(',',$row[5]);
                   $num5=scalar @rrow5;
                  @rrow6=split(',',$row[6]);
                   $num6=scalar @rrow6;
                  @rrow7=split(',',$row[7]);
                   $num7=scalar @rrow7;
                  @rrow8=split(',',$row[8]);
                   $num8=scalar @rrow8;
                  @rrow10=split(',',$row[10]);#outgroup
                    $num10=scalar @rrow10;#outgroup
                  @rrow11=split(',',$row[11]);#outgroup
                    $num11=scalar @rrow11;#outgroup
                  @rrow12=split(',',$row[12]);#outgroup
                    $num12=scalar @rrow12;#outgroup
                  @rrow13=split(',',$row[13]);#outgroup
                    $num13=scalar @rrow13;#outgroup
        
                    print "$row[0]	$row[1]	$row[2]	$num3	$num4	$num5	$num6	$num7	$num8	$num9	$num10	$num11	$num12	$num13","\n";}










close(FILE);
exit;

