devtools::install_github("sergihervas/iMKT")

library(iMKT)
library(reshape2)
head(myDafData)
myDivergenceData
standardMKT(myDafData, myDivergenceData)
myDafData
FWW(myDafData, myDivergenceData,listCutoffs=c(0.05, 0.15,0.25,0.35), plot=TRUE)

n0divertest<- read.table("~/mkt/diverallgen/ABCC2.nstxt",sep="\t",header = T)
n0poly <- read.table("~/mkt/genedaf/ABCC2.txt",sep="\t",header = T)

DGRP(n0poly, n0divertest,listCutoffs=0.05,  plot=FALSE)
FWW(n0poly, n0divertest,listCutoffs=0.05, plot=FALSE)
standardMKT(n0poly, n0divertest)
newstandardMKT(n0poly, n0divertest)$`Fishers exact test P-value`
fwwtest  <- FWW(n0poly, n0divertest,listCutoffs=c(0.05, 0.15,0.25,0.35), plot=FALSE)
for (j in 1:length(standard)) {
  write.table(standard[[j]], paste0("~/mkt/results1/",i,".txt"), append = T)
}


standard <- standardMKT(n0poly, n0divertest)
sink("n0standard.txt") 
standardMKT(n0poly, n0divertest)
sink()

#fww
n0mktgene <- read.table("~/mkt/0dafdiver.txt",sep="\t",header = T)
for (i in n0mktgene$gene) {
  n0diver <- read.table(paste0("~/mkt/diverallgen/",i,".nstxt"),sep="\t",header = T)
  n0daf <- read.table(paste0("~/mkt/genedaf/",i,".txt"),sep="\t",header = T)

FWW1 <-   FWW(n0daf, n0diver,listCutoffs=0.05,  plot=FALSE)

 for (j in 1:length(FWW1)) {
   write.table(FWW1[[j]], paste0("~/mkt/fww/",i,".txt"), append = T)
  }
  
}
#emkt
for (i in n0mktgene$gene) {
  n0diver <- read.table(paste0("~/mkt/diverallgen/",i,".nstxt"),sep="\t",header = T)
  n0daf <- read.table(paste0("~/mkt/genedaf/",i,".txt"),sep="\t",header = T)
  
  emkt <-   DGRP(n0daf, n0diver,listCutoffs=0.05,  plot=FALSE)
  
  for (j in 1:length(emkt)) {
    write.table(emkt[[j]], paste0("~/mkt/emkt/",i,".txt"), append = T)
  }
  
}

#standard
for (i in n0mktgene$gene) {
  n0diver <- read.table(paste0("~/mkt/diverallgen/",i,".nstxt"),sep="\t",header = T)
  n0daf <- read.table(paste0("~/mkt/genedaf/",i,".txt"),sep="\t",header = T)
  
  stan <-   standardMKT(n0daf, n0diver)
  
  for (j in 1:length(stan)) {
    write.table(stan[[j]], paste0("~/mkt/standard/",i,".txt"), append = T)
  }
  
}


#number1 <- (1,2,5,78)
#for(i in number1 ){

n0divername <- paste0("~/mkt/genedaf/",i,".txt")}




temp = list(x = data.frame(a = "a", b = "b", c = "c"),
            y = data.frame(d = "d", e = "e", f = "f"),
            z = data.frame(g = "g", h = "h", i = "i"))

#for (i in 1:length(standard)) {
  write.table(standard[[i]], "temp1.csv", append = T)
}



#newstandard
newstandardMKT <- function (daf, divergence) 
{
  check <- checkInput(daf, divergence, 0, 1)
  if (check$data == FALSE) {
    stop(check$print_errors)
  }
  output <- data.frame(alpha = numeric(0), pvalue = integer(0))
  mkt_table <- data.frame(Polymorphism = c(sum(daf$P0), sum(daf$Pi)), 
                          Divergence = c(divergence$D0, divergence$Di), row.names = c("Neutral class", 
                                                                                      "Selected class"))
  alpha <- 1 - (mkt_table[2, 1]/mkt_table[1, 1]) * (mkt_table[1, 
                                                              2]/mkt_table[2, 2])
  pvalue <- fisher.test(mkt_table,alternative = "greater")$p.value
  Ka <- divergence$Di/divergence$mi
  Ks <- divergence$D0/divergence$m0
  omega <- Ka/Ks
  omegaA <- omega * alpha
  omegaD <- omega - omegaA
  divergence_metrics <- data.frame(Ka, Ks, omega, omegaA, omegaD)
  output <- list(alpha.symbol = alpha, `Fishers exact test P-value` = pvalue, 
                 `MKT table` = mkt_table, `Divergence metrics` = divergence_metrics)
  return(output)
}

