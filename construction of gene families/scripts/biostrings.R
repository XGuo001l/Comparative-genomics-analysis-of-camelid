install.packages('BiocManager')
BiocManager::install('Biostrings')
library(Biostrings)
llama_seq <- readDNAStringSet('llama.fa')
alpc_seq <- readDNAStringSet('alpc.fa')
cambac_seq <- readDNAStringSet('cambac.fa')
camdro_seq <- readDNAStringSet('camdro.fa')
camfer_seq <- readDNAStringSet('camfer.fa')
cattle_seq <- readDNAStringSet('cattle.fa')
pig_seq <- readDNAStringSet('pig.fa')
vicgn_seq <- readDNAStringSet('vicgn.fa')
guanc_seq <- readDNAStringSet('guanc.fa')
human_seq <- readDNAStringSet('human.fa')
mouse_seq <- readDNAStringSet('mouse.fa')
#llama_seq
#names(llama_seq)#基因名
#llama_names <- names(llama_seq)
#oneone_genename <- read.table("n0-1-1genename.tsv")
#test <- llama_seq["rna-XM_006210639.3"]
#test2 <- alpc_seq[rowww[2,]]
#writeXStringSet(test,file="test.fa")#test
#llama_seq[llama_names[1]]  #rna-XM_031671251.1
con2 <- file("n3-1-1genename.tsv","r")
#lin <- readLines(con1,n=1) #逐行提取文件
#roww <- strsplit(lin,'\t')
#rowww <- as.data.frame(roww)
#which(rowww[9,] == llama_names)#判断位置
#filename <- rowww[1,] #以HOG为文件名
#llama <- llama_seq[rowww[9,]]
#writeXStringSet(test,file=filename,append = TRUE)##以HOG为文件名，写入文件以及追加
#写循环

while(1){
 lin = readLines(con2, n = 1)
 roww <- strsplit(lin,'\t')
 rowww <- as.data.frame(roww)
 filename <- rowww[1,]
 alpc <- alpc_seq[rowww[2,]]#1
 writeXStringSet(alpc,file=filename,append = TRUE)
 cambac <- cambac_seq[rowww[3,]]#2
 writeXStringSet(cambac,file=filename,append = TRUE)
 camdro <- camdro_seq[rowww[4,]]#3
 writeXStringSet(camdro,file=filename,append = TRUE)
 camfer <- camfer_seq[rowww[5,]]#4
 writeXStringSet(camfer,file=filename,append = TRUE)
# cattle <- cattle_seq[rowww[6,]]#5
# writeXStringSet(cattle,file=filename,append = TRUE)
 guanc <- guanc_seq[rowww[7,]]#6
 writeXStringSet(guanc,file=filename,append = TRUE)
# human <- human_seq[rowww[8,]]#7
# writeXStringSet(human,file=filename,append = TRUE)
 llama<- llama_seq[rowww[9,]]#8
 writeXStringSet(llama,file=filename,append = TRUE)
# mouse <- mouse_seq[rowww[10,]]#9
# writeXStringSet(mouse,file=filename,append = TRUE)
# pig <- pig_seq[rowww[11,]]#10
# writeXStringSet(pig,file=filename,append = TRUE)
 vicgn <- vicgn_seq[rowww[12,]]#11
 writeXStringSet(vicgn,file=filename,append = TRUE)
  if(length(lin) == 0){
    break
  }}
