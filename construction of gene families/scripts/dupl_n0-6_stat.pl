#!/usr/bin/perl -w
use warnings;#统计每个orthogroup在每个节点发生复制的次数
$file=<STDIN>;
$n0=0;$n1=0;$n2=0;$n3=0;$n4=0;$n5=0;$n6=0;
$i=0;
open(FILE,$file) or die"cannot open $file:$!";
while($line=<FILE>){chomp $line;
                    $i++;
                    @row=split(',',$line);
                    if ($i==1){$og=$row[0];
                               $n0++;}
                    elsif($row[0] eq $og){$og=$row[0];
                                           if ($row[1] eq 'N0'){$n0++;}
                                            elsif($row[1] eq 'N1'){$n1++;}
                                            elsif($row[1] eq 'N2'){$n2++;}
                                            elsif($row[1] eq 'N3'){$n3++;}
                                            elsif($row[1] eq 'N4'){$n4++;}
                                           elsif($row[1] eq 'N5'){$n5++;}
                                           elsif($row[1] eq 'N6'){$n6++;}
                                           }
                    elsif($row[0] ne $og){print "$og,$n0,$n1,$n2,$n3,$n4,$n5,$n6","\n";#末尾需要添加不与上一行$row[0]相同的行
                                          $og=$row[0];
                                          $n0=0;$n1=0;$n2=0;$n3=0;$n4=0;$n5=0;$n6=0;
                                          if($row[1] eq 'N0'){$n0++;}
                                            elsif($row[1] eq 'N1'){$n1++;}
                                           elsif($row[1] eq 'N2'){$n2++;}                                                                                                                             
                                           elsif($row[1] eq 'N3'){$n3++;}
                                           elsif($row[1] eq 'N4'){$n4++;}
                                           elsif($row[1] eq 'N5'){$n5++;}
                                           elsif($row[1] eq 'N6'){$n6++;}
                                       }

                        }





                                        
                                            close(FILE);
                                            exit;
