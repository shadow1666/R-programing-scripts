
#Law of large numbers
install.packages("ggplot2")
a <- 0
n <- 100
c <- 0

for(i in rnorm(n))
{
  
  if(i > -1 & i < 1)
  { 
    c <- c+1
  }
}
a <- c/n
a


