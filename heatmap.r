library("pheatmap")
PAgetwd()
setwd("D:/heatmap") 
library(readxl)
y <- read_excel("64-Neg-Dar-SCC_S42_L001_R1_001 (GE).xlsx",sheet = "Sheet7")
head(y)
#change row name of the dataset


x = y[,2:4]
#if we have zero among numbers of the dataset, we should write --> y = log2(y+1)
x
x = log2(x+1)
rownames(x) <- y$Gene

rownames(x)#save the heatmap
pdf("Negin.pdf")
#heatmap with correlation between columns and rows for showing relationship between them:

#Italic fonts:
newnames <- lapply(
  rownames(x),
  function(x) bquote(italic(.(x))))

pheatmap(x,fontsize_row = 15, fontsize = 15, fontsize_col = 15,show_colnames = TRUE,cellwidth=20,
         show_rownames = TRUE,angle_col=90,display_numbers=FALSE,legend= TRUE,cellheight = 20,
         cluster_rows = F,cluster_cols = F, clustering_distance_rows = "correlation",
         clustering_distance_cols = "correlation",labels_row = as.expression(newnames))
dev.off()
#getwd()
#?pheatmap

