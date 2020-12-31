

install.packages("ggplot2")

?qplot()
?ggplot()
?diamonds

#to activate a package
library(ggplot2)

#qplot(), ggplot() are now activated

qplot(data=diamonds, carat, price,
      color=clarity, facets=.~clarity)
  #stat_smooth()

  