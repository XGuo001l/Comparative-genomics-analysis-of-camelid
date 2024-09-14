# **Comparative genomics analysis of camelid**

### Transfer annotations

While most species had their genome annotations available on NCBI, annotations for llama, guanaco, and vicuña were exceptions. We utilized Liftoff (version 1.5.1) to transfer the alpaca's annotation to them.

- ##### Tools used in transferring

| Tool name                | Parameters                                                   | Input                                                        | Output                                                       | Command                                                      |
| ------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Liftoff                  | -g    -o                                                     | Target genome sequence fasta file,            Reference Genome sequence fasta file ,           Reference Genome annotation file. | The obtained target genome annotation file                   | `liftoff [target] [reference] -g [annotation.gff] -o [filename]` |
| bedtools        subtract | -a -b                                                        | Generally a bed file for genes or transcripts, a bed file for exons | Generally a bed file for introns                             | `bedtools subtract -a [A.bed] -b [B.bed] > outputfile.bed`   |
| bedtools getfasta        | -fi                          -bed         -fo                | `-fi` input the genome sequence fasta file，`-bed` input the bed file that needs to be mapped to the genome | Output the sequence corresponding to the location of the bed file | `bedtools getfasta -fi genome.fa -bed intron.bed -fo intron.fa` |
| gffread                  | -x  -g                                                       | `-x` is the command to extract CDS, and `-g` enters the genome sequence fasta file as well as the annotation file | ORF sequence fasta file                                      | `gffread -x outputfile.fa -g genome.fa annotation.gff`       |
| blast（makeblastdb）     | -in                              -dbtype            -out     | `-in` enter the sequence fasta file used to build the library，  `-dbtype`enter the type of library，nucl and prot are available for selection. It is easy to understand that nucl is nucleic acid and prot is protein.    `-out`enter the name of library. | `database.nhr` `database.nin` `database.nsq`                 | `makeblastdb -in yangtuo_alpaca_gffread.fa -dbtype nucl -out yangtuo_alpaca_db` |
| blast（blastn）          | -query     -db             -out                 -evalue           -outfmt | `-query`enter the fasta file of the sequence to be aligned，`-db`enter the library name generated in last step，`-out`enter the file name of the alignment result，  `-evalue`set the evalue threshold，`-outfmt`the format of the output file is available from 0 to 18, and 6 is the form file | Comparison results in tables and other forms                 | `blastn -query yangtuo_guanaco_gffread.fa -db yangtuo_alpaca_database -out yangtuo_guanacoblast.csv -evalue 1e-5 -outfmt 6` |



- ##### Scripts needed

| Name                    | Input                                                       | Output                                                       | Note                                                         |
| ----------------------- | ----------------------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `No.1protein_coding.pl` | Annotation file`.gff`                                       | Annotation`.gff`                                             | Extract encoding proteins and other features from the annotations genes. |
| `No.3countorfatg.pl`    | The input files are orf sequence fasta files                | The output is the first line of the extracted orf, which can be written to a fasta file. | gffread generates an orf sequence of 70bases per row, extracting the first (and last) row to calculate the proportion beginning with ATG. |
| `No.4orf_atgnumber.pl`  | The first line of orf fasta file output by No.3             | Sequence structural integrity ratio.                         | Calculate the structural integrity ratio.                    |
| `No.6intron_gtag.pl`    | Intron sequence fasta file                                  | Conforms to the GT-AG rule ratio.                            | The proportion of calculated intron sequences with complete GT-AG. |
| `No.7blastana.pl`       | The `.csv` file or  other format file generated by `blastn` | Same format as the input file                                | Used to extract sequences with the same ID                   |
| `No.8lengthdist.pl`     | The `.csv` file or  other format file generated by `blastn` | Same format as the input file                                | Used to calculate length by contrast                         |




----------------------------------------------






### Construction of gene families
OrthoFinder was employed to establish gene families and identify orthologous genes within the scope of investigation encompassing 11 species.
- ##### Input and Output

| Order              | Input                                                        | Output                                                       |
| ------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| OrthoFinder        | After `-f` enter the sequence file absolute path, one FASTA file per species.After `-s` enter the absolute path of the species tree file. | Enter the FASTA file directory to generate a folder named Results+ date，including:1.**Phylogenetic Hierarchical Orthogroups Directory**    2.**Gene Trees Directory**          3.**Comparative Genomics Statistics Directory**           4.**Gene Duplication Events Directory** |
| TimeTree（online） | Species name file, one species per line                      | Phylogenetic tree of all imported species                    |



- ##### Extraction of 1:1 orthologous genes

When analyzing the hierarchical homologous groups, we can select the files of the required inner nodes according to the species tree for analysis. The first step here is to extract 1:1 orthologous genes.

