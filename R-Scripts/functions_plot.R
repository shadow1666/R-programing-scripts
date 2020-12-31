
#----Functions-----------

plot<-function(n=10)
{
  Data2<-(FieldGoals[1:n,]/FieldGoalAttempts[1:n,])
  
  matplot(t(Data2), type = "b", pch = 15:18, col = 1:4)
  legend("bottomleft", legend = Players[1:n], pch = 15:18, col = 1:4)
  
  }

plot(2)

 
#-----func adv-------------

plot2<- function(data,n1=1,n2=10)
{
  data3<-data[n1:n2,, drop=F]
  matplot(t(data3), type="b" , pch = 14:18, col = 2:7)
  legend("bottomleft", inset=0.0001, legend = Players[n1:n2],pch = 14:18, col = 2:7 )  
}

plot2(Games)


