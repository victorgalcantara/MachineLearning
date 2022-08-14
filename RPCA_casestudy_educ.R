# RPCA with Brazilian education database ----
# Author: Victor G Alcantara (USP)
# Github: https://github.com/victorgalcantara
# Lattes: http://lattes.cnpq.br/6579920249803712
# Date: 11.08.22  Last update: 11.08.2022

# 0. Packages and setup ----
#install.packages("pacman")
library(pacman)
p_load("rio","tidyverse","psych","corrplot","readxl")

# 1. Opening the data ----
mydata <- import(file.choose())

# 2. Data management ----
d <- mydata %>% select(fluxo,me_pr,me_ce,me_ep,me_estr,
                       n_alunos,s_equip,so_trab)

# Replace comma to dot
rmComma <- function (x) {
  x <- str_replace_all(x,",",".")
  as.numeric(x)
  }

d <- d %>% mutate(.,
                  me_pr = rmComma(me_pr),
                  me_ce = rmComma(me_ce),
                  me_ep = rmComma(me_ep),
                  me_estr = rmComma(me_estr),
                  s_equip = rmComma(s_equip)
                  )
# Characteristics
str(d)

#scatterplot
pairs(d, pch = 19, lower.panel = NULL) 

correlation <- cor(d)
par(oma = c(2, 2, 2, 2)) # space around for text
corrplot.mixed(correlation, 
               order = "hclust", #order of variables
               tl.pos = "lt", #text left + top
               upper = "ellipse")

#Correlation matrix
round(correlation, 3)

#Bartlett test and KMO
#Input is the correlation matrix
cortest.bartlett(correlation)
KMO(correlation)

#Extraction and number of components
# Scale the data
dataZ <- scale(d)
# Assume the number of components (nfactors) = number of variables, i.e., D = 10,
# Always a unrotated extraction
pc10 <- principal(dataZ, nfactors=8, rotate="none", scores=TRUE)  

#The output is a list object that contains too much information 
#pc10

#Eigenvalues - Variances of the principal components 
round(pc10$values,3)

#Screeplot - Find the elbow
plot(pc10$values, type = "b", main = "Scree plot for Decathlon dataset",
     xlab = "Number of PC", ylab = "Eigenvalue")   

# Eigenvectors - component loadings
# Each value is the correlation between original variable and component,
# It can be thought as the contribution of each original variable to the component (when squared)
# It summarizes the explained variance too.
pc10$loadings

#Communalities - Sure it's 1! why?
pc10$communality

#Let's extract a 2 component solution
pc2 <- principal(dataZ, nfactors=2, rotate="none")
pc2

#Let's rotate the 2 components using varimax
pc2r <- principal(dataZ, nfactors=2, rotate="varimax")
pc2r$loadings

round(pc2r$communality,2)

#Let's extract a 3 component solution
pc3 <- principal(dataZ, nfactors=3, rotate="none")
pc3

#Let's rotate the 3 components using varimax
pc3r <- principal(dataZ, nfactors=3, rotate="varimax")
pc3r$loadings

round(pc3r$communality,2)

#Compute the scores
pc3sc <- principal(dataZ, nfactors=3, rotate="none", scores=TRUE)  
round(pc3sc$scores,3)
mean(pc3sc$scores[,1])
sd(pc3sc$scores[,1])

#Add scores to the data set as new variables
dataset$pc1 <- pc3sc$scores[,1]
dataset$pc2 <- pc3sc$scores[,2]
dataset$pc3 <- pc3sc$scores[,3]

#Save the new data set in excel format
setwd("C:\\2\\")
write.xlsx(dataset, file = "NewDecathlon.xlsx", sheetName = "PCAscores", 
           col.names = TRUE, row.names = TRUE, append = FALSE)

#Depict the scatterplot of PC1 vs PC2
plot(dataset$pc1, dataset$pc2, pch = 19,xlim = c(-2,3), ylim = c(-3,2),
     xlab="PC1", ylab="PC2", main = "Scores: PC1 vs Pc2")
text(dataset$pc1, dataset$pc2-0.1, dataset[,2]) #(x,y,labels)

#Depict the scatterplot of Points vs PC1
range(dataset$Points)
plot(dataset$Points,dataset$pc1, pch = 19,xlim = c(6500,9100), ylim = c(-3,2),
     xlab="Total Points", ylab="PC1 Score", main = "Total Points vs PC1 score")
text(dataset$Points, dataset$pc1-0.1, dataset[,2]) #(x,y,labels)

#Compute correlation: Points vs PC1
cor(dataset$Points,dataset$pc1)