for (i in n0mktgene$gene) {
  n0diver <- read.table(paste0("~/mkt/diverallgen/",i,".nstxt"),sep="\t",header = T)
  n0daf <- read.table(paste0("~/mkt/genedaf/",i,".txt"),sep="\t",header = T)
  
  newstan <-   newstandardMKT(n0daf, n0diver)
  
  for (j in 1:length(newstan)) {
    write.table(newstan[[j]], paste0("~/mkt/newstandard/",i,".txt"), append = T)
  }
}

#new fww
newfww <- function (daf, divergence, listCutoffs = c(0, 0.05, 0.1), plot = FALSE) 
{
  check <- checkInput(daf, divergence, 0, 1)
  if (check$data == FALSE) {
    stop(check$print_errors)
  }
  output <- list()
  mkt_tables <- list()
  div_metrics <- list()
  div_cutoff <- list()
  Ka <- divergence$Di/divergence$mi
  Ks <- divergence$D0/divergence$m0
  omega <- Ka/Ks
  div_table <- data.frame(Ka, Ks, omega)
  names(div_table) <- c("Ka", "Ks", "omega")
  for (cutoff in listCutoffs) {
    daf_remove <- daf[daf$daf > cutoff, ]
    mkt_table <- data.frame(Polymorphism = c(sum(daf_remove$P0), 
                                             sum(daf_remove$Pi)), Divergence = c(divergence$D0, 
                                                                                 divergence$Di), row.names = c("Neutral class", 
                                                                                                               "Selected class"))
    alpha <- 1 - (mkt_table[2, 1]/mkt_table[1, 1]) * (mkt_table[1, 
                                                                2]/mkt_table[2, 2])
    pvalue <- fisher.test(mkt_table,alternative = "greater")$p.value
    omegaA <- omega * alpha
    omegaD <- omega - omegaA
    output[[paste("Cutoff = ", cutoff)]] <- c(cutoff, 
                                              alpha, pvalue)
    div_cutoff[[paste("Cutoff = ", cutoff)]] <- c(cutoff, 
                                                  omegaA, omegaD)
    mkt_tables[[paste("Cutoff = ", cutoff)]] <- mkt_table
  }
  output <- as.data.frame(do.call("rbind", output))
  colnames(output) <- c("cutoff", "alpha", "pvalue")
  div_cutoff <- as.data.frame(do.call("rbind", div_cutoff))
  names(div_cutoff) <- c("cutoff", "omegaA", "omegaD")
  if (plot == TRUE) {
    plot <- ggplot(output, aes(x = as.factor(cutoff), y = alpha, 
                               group = 1)) + geom_line(color = "#386cb0") + 
      geom_point(size = 2.5, color = "#386cb0") + 
      themePublication() + xlab("Cut-off") + ylab(expression(bold(paste("Adaptation (", 
                                                                        alpha, ")"))))
    output <- output[, c(2, 3)]
    names(output) <- c("alpha.symbol", "Fishers exact test P-value")
    div_cutoff <- div_cutoff[, c(2, 3)]
    colnames(div_cutoff) <- c("omegaA.symbol", "omegaD.symbol")
    div_metrics <- list(div_table, div_cutoff)
    names(div_metrics) <- c("Global metrics", "Estimates by cutoff")
    list_output <- list(output, plot, div_metrics, mkt_tables)
    names(list_output) <- c("Results", "Graph", 
                            "Divergence metrics", "MKT tables")
  }
  else if (plot == FALSE) {
    output <- output[, c(2, 3)]
    names(output) <- c("alpha.symbol", "Fishers exact test P-value")
    div_cutoff <- div_cutoff[, c(2, 3)]
    colnames(div_cutoff) <- c("omegaA.symbol", "omegaD.symbol")
    div_metrics <- list(div_table, div_cutoff)
    names(div_metrics) <- c("Global metrics", "Estimates by cutoff")
    list_output <- list(output, div_metrics, mkt_tables)
    names(list_output) <- c("Results", "Divergence metrics", 
                            "MKT tables")
  }
  return(list_output)
}

