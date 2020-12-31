#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)
month<- c('January','February', 'March','April','May','June','July','August','September','October','November','December')
#Solution

#profit/month
a1<- revenue-expenses

#profit after tax: 30%

a2<-round(0.7*a1,2)

#profit margin/month

a3<- round((a2/revenue),2)*100

#good months
x<- mean(a1)
g<-0
for(i in 1:12)
  if(a2[i]>x)
  {
    print(month[i])
    g<-i
    }

#bad months

b<-0
for(i in 1:12)
  if(a2[i]<x)
  {
    print(month[i])
    b<-i
    }

#Best month
m1<-max(a2)
c<-0

for(i in 1:12)
  if(a2[i]==m1)
    {
      print(month[i])
      c<-i
    }
    
#Worst month
m2<- min(a2)
c2<-0
for(i in 1:12)
  if(a2[i]==m2)
    {
      print(month[i])
      c2<-i
    }

    
# 1000 units
revenue1<-round(revenue/1000)
expenses1<-round(expenses/1000)
a1<-round(a1/1000)
a2<-round(a2/1000)
a2<-round(a2/1000)


#matrix:
M<-rbind(
  revenue1,
  expenses1,
  a1,
  a2,
  a3,
  g,
  b,
  c,
  c2
)

M
