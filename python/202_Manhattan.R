
library("ggplot2")
library("adegenet")
library("ade")
library("qqman")

setwd("C:\\Users\\KU\\Desktop\\AGB\\Ryan\\projects\\004-GWAS-ELEPHANT")
results = read.table("data/plink/200/fisher.assoc.fisher-v2", T)
to_plot = subset(results, select=c(SNP, CHR, BP, P))

manhattan(to_plot)

qqline(to_plot)
