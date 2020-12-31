
#choosing the data source file
mydata <- read.csv(file.choose())

install.packages("ggplot2")

#[mydata$carat<1,]
#to emphasis on specific data


ggplot(data=mydata[mydata$carat<2.5,],
       aes(x=carat, y=price, color=clarity)) +
  geom_point(alpha=0.1) +
#  geom_smooth()
  #geom_line(position = 'jitter')
  stat_smooth()

