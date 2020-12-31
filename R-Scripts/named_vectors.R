
#named vectors

?names

Sujal<-1:3

names(Sujal)<-c('@','$','#')
names(Sujal)  
 
?clearNames

#-------------------

#naming matrices

v1<-rep(c(1:2),each=3,3)
v1

m2<-matrix(v1,3,6)

rownames(m2)<-c('a','b','c')
