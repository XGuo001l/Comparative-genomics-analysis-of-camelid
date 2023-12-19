#!/usr/bin/perl -w
use warnings;
$aln_dir="/picb/bigdata/project/guoxin/annovar/cambcvcf/genedaf/";
$file = "$aln_dir/0gen2daf1.ntxt";
   open(FILE,$file) || die "Error: cannot open file $file:$!";
   $gene=1;  $one=0; $two=0; $three=0; $four=0; $five=0; $six=0; $seven=0; $eight=0; $nine=0; $ten=0;  
             $one1=0; $two2=0; $three3=0; $four4=0; $five5=0; $six6=0; $seven7=0; $eight8=0; $nine9=0; $ten10=0;                                                                      
   while($lin=<FILE>){
                      chomp $lin;
                      @col=split('\t',$lin);
                     if ($gene eq 1){$gene=$col[0];
                                     if($col[2] eq "nonsynonymous"){
                                                                 if($col[1] <= 0.1){$one++;}
                                                                  elsif($col[1] <= 0.2 && $col[1] > 0.1){$two++;}
                                                                  elsif($col[1] <= 0.3 && $col[1] > 0.2){$three++;}
                                                                  elsif($col[1] <= 0.4 && $col[1] > 0.3){$four++;}
                                                                  elsif($col[1] <= 0.5 && $col[1] > 0.4){$five++;}
                                                                  elsif($col[1] <= 0.6 && $col[1] > 0.5){$six++;}
                                                                  elsif($col[1] <= 0.7 && $col[1] > 0.6){$seven++;}
                                                                  elsif($col[1] <= 0.8 && $col[1] > 0.7){$eight++;}
                                                                  elsif($col[1] <= 0.9 && $col[1] > 0.6){$nine++;}
                                                                  elsif($col[1] <= 1 && $col[1] > 0.9){$ten++;}}
                                     elsif($col[2] eq "synonymous"){
                                                                 if($col[1] <= 0.1){$one1++;}
                                                                  elsif($col[1] <= 0.2 && $col[1] > 0.1){$two2++;}
                                                                  elsif($col[1] <= 0.3 && $col[1] > 0.2){$three3++;}
                                                                  elsif($col[1] <= 0.4 && $col[1] > 0.3){$four4++;}
                                                                  elsif($col[1] <= 0.5 && $col[1] > 0.4){$five5++;}
                                                                  elsif($col[1] <= 0.6 && $col[1] > 0.5){$six6++;}
                                                                  elsif($col[1] <= 0.7 && $col[1] > 0.6){$seven7++;}
                                                                  elsif($col[1] <= 0.8 && $col[1] > 0.7){$eight8++;}
                                                                  elsif($col[1] <= 0.9 && $col[1] > 0.6){$nine9++;}
                                                                  elsif($col[1] <= 1 && $col[1] > 0.9){$ten10++;}}
                                     }
                     elsif($col[0] eq $gene){$gene=$col[0];
                                     if($col[2] eq "nonsynonymous"){
                                                                 if($col[1] <= 0.1){$one++;}
                                                                  elsif($col[1] <= 0.2 && $col[1] > 0.1){$two++;}
                                                                  elsif($col[1] <= 0.3 && $col[1] > 0.2){$three++;}
                                                                  elsif($col[1] <= 0.4 && $col[1] > 0.3){$four++;}
                                                                  elsif($col[1] <= 0.5 && $col[1] > 0.4){$five++;}
                                                                  elsif($col[1] <= 0.6 && $col[1] > 0.5){$six++;}
                                                                  elsif($col[1] <= 0.7 && $col[1] > 0.6){$seven++;}
                                                                  elsif($col[1] <= 0.8 && $col[1] > 0.7){$eight++;}
                                                                  elsif($col[1] <= 0.9 && $col[1] > 0.6){$nine++;}
                                                                  elsif($col[1] <= 1 && $col[1] > 0.9){$ten++;}}
                                     elsif($col[2] eq "synonymous"){
                                                                 if($col[1] <= 0.1){$one1++;}
                                                                  elsif($col[1] <= 0.2 && $col[1] > 0.1){$two2++;}
                                                                  elsif($col[1] <= 0.3 && $col[1] > 0.2){$three3++;}
                                                                  elsif($col[1] <= 0.4 && $col[1] > 0.3){$four4++;}
                                                                  elsif($col[1] <= 0.5 && $col[1] > 0.4){$five5++;}
                                                                  elsif($col[1] <= 0.6 && $col[1] > 0.5){$six6++;}
                                                                  elsif($col[1] <= 0.7 && $col[1] > 0.6){$seven7++;}
                                                                  elsif($col[1] <= 0.8 && $col[1] > 0.7){$eight8++;}
                                                                  elsif($col[1] <= 0.9 && $col[1] > 0.6){$nine9++;}
                                                                  elsif($col[1] <= 1 && $col[1] > 0.9){$ten10++;}}
                                             }
                     elsif($col[0] ne $gene){if($one != 0 ||$two != 0 ||$three != 0 ||$four != 0 ||$five != 0 ||$six != 0 ||$seven != 0||$eight != 0 ||$nine != 0 ||$ten != 0){
                                              if($one1 != 0 ||$two2 != 0 ||$three3 != 0 ||$four4 != 0 ||$five5 != 0 ||$six6 != 0 ||$seven7 != 0||$eight8 != 0 ||$nine9 != 0 ||$ten10 != 0){
                                            open(OUTFILE,">$aln_dir/$gene.txt") or die"cannot open $gene.txt:$!";
                                            print OUTFILE "daf","\t","Pi","\t","P0","\n","0.05","\t",$one,"\t",$one1,"\n","0.15","\t",$two,"\t",$two2,"\n","0.25","\t",$three,"\t",$three3,"\n","0.35","\t",$four,"\t",$four4,"\n","0.45","\t",$five,"\t",$five5,"\n","0.55","\t",$six,"\t",$six6,"\n","0.65","\t",$seven,"\t",$seven7,"\n","0.75","\t",$eight,"\t",$eight8,"\n","0.85","\t",$nine,"\t",$nine9,"\n","0.95","\t",$ten,"\t",$ten10,"\n";}}
                                            $gene=$col[0];$one=0; $two=0; $three=0; $four=0; $five=0; $six=0; $seven=0; $eight=0; $nine=0; $ten=0;  
             $one1=0; $two2=0; $three3=0; $four4=0; $five5=0; $six6=0; $seven7=0; $eight8=0; $nine9=0; $ten10=0;    
                                     if($col[2] eq "nonsynonymous"){
                                                                 if($col[1] <= 0.1){$one++;}
                                                                  elsif($col[1] <= 0.2 && $col[1] > 0.1){$two++;}
                                                                  elsif($col[1] <= 0.3 && $col[1] > 0.2){$three++;}
                                                                  elsif($col[1] <= 0.4 && $col[1] > 0.3){$four++;}
                                                                  elsif($col[1] <= 0.5 && $col[1] > 0.4){$five++;}
                                                                  elsif($col[1] <= 0.6 && $col[1] > 0.5){$six++;}
                                                                  elsif($col[1] <= 0.7 && $col[1] > 0.6){$seven++;}
                                                                  elsif($col[1] <= 0.8 && $col[1] > 0.7){$eight++;}
                                                                  elsif($col[1] <= 0.9 && $col[1] > 0.6){$nine++;}
                                                                  elsif($col[1] <= 1 && $col[1] > 0.9){$ten++;}}
                                     elsif($col[2] eq "synonymous"){
                                                                 if($col[1] <= 0.1){$one1++;}
                                                                  elsif($col[1] <= 0.2 && $col[1] > 0.1){$two2++;}
                                                                  elsif($col[1] <= 0.3 && $col[1] > 0.2){$three3++;}
                                                                  elsif($col[1] <= 0.4 && $col[1] > 0.3){$four4++;}
                                                                  elsif($col[1] <= 0.5 && $col[1] > 0.4){$five5++;}
                                                                  elsif($col[1] <= 0.6 && $col[1] > 0.5){$six6++;}
                                                                  elsif($col[1] <= 0.7 && $col[1] > 0.6){$seven7++;}
                                                                  elsif($col[1] <= 0.8 && $col[1] > 0.7){$eight8++;}
                                                                  elsif($col[1] <= 0.9 && $col[1] > 0.6){$nine9++;}
                                                                  elsif($col[1] <= 1 && $col[1] > 0.9){$ten10++;}}
                      
                        
                                             }                           
                            }
                                         