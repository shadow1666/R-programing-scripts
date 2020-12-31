

## Section 6

library(ggplot2)

moviedata <- read.csv(file.choose())
head(moviedata)

summary(moviedata)
str(moviedata)

g<-moviedata[(moviedata$Genre== "action") | (moviedata$Genre== "adventure")|(moviedata$Genre== "animation")|(moviedata$Genre== "comedy")|(moviedata$Genre== "drama"),]
g<-g[(g$Studio=="Buena Vista Studios")|(g$Studio=="Paramount Pictures")|(g$Studio=="Fox")|(g$Studio=="Sony")|(g$Studio=="Universal")|(g$Studio=="WB"),]
g
?colname
colnames(moviedata)<- c("Day","Director","Genre","Title","ReleaseDate","Studio","AdjustedGross","Budget","Gross","IMDB","MovieLens","Overseas","Overseas%","Profit","Profit%","Runtime","US","Gross%")

f <- ggplot(data = g, aes(x=Genre, y=`Gross%`))
f +  geom_jitter(aes(color=Studio, size=Budget)) + geom_boxplot(alpha=0.8, outlier.colour = NA) +
  ggtitle("Domestic Gross % by Genre")+
  theme(plot.title = element_text(hjust=0.5, size= 20,colour = "Black"),
        axis.title = element_text(size = 20,color="Blue"))


##insights

h<- ggplot(data = moviedata, aes(x=Day)) 
h + geom_bar()

?ggtitle
?geom_boxplot
