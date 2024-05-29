
setwd("C:\\Users\\KU\\Desktop\\AGB\\Ryan\\projects\\004-GWAS-ELEPHANT")

install.packages("CMplot")

library("CMplot")

data = read.table("data/plink/200/fisher.assoc.fisher-v2", T)
data_trim = subset(data, select=c(SNP, CHR, P))
CMplot(data_trim,type="p",plot.type="d",bin.size=1e6,chr.den.col=c("darkgreen", "yellow", "red"),file="jpg",file.name="",dpi=300,
       main="Sex.Fst",file.output=TRUE,verbose=TRUE,width=9,height=6)

CMplot(data_trim, plot.type="m", LOG10=TRUE, ylim=NULL, threshold=c(1e-6,1e-4),threshold.lty=c(1,2),
       threshold.lwd=c(1,1), threshold.col=c("black","grey"), amplify=TRUE,bin.size=1e6,
       chr.den.col=c("darkgreen", "yellow", "red"),signal.col=c("red","green"),signal.cex=c(1.5,1.5),
       signal.pch=c(19,19),file="jpg",file.name="",dpi=300,file.output=TRUE,verbose=TRUE,
       width=14,height=6)


# 


data <- read.delim("sex_Fst.txt", header = TRUE, sep = "\t")

## out put name will be the same w/ last column of input file

head(data)

CMplot(data,type="p",plot.type="d",bin.size=1e6,chr.den.col=c("darkgreen", "yellow", "red"),file="jpg",file.name="",dpi=300,
       main="Sex.Fst",file.output=TRUE,verbose=TRUE,width=9,height=6)

CMplot(data, plot.type="m", LOG10=TRUE, ylim=NULL, threshold=c(1e-6,1e-4),threshold.lty=c(1,2),
       threshold.lwd=c(1,1), threshold.col=c("black","grey"), amplify=TRUE,bin.size=1e6,
       chr.den.col=c("darkgreen", "yellow", "red"),signal.col=c("red","green"),signal.cex=c(1.5,1.5),
       signal.pch=c(19,19),file="jpg",file.name="",dpi=300,file.output=TRUE,verbose=TRUE,
       width=14,height=6)
