##RF_Variance_Analysis
##use ggplot2

n_trees<- c(25,
            50,
            100,
            200,
            400,
            800)

accuracy<-c (0.98375,
            0.992916667,
            0.995833333,
            0.99875,
            0.998333333,
            1)

variance<-c(0.000260237,
            0.000104346,
            6.82471E-05,
            2.53233E-05,
            1.86782E-05,
            0)

data<-data.frame(n_trees,accuracy,variance)

p1<-ggplot(data, aes(x=n_trees, y=accuracy)) +
  x++ ## change color, size, etc as needed
  geom_point()+
  labs (title= "Random Forest Accuracy by n_tress",x="n_tress",y="Average Classifier Validation Accuracy (%)") +theme_classic() #add theme here as desired
p1

p2<-ggplot(data, aes(x=n_trees, y=variance)) +
  geom_line(color="blue",size=1.2)+ 
  geom_point()+
  labs (title= "Random Forest Variance by n_tress",x="n_tress",y="Average Classifier Validation Variance (%)") +theme_classic()
p2

pdffile <- "Matt_3.pdf"
pdf(paste(pdffile,sep=""), paper="letter", width=8, height=6)
multiplot(p1,p2)
dev.off()