for (i in n0mktgene$gene) {
  n0diver <- read.table(paste0("~/mkt/diverallgen/",i,".nstxt"),sep="\t",header = T)
  n0daf <- read.table(paste0("~/mkt/genedaf/",i,".txt"),sep="\t",header = T)
  
  newfww1 <-   newfww(n0daf, n0diver,listCutoffs=0.05,  plot=FALSE)
  
  for (j in 1:length(newfww1)) {
    write.table(newfww1[[j]], paste0("~/mkt/newfww/",i,".txt"), append = T)
  }
}

#new emkt
newDGRP <- function (daf, divergence, listCutoffs = c(0, 0.05, 0.1), plot = FALSE) 
{
  check <- checkInput(daf, divergence, 0, 1)
  if (check$data == FALSE) {
    stop(check$print_errors)
  }
  output <- list()
  mkt_tables <- list()
  fractions <- data.frame(row.names = c("d", "f", 
                                        "b"))
  div_metrics <- list()
  div_cutoff <- list()
  Ka <- divergence$Di/divergence$mi
  Ks <- divergence$D0/divergence$m0
  omega <- Ka/Ks
  div_table <- data.frame(Ka, Ks, omega)
  names(div_table) <- c("Ka", "Ks", "omega")
  for (cutoff in listCutoffs) {
    daf_below_cutoff <- daf[daf$daf <= cutoff, ]
    daf_above_cutoff <- daf[daf$daf > cutoff, ]
    P0 <- sum(daf$P0)
    Pi <- sum(daf$Pi)
    mkt_table_standard <- data.frame(Polymorphism = c(sum(daf$P0), 
                                                      sum(daf$Pi)), Divergence = c(divergence$D0, divergence$Di), 
                                     row.names = c("Neutral class", "Selected class"))
    mkt_table <- data.frame(`DAF below cutoff` = c(sum(daf_below_cutoff$P0), 
                                                   sum(daf_below_cutoff$Pi)), `DAF above cutoff` = c(sum(daf_above_cutoff$P0), 
                                                                                                     sum(daf_above_cutoff$Pi)), row.names = c("Neutral class", 
                                                                                                                                              "Selected class"))
    f_neutral <- mkt_table[1, 1]/sum(daf$P0)
    Pi_neutral_below_cutoff <- Pi * f_neutral
    Pi_wd <- mkt_table[2, 1] - Pi_neutral_below_cutoff
    Pi_neutral <- round(Pi_neutral_below_cutoff + mkt_table[2, 
                                                            2])
    alpha <- 1 - ((Pi_neutral/P0) * (mkt_table_standard[1, 
                                                        2]/mkt_table_standard[2, 2]))
    b <- (Pi_wd/P0) * (divergence$m0/divergence$mi)
    f <- (divergence$m0 * Pi_neutral)/(as.numeric(divergence$mi) * 
                                         as.numeric(P0))
    d <- 1 - (f + b)
    m <- matrix(c(P0, Pi_neutral, divergence$D0, divergence$Di), 
                ncol = 2)
    pvalue <- fisher.test(m,alternative = "greater")$p.value
    omegaA <- omega * alpha
    omegaD <- omega - omegaA
    fraction <- data.frame(c(d, f, b))
    names(fraction) <- cutoff
    fractions <- cbind(fractions, fraction)
    output[[paste("Cutoff = ", cutoff)]] <- c(cutoff, 
                                              alpha, pvalue)
    div_cutoff[[paste("Cutoff = ", cutoff)]] <- c(cutoff, 
                                                  omegaA, omegaD)
    mkt_tables[[paste("Number of segregating sites by DAF category - Cutoff = ", 
                      cutoff)]] <- mkt_table
  }
  mkt_tables[[paste("MKT standard table")]] <- mkt_table_standard
  output <- as.data.frame(do.call("rbind", output))
  colnames(output) <- c("cutoff", "alpha", "pvalue")
  div_cutoff <- as.data.frame(do.call("rbind", div_cutoff))
  names(div_cutoff) <- c("cutoff", "omegaA", "omegaD")
  if (plot == TRUE) {
    plot <- ggplot(output, aes(x = as.factor(cutoff), y = alpha, 
                               group = 1)) + geom_line(color = "#386cb0") + 
      geom_point(size = 2.5, color = "#386cb0") + 
      themePublication() + xlab("Cut-off") + ylab(expression(bold(paste("Adaptation (", 
                                                                        alpha, ")"))))
    output <- output[, c(2, 3)]
    names(output) <- c("alpha.symbol", "Fishers exact test P-value")
    div_cutoff <- div_cutoff[, c(2, 3)]
    colnames(div_cutoff) <- c("omegaA.symbol", "omegaD.symbol")
    div_metrics <- list(div_table, div_cutoff)
    names(div_metrics) <- c("Global metrics", "Estimates by cutoff")
    fractions_melt <- melt(fractions, id.vars = NULL)
    fractions_melt$Fraction <- rep(c("d", "f", 
                                     "b"), length(fractions_melt$variable)/3)
    plotfraction <- ggplot(fractions_melt) + geom_bar(stat = "identity", 
                                                      aes_string(x = "variable", y = "value", 
                                                                 fill = "Fraction"), color = "black") + 
      coord_flip() + themePublication() + ylab(label = "Fraction") + 
      xlab(label = "Cut-off") + scale_fill_manual(values = c("#386cb0", 
                                                             "#fdb462", "#7fc97f", "#ef3b2c", 
                                                             "#662506", "#a6cee3", "#fb9a99", 
                                                             "#984ea3", "#ffff33"), breaks = c("f", 
                                                                                               "d", "b"), labels = c(expression(italic("f")), 
                                                                                                                     expression(italic("d")), expression(italic("b")))) + 
      theme(axis.line = element_blank()) + scale_y_discrete(limit = seq(0, 
                                                                        1, 0.25), expand = c(0, 0))
    plot <- plot_grid(plot, plotfraction, nrow = 2, labels = c("A", 
                                                               "B"), rel_heights = c(2, 1))
    list_output <- list(output, plot, div_metrics, mkt_tables, 
                        fractions)
    names(list_output) <- c("Results", "Graph", 
                            "Divergence metrics", "MKT tables", "Fractions")
  }
  else if (plot == FALSE) {
    output <- output[, c(2, 3)]
    names(output) <- c("alpha.symbol", "Fishers exact test P-value")
    div_cutoff <- div_cutoff[, c(2, 3)]
    colnames(div_cutoff) <- c("omegaA.symbol", "omegaD.symbol")
    div_metrics <- list(div_table, div_cutoff)
    names(div_metrics) <- c("Global metrics", "Estimates by cutoff")
    fractions_melt <- melt(fractions, id.vars = NULL)
    fractions_melt$Fraction <- rep(c("d", "f", 
                                     "b"), length(fractions_melt$variable)/3)
    list_output <- list(output, div_metrics, mkt_tables, 
                        fractions)
    names(list_output) <- c("Results", "Divergence metrics", 
                            "MKT tables", "Fractions")
  }
  return(list_output)
}
for (i in n0mktgene$gene) {
  n0diver <- read.table(paste0("~/mkt/diverallgen/",i,".nstxt"),sep="\t",header = T)
  n0daf <- read.table(paste0("~/mkt/genedaf/",i,".txt"),sep="\t",header = T)
  
  newemkt <-   newDGRP(n0daf, n0diver,listCutoffs=0.05,  plot=FALSE)
  
  for (j in 1:length(newemkt)) {
    write.table(newemkt[[j]], paste0("~/mkt/newemkt/",i,".txt"), append = T)
  }
  
}


#padj
newstand <- read.table("~/newstanpadj.txt",sep="\t",header = T)
newstandpadj <- p.adjust(newstand$pval,method = "BH",n=4206)
newstandpadj <- as.data.frame(newstandpadj)   
write.table(newstandpadj$newstandpadj,file = "newstandpadj.txt")

newfww1 <- read.table("~/newstanpadj.txt",sep="\t",header = T)
newfww1padj <- p.adjust(newfww1$pval,method = "BH",n=4206)
newfww1padj <- as.data.frame(newfww1padj)   
write.table(newfww1padj$newfww1padj,file = "newfww1padj.txt")

newwmkt <- read.table("~/newstanpadj.txt",sep="\t",header = T)
newemkt1padj <- p.adjust(newwmkt$pval,method = "BH",n=4206)
newemktpadj <- as.data.frame(newemkt1padj)   
write.table(newemktpadj$newemkt1padj,file = "newemktpadj.txt")




