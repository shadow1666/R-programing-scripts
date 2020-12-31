
#---Data frames-----
# objects!

#similar to matrices-where same datatype
#but in data frames, you can have multiple data types.

#demographics project

?read.csv()

#step 1
stats<-read.csv(file.choose())

#step 2 //from working directory
getwd()
setwd("D:\\Work\\R\\Datasets")
rm(stats)
stats<-read.csv("DemographicData.csv")
stats

#-----------Exploring data--------------
# common functions

nrow(stats)
ncol(stats)
head(stats) #top 6 rows with col names  <TOP>
tail(stats) #bottom 6 rows            <TAIL>

head(stats,n=10)

str(stats) #structure of dataset---different from other languages!! string

runif(stats) # random numbers distributed uniformly --- (r - unif) NOT (run - if)

summary(stats) #breakdown of range values 

#---------------- Using $ sign ---------------------

head(stats)
stats[3,]

#named objects
stats[4, "Country.Code"]

stats["Angola",3] # INCORRECT

# $ sign doesn't work for matrices 

stats$Income.Group  # same as stats[,"Income,Groups"] //easier
stats$Country.Code[2]

levels(stats$Income.Group) #need to specify the coloumname

stats1<-stats$Income.Group #single coloumn

levels(stats1) #works fine with single coloumns
levels(stats) #NULL

#-------Basic operations----------------

#1. subsetting

stats[1:10,]
stats[3:7,]
stats[c(4,10),,drop=T]

#--- [] brackets

is.data.frame(stats[,1,drop=F]) #need to add drop> vector!
is.matrix(stats[,1])
is.data.frame(stats[1,]) # no need to add drop > already data frame!
is.vector(stats[,1])
stats[,1,drop=F]

#--- arithematics --

stats$Birth.rate*stats$Internet.users
stats$Birth.rate-stats$Internet.users
round(stats$Birth.rate/stats$Internet.users, digits =2)

?round
#-- add a coloumn ---
head(stats)

stats$newCol <- stats$Birth.rate*stats$Internet.users


# testing!!!
tail(stats)
stats$test <- 1:3 # has to be a multiple of the total entries i.e rows. RECYCLING!
stats$test <- NULL # remove columns 

?data.frame()


#--- Filtering dataframes -----

stats[1,]
head(stats$Internet.users)

filter <- stats$Internet.users <3

stats[filter,] #display for only TRUE values
stats[,"Internet.users"] #named objects

stats[stats$Birth.rate > 40,] #implicitly
stats[stats$Birth.rate > 40 & stats$Internet.users <60,]# Queryyyy
stats[stats$Income.Group == "Low income",]

stats[stats$Country.Name == "Zimbabwe",]

head(stats)