| Scripts                    | Languages | Aim                                                          | Input                                                        | Output                                                       |
| -------------------------- | --------- | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| longestmRNA.pl             | perl      | The longest mRNA in each gene, the transcript was extracted. | `annotation.gff`                                             | Annotated file of the longest mRNA`.gff`(The sequence can then be obtained using bedtools) |
| separate.pl                | perl      | Calculate and output the number of genes for each HOG in each species. | e`.tsv`file for each node，such as`N0.tsv`                   | `.tsv`file for gene number(office software can then be used to extract the HOG with 1 gene number of each species.) |
| one-one-orthogroup-gene.pl | perl      | The REFSEQ gene names corresponding to 1:1 orthologous genes were extracted. | `.tsv`file concerning Orthogroup ，such as`N0.tsv`；txt file including 1：1HOG | `.tsv/.csv`file for 1:1 orthologs(REFSEQ)                    |
| reliable.pl                | perl      | The number of orthogroups that are 1:1, specific and missing is calculated. | output file of separate.pl                                   | 1:1 orthologous genes, number of specific and missing orthogroups per species |
| Biostring.R                | R         | The sequences of each species in each orthogroup were spliced into a file by orthogroup using biostring software. | sequence file`.fa`  for each species;   A table file containing the gene name (refseq) | Each orthogroup is a fasta file containing the corresponding gene sequence for each species`.fa` |



- ##### Duplications

The <u>Duplication.tsv</u> generated by OrthoFinder was used to analyze the typical replication events on each node.

`dupl_n0-6_stat.pl` #The Duplication.tsv was as input, and output the duplication times at node N0-N6. Then we look for genes  that replicate more often on N3, N5, and N6, which we are interested in.



- ##### Genes that are sequentially lost in Old World camels

1.`ortholoss.pl` # Extracted the orthogroups that genes are not found in the three Old World camels and are found in all other New World camels. Output n3loss1.txt

2.`cam0real.pl` # It was confirmed that the orthogroups lost in old World camels have corresponding g



--------------------------------------------------------------------------------------



### Indel(Multiple sequence alignment and quality control)

PAGAN was used for multiple sequence alignment, and the alignment quality was scored and filtered by TCS. The events obtained in PAGAN were used to infer specific indel genes in Old World camels.

- ##### Multiple sequence alignment by PAGAN

PAGAN excels at modeling intricate gap structures and provides more precise inference of gap positions compared to PRANK. 

1.install PAGAN: `wget http://wasabiapp.org/download/pagan/pagan.linux64.[latest].tgz`.

​                         `tar xvzf pagan.linux64.[latest].tgz`.

​                         `./pagan/bin/pagan`

