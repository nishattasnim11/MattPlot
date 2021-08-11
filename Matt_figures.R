library ("ggplot2","ggpubr","readxl")
setwd("~/Desktop")

#import excel and csv data
MEResponse <- read_excel("~/Desktop/MEResponse.xlsx")
pca_train <- read.csv("~/Downloads/pca_train.csv")
pca_test <- read.csv("~/Downloads/pca_test.csv")
lda_train <- read.csv("~/Downloads/lda_train.csv")
lda_test <- read.csv("~/Downloads/lda_test.csv")

##methane ethane response
##MEResponse$Gas<-as.factor(MEResponse$Gas)
##subdf<-subset(MEResponse, MEResponse$Gas=="Methane")

##plotboi<-ggplot(MEResponse,aes(x=MEResponse$Time,y=MEResponse$Response, color=MEResponse$Gas))
##plotboi<-plotboi+geom_smooth( size=1.2)+ labs(x= "Time (s)", y="Sensor Response (V)")+theme_classic()
##plotboi<-plotboi+ theme(legend.title = element_blank())
##plotboi<- plotboi+ guides(color=guide_legend(reverse=TRUE))


##plotboi2<-ggplot(subdf,aes(x=subdf$Time,y=subdf$Response, color=subdf$Gas))
##plotboi2<-plotboi2+geom_smooth( size=1.2)+ labs(x= "Time (s)", y="Sensor Response (V)")+theme_classic()
##plotboi2<-plotboi2+ theme(legend.title = element_blank())


##Scatter plots
##PCA
pca_train$Label<-as.factor(pca_train$Label)
PCAT<-ggplot(pca_train, aes(x=pca_train$First.PCA.Component,y=pca_train$Second.PCA.Component,color=pca_train$Label))
PCAT<-PCAT+ geom_point(aes(shape=pca_train$Label))+labs(x="PCA 1", y="PCA 2")
print(PCAT)

pca_test$Label<-as.factor(pca_test$Label)
PCATest<-ggplot(pca_test, aes(x=pca_test$First.PCA.Component,y=pca_test$Second.PCA.Component,color=pca_test$Label))
PCATest<-PCATest+ geom_point(aes(shape=pca_test$Label))+labs(x="PCA 1", y="PCA 2")
print(PCATest)


##LDA
lda_train$Label<-as.factor(lda_train$Label)
LDAT<-ggplot(lda_train, aes(x=First.LDA.Component,y=Second.LDA.Component,color=Label))
LDAT<-LDAT+ geom_point(aes(shape=lda_train$Label))+labs(x="LDA 1", y="LDA 2")
print(LDAT)

lda_test$Label<-as.factor(lda_test$Label)
LDATest<-ggplot(lda_test, aes(x=lda_test$First.LDA.Component,y=lda_test$Second.LDA.Component,color=lda_test$Label))
LDATest<-LDATest+ geom_point(aes(shape=lda_test$Label))+labs(x="LDA 1", y="LDA 2")
print(LDATest)

##arrange scatter plots

##fig1<-ggarrange(plotboi2,plotboi, labels=c("A","B"), ncol = 1, nrow = 2, legend = "right")
##fig1
figure<-ggarrange(PCAT,PCATest,LDAT,LDATest, labels=c("A","B","C","D"), ncol=2, nrow = 2, common.legend = TRUE, legend = "right")
figure

##save as pdf
pdffile <- "ME_1.pdf"
pdf(paste(pdffile,sep=""), paper="letter", width=8, height=6)
plotboi
dev.off()

ggexport(figure, filename = "MattFigure1.pdf")