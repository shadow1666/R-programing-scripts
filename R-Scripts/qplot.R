
#---- Qplot------


stats <- read.csv("DemographicData.csv")
cdwd()
setwd("D:\\Work\\R\\Datasets")
stats

?qplot()
 
library(ggplot2)

install.packages("ggplot2")

# I(): Change the class of an object to indicate that it should be treated 'as is'.
qplot(data = stats, y= Birth.rate , x= Income.Group, size = I(2))

#shows red points >>> I() conversion of as it is
qplot(data = stats, y= Birth.rate , x= Income.Group, size = I(2), color= "blue")

qplot(data = stats, y= Birth.rate , x= Income.Group, size = I(2), color= I("blue"))

qplot(data = stats, y= Birth.rate , x= Income.Group, geom = "boxplot")

      
#size = size of the points
?I()
?geom
 
#---- Visualization--------------
qplot(data = stats, x=Internet.users, y=Birth.rate )

qplot(data = stats, x=Internet.users, y=Birth.rate, size= I(3) )

qplot(data = stats, x=Internet.users, y=Birth.rate, size= I(3), color= I("blue") ) 

#categorize by income group
qplot(data = stats, x=Internet.users, y=Birth.rate, size= I(3), color=Income.Group ) 

#country-wise internet access
qplot(data = stats, x=stats$Country.Name, y=Internet.users, size= I(3), color=Income.Group ) 