2.Run PAGAN in batches :[pagan.sh](https://github.com/XGuo001l/Comparative-genomics-analysis-of-camelid/blob/main/indel/scripts/pagan.sh) #Take the species tree of all 11 species as  input. The output file contains protein sequence alignment, DNA sequence alignment, and some insertion,deletion, and substitution events.

3.[delbranchseq.pl](https://github.com/XGuo001l/Comparative-genomics-analysis-of-camelid/blob/main/indel/scripts/delbranchseq.pl) #delete the predicted branch sequences .



- ##### Infer specific indel genes in Old World camels

1. 1event.eventN0.pl #The events that occur on the required branch were extracted from the events file generated by PAGAN.
2. 2event.indel.pl  3event.indeltotsv.pl #Extract the events of insertion and deletion.
3. 4event.pgascii.pl #The scores of 5aa before and after indel position were extracted. pgevformatN0.tsv as input. n0indell.tsv as output.
4. 1scorenoall3-1.pl #Filtering results in indel occurring only at #5#. As for deletion,  three species of the Old World camels were gap, while none of the other species were gap. insertions of all three species of the Old World camels were not gap, while which of all other species were gap.
5. distancebefilter.pl #Obtain the distance between adjacent indels.
6. scoreave.pl #Calculate the mean of the score and set the threshold of the mean for filtering.
7. lengthbefilter.pl #Obtain the length of indels.



- ##### **Score and filter by TCS**

[TCS](www.tcoffee.org/Projects/tcs) is a flexible scoring and filtering tool.

tcs.sh #The subsequent sequence of multiple sequence alignment is scored , and the column below a specific score becomes  gaps.



- ##### MutPredIndel

MutPredIndel was used to predict the probability that a specific indel  gene would cause human disease.

`sh run_MutPredIndel.sh ./MCR2/v91 /your dir/genename.fas outputfile` #Run the script in its own directory. The input file contains two sequence,  One is the original reference sequence and the other is the sequence containing indels.



--------------------------------------------------------



### Detect the PSGs by PAML

PAML was performed after multiple sequence alignment of genes from 11 species and filtered by TCS.

- #####  TCS for PAML

tcs scored each residue, and marked the residues below 5 points as gaps. Note that the results of protein alignment were scored here, and then the rescults needed to be translated back according to DNA sequence. Because analyses by PAML needs the DNA sequences.

`/home/T-COFFEE/bin/t_coffee -infile genename.fas -evaluate -output score_ascii,tcs_residue_lower5, -thread 30 -n_core 30`

[tcstransback.sh](https://github.com/XGuo001l/PAML/blob/main/scripts/tcstransback.sh)



- ##### Run PAML

Four folders are required to run PAML, `sequence/` contains multiple sequence alignment files for all genes, `ctl/` contains all control files, tree contains species phylogenetic tree, and `mlc/` is the generated files.

1. `paml.ctl.pl` #Generate control files for each gene in batches using <u>alt_codeml.ctl</u>  <u>nul_codeml.ctl</u>  as a template.
2. `paml.fasta2phy.pl` #Converts sequence alignment files in`.fasta` format to `.phy`.
3. `codeml.sh` #Run PAML for each batch.
4. `paml.lnL.pl` #The null hypothesis mlc file and the alternative hypothesis mlc file generated by paml were respectively extracted with lnL values.
5. `paml.producelnL.pl`  #The pair of lnL values extracted in the previous step are calculated to obtain 2*ΔlnL, which is used to calculate pvalue.
6. `chi2.sh` #The pvalue is calculated from the generated 2*ΔlnL value and the degree of freedom.
7. `paml.pval.pl` #The genes with pvalue less than 0.05 were extracted.



- ##### Filter for reliable positive selection genes

- ##### [MutPred2](http://mutpred.mutdb.org/) to predict the probability causing human disease

MutPred2 was used to predict the probability that a significant substitution site of a positively selected gene would cause human disease.

`/home/mutpred2.0/run_mutpred2.sh -i pamlmutpred2.fas -p 1 -c 1 -b0 -f 2 -o n0mutpred2.csv`

The input sequence needs to contain the position of the substitution amino acid residue on the first line, and what amino acids are before and after the substitution.



--------------------------------------------------------------------



### Detect the PSGs by iMKT

- ##### The processing of input data required by iMKT

For each gene, iMKT requires two tables as input, one is an intra-species polymorphism table and the other is an inter-species divergence table.

###### 1.Generate intra-species polymorphism tables.

[ANNOVAR](https://annovar.openbioinformatics.org/)  is used for annotation of SNPS and other variation sites. We used the gene-based annotation. The output we used of the Bactrian camels' vcf file is `cambac.exonic_variant_function`.

`cambac.exonic_variant_function →    1extractsyn.pl → cambc.syn → 2delinenum.pl  → cambcsyn.syn → 3delloc.pl  → cambcal1.syn → 4matchhog.pl → cambcal2.syn → 5matchxm.pl → cambcal3-1.syn  → 6extractrna.pl → cambcal3-2.syn →7extractalnu.pl →cambcal3new.syn → 8delnomatch.pl → cambcal4new.syn → 9caldaf.pl → cambcal5new.syn → 10gene2daf.pl → 0gen2daf1.ntxt → 11gene2daf1.pl` 

This series of steps produces a number of daf and synonymous sites and non-synonymous  sites named for each gene.

###### 2.Generate inter-species divergence tables.

`PAML yn00` was used to generate the inter-species divergence tables.

Four folders are required to run PAML, `sequence/` contains multiple sequence alignment files for all genes, `ctl/` contains all control files, tree contains species phylogenetic tree, and `mlc/` is the generated files.c

1. `paml.ctl.pl` #Generate control files for each gene in batches using <u>yn00.ctl</u> as a template.
2. `paml.fasta2phy55.pl` #Converts sequence alignment files in`.fasta` format to `.phy`.
3. `yn00.sh` #Run yn00.
4. `extractns.pl` #The non-synonymous and synonymous numbers for each gene were extracted from the mlc file generated by yn00. → 0n0allnsgene1.csv
5. `0allnsgene.pl` #The synonymous and non-synonymous numbers of each gene are individually generated into a file named after the gene.



- ##### Run iMKT

iMKT is an R package that runs the file for each gene prepared earlier as input. Run `iMKT.R` and generatethe pvalue of the gene to infer whether positive selection has occurred.

<u>0newEmkt.txt  0newFWW.txt  0newstandardMKT.txt</u>  were all the result data by iMKT.



------------------------------------------------------------------------------------------



### Detect Inactivated Genes

- ##### Find genes with inactivated substitutions in the Old World camels

Inactivating substitutions, such as nonsense substitutions and frameshift substitutions might be ‘corrected’ as sequencing errors by the NCBI annotation system. We planned to find genes that had been corrected only in Old World camels, not in alpaca. The steps are as follows:

###### 1. Get annotation files in gbff format

1. The gbff format annotation files for each species were derived from NCBI RefSeq. File type is RNA GeneBank format (.gbff). For example, the file for alpaca were from https://www.ncbi.nlm.nih.gov/projects/r_gencoll/ftp_service/nph-gc-ftp-service.cgi/?HistoryId=MCID_656d5a01877b3c7628602c7a&QueryKey=14&ReleaseType=RefSeq&FileType=RNA_GB&Flat=true

2. Species that require gbff file in our research are  *Camelus bactrianus, Camelus dromedarius, Camelus ferus* and *Vicugna pacos*.

   

###### 2. Get 'corrected' information in each species from the annotation files 

According to the structure of the gbff file, extract the gene name from the **<u>DEFINITION</u>**, and then check whether the gene is corrected. If so, output the gene name and corrected information:[scripts/step1-extractlowq.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step1-extractlowq.pl). The output file is speciesnamecorr.txt. For example, [testdata/alpacacorr.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/alpacacorr.txt)

The genes in the species with corrected information were obtained step by step in the following order, and the output of each script served as the input of the next script (Take alpaca, for example):

1.  [scripts/step2-extractcor.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step2-extractcor.pl) → [testdata/alpacacorr2.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/alpacacorr2.txt)
2.  [scripts/step3-matchHOG.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step3-matchHOG.pl) → [testdata/alpacacorr3.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/alpacacorr3.txt)
3.  [scripts/step4-extractgene.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step4-extractgene.pl) → [testdata/alpacacorr4.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/alpacacorr4.txt)
4.  [scripts/step5-extrgenecol1.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step5-extrgenecol1.pl) → [testdata/alpacacorr5.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/alpacacorr5.txt)
5.  [scripts/step6-extrHOG.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step6-extrHOG.pl) → [testdata/alpacacorr6.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/alpacacorr6.txt)  `uniq` → [testdata/alpacacorr7.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/alpacacorr7.txt)

The corrected genes of the Old World camels were also acquired in this way. The genes obtained from the three Old World camels were intersected and the genes obtained from alpaca were removed. → [testdata/cam-alpc.txt](https://github.com/XGuo001l/Inactivated-gene/blob/main/testdata/cam-alpc.txt).



- ##### Extract the sequence of the gene obtained

PseudoChecker's prediction of gene inactivation requires the CDS and exon sequences of the reference species and the sequences of the target species containing the genes to be tested.  The steps are as follows:

1. [scripts/step7-extractCDS.pl ](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step7-extractCDS.pl) → alpacaCDS.bed  #Extract  the CDS annotation information of filtered gene.
2. [scripts/step8-alpccds.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step8-alpccds.pl) → alpcdsrna1.txt #Extract RNAID.
3. [scripts/step9-extractloci.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step9-extractloci.pl) and  [scripts/step9-producebed.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step9-producebed.pl) → bacdroferalgullvi1.bed  #The annotation information of filtered genes was extracted. In the sample file are the resulting comments for Bactrian camels.
4. `bedtools getfasta -fi Yangtuo_llama_genomic.fna -bed bacdroferalgullvi1.bed -s -fo lgcambac.fa  ` Sequences were obtained by `bedtools getfasta`
5. [scripts/step10-indexgene.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step10-indexgene.pl) → lgcambacindex.fa #Add a gene name to each sequence.
6. [scripts/step11-geneallspec.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step11-geneallspec.pl) and [scripts/step11-transuc.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step11-transuc.pl) →  <u>genename</u>.fass #Each gene is generated into a single file containing the gene sequence of each species, and the sequence case was converted.
7. [scripts/step12-extractexonloci.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step12-extractexonloci.pl) → alpcexon.bed #Extract the exon annotation of alpaca.
8. [scripts/step13-transexontitle.pl](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step13-transexontitle.pl) #Generate a bed file for each gene and isoform.
9. [scripts/step14-getalpcfst.sh](https://github.com/XGuo001l/Inactivated-gene/blob/main/scripts/step14-getalpcfst.sh) #Get exon sequences in batches.



- ##### Inactivation predictions by PseudoChecker 

Inactivation predictions were made using [PseudoChecker software](http://pseudochecker.
ciimar.up.pt.) by submission of  target species sequences (all camelidae except alpaca) of each gene and the CDS and exon sequences of the gene in alpaca.



 





