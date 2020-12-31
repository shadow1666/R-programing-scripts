
#---Subsetting-----------


Games[10,] 
  
Games[,4:5]

Games[-2:-9,]

Games[,c("2008","2009")] 

is.matrix(Games[,c("2008","2009")] )
is.matrix(Games[4,])
is.vector(Games[4,])

Games[1,,drop=0]
is.matrix(Games[1,,drop=0])
is.vector(Games[1,,drop=0])


#-----------Visualization of subsets------------

Data<- (MinutesPlayed[1:3,]/Games[1:3,])

matplot(t(Data), type = "b", pch = 15:20, col = c(1:4,5))
legend("bottomleft", legend = Players[1:3], pch=15:20, col = c(1:4,5))

#for single player

Data1<- (MinutesPlayed[1,]/Games[1,])

matplot(Data1, type = "b", pch = 15:20, col = c(1:4,5))
legend("bottomleft", legend = Players[1], pch=15:20, col = c(1:4,5))









