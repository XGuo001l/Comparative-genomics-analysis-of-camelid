#!/usr/bin/perl -w
use warnings;
$file=<STDIN>;
$i=0;
open(FILE,$file) or die"cannot open $file,$!";
while($line=<FILE>){$i++;
                 
                    if ($i==1){$k=$line;
                  
                                   }
                    elsif($i > 1) {
                          if($k =~ />/){print $line;
                                        $k=$line;}
                          else{$k=$line;}
                                         }
                    }
close(FILE);
exit;
#extract the lines which in front of someline.
                    
