
x<- c(1,2,3,4,5)
y<- c(2,3,4,1)

z<-x/y
z

#########

x<-rnorm(5)
x

#R-specific

for(i in x)
  print(i)

#conventional
for(j in 1:5)
  print(x[j])

##---------Vectorized vs devectorized----------------##

n<- 100
a<- rnorm(n)
b<- rnorm(n)

#vectorized---- much faster!!!
#shorter
#same type in a vector-single time declaration
c<- a*b
c

#devectorized----slower
#longer
#multiple times delegation
d<- rep(NA,n)

for(i in 1:n)
  {
    d[i]<- a[i]*b[i]
    print(d[i])
}
  
#reson: high level lang and have low level languages working 
#for itseld. AS A WRAPPER!!