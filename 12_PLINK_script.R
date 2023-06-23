setwd("C:/Users/asus/Desktop/man/")

#install.packages("CMplot")

library("CMplot")

data <- read.delim("hair_Fst.txt", header = TRUE, sep = "\t")

## out put name will be the same w/ last column

head(data)

CMplot(data,type="p",plot.type="d",bin.size=1e6,chr.den.col=c("darkgreen", "yellow", "red"),file="jpg",file.name="",dpi=300,
       main="Hair",file.output=TRUE,verbose=TRUE,width=9,height=6)

CMplot(data, plot.type="m", LOG10=TRUE, ylim=NULL, threshold=c(1e-6,1e-4),threshold.lty=c(1,2),
       threshold.lwd=c(1,1), threshold.col=c("black","grey"), amplify=TRUE,bin.size=1e6,
       chr.den.col=c("darkgreen", "yellow", "red"),signal.col=c("red","green"),signal.cex=c(1.5,1.5),
       signal.pch=c(19,19),file="jpg",file.name="",dpi=300,file.output=TRUE,verbose=TRUE,
       width=14,height=6)
