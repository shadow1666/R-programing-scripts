
#matrix
?matrix

a<-c(1,2,3,4)

is.matrix(Points)
as.matrix(a)

matrix(M,2,2,0)

#rbind ---- character
r1<-c("Hi","!")
r2<-c("How","are")
r3<-c(1,2)

R<-rbind(r1,r2,r3)
cbind(r1,r2,r3)

matrix(R,3,2,0)

#cbind()

c1<-c(1:6)
c2<-c(-1:-6)

rbind(c1,c2)
cbind(c1,c2)


#custom
a<-c('a','b','b','c')
b<-c(1,2,3,4)
v<-rbind(b,b)

row.names(v)<-b
colnames(v)<-a
v

