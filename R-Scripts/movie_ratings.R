
##---- Movie Reviews ----##

#---- DATA LAYER --------
movies<-read.csv("Movie-Ratings.csv")
head(movies)
levels(movies$Genre)

library(ggplot2)

qplot(data = movies, x= Audience.Ratings.., y= Rotten.Tomatoes.Ratings..,
      color=Genre, size = I(4), alpha=I(0.4), main = "Movie Reviews")

##------ LAYERS -------##

colnames(movies)<-c("Film","Genre","Critic","Audience","Budget(in millions)","Year")

?str() # alternative to summary
str(movies) #check the factors
summary(movies)

# each words is associated with a number and identify the levels
#we want year to be a factor!?
##converting year to a factor.
movies$Year<-factor(movies$Year)
head(movies)

##------ AESTHETICS -----

library(ggplot2)

ggplot(data = movies, aes(x=Critic, y=Audience, color= Genre, size=`Budget(in millions)` )) + 
  geom_point()

##----- Plotting with Layers ------------
# '+'means adding layers to the objects 

p <- ggplot(data = movies, aes(x=Critic, y=Audience, color= Genre )) 

#ggplot creates an object!!!!
p + geom_point() + geom_line()
#lines
p + geom_line()

p + geom_col()

p + geom_polygon()


##------ Overriding Aesthetics -----------

q <- ggplot(data = movies, aes(x=Critic, y=Audience, color= Genre, size = `Budget(in millions)` ))
      
#adding geom layer
q + geom_point()

#overriding aes
#but still keeps the initial x and y axes 
q + geom_point(aes(x=Audience, y= Critic))

#solution --->> yay!
q + geom_point(aes(x=Audience, y= Critic)) +
  xlab("Audience") +
    ylab("Critic")

q + geom_point(aes(color = `Budget(in millions)`))

#line size

p + geom_line(size=0.03) + geom_point(size=3) 
 
# Budget

q + geom_point(aes(x=`Budget(in millions)`))+ xlab("Budget(in millions)")


##----- Mapping vs Setting
 
r <- ggplot(data = movies, aes(x=Critic, y=Audience))
r + geom_point()

#Adding colour
#1. Mapping
r+ geom_point(aes(color=Genre))

#2. Setting
r + geom_point(color="Green")

#3. Error!!
r+ geom_point(aes(color="Green")) #R thinks of "Green" as a variable!!

# Mapping
r + geom_point(aes(size=movies$`Budget(in millions)`))

#Setting
r + geom_point(size=2)

#Error!
r+ geom_point(aes(size=5)) # treating size as an object!!!

#----------HISTOGRAM AND DENSITY CHART----------------

s <- ggplot(data = movies, aes(x=`Budget(in millions)` ))
s + geom_histogram(binwidth = 7)

#adding outline
s + geom_histogram(aes(color=Genre))

#adding color
s + geom_histogram(binwidth = 10,aes(fill=Genre)) 

#adding boundary
s + geom_histogram(binwidth = 7, color= "Black", aes(fill= Genre))

# anomaly!! no MAPPING! therefore, no aes()
s + geom_histogram(binwidth = 7, aes(color="Black", fill=Genre))

#--- Density graphs ---------------

s + geom_density()
q<- ggplot(data = movies, aes(x = Film,y=`Budget(in millions)` ))

#q + geom_density2d()

s + geom_density(aes(fill=Genre))

#Stacking
s + geom_density(aes(fill=Genre), position = "stack")

?geom_density

s + geom_density(aes(fill=Genre), position = "stack", alpha(0.5)) 

#---- Starting layer tips-------------

t <- ggplot(data = movies, aes(x= Audience))

t + geom_histogram(binwidth = 7, fill="White",color="Dark Green")

#another way 
#when exploring the data with flexible options
t <- ggplot(data = movies)
t + geom_histogram(binwidth = 7, aes(x=Critic),fill="Yellow",color="Maroon")

#To use different datasets
t <-ggplot()

#------- Statistical Transformations ----------

u <- ggplot(data = movies, aes(y=Audience, x=Critic, color=Genre))

u + geom_point() + geom_smooth(fill = NA)

#geom_smooth requiresx and y 
#geom_histogram requires only one of x or y
u + geom_histogram() + geom_smooth()

#box-plots
v<- ggplot(data=movies, aes(y=`Budget(in millions)`,x=Genre,color= Genre))
# use non-overlappig x intervals
v + geom_boxplot()

v + geom_boxplot(size = 1.2)

#Tutorials on boxplots>>>>>in Bonus tuts!
#good combo of boxplots and jitter!!

#jitter , shortcut for: geom_point(position = "jitter").
#adds random location of each point
v + geom_boxplot(size = 0.8) + geom_jitter()

#another way
#overriden
#better way
v + geom_jitter() + geom_boxplot(size = 0.8, alpha=0.5)

#another plot
w <- ggplot(data=movies, aes(y=Audience,x=Genre,color= Genre))
w + geom_jitter() + geom_boxplot(size = 0.8, alpha = 0.5)

x <- ggplot(data=movies, aes(y=Critic,x=Genre,color= Genre))
x + geom_jitter() + geom_boxplot(size = 0.8, alpha = 0.5)

#---- Facets -------
 
y<- ggplot(data=movies, aes(x=`Budget(in millions)`))

y + geom_histogram(binwidth=8,aes(fill=Genre), color="Black")

#facets
y + geom_histogram(binwidth=8,aes(fill=Genre), color="Black") +
  facet_grid(Genre~., scales = "free")

#independent scales
#scales= "free"
#coloumns-----left
facet_grid(.~Genre)
#rows-------right
facet_grid(Genre~.)

#scatterplots

u <- ggplot(data = movies, aes(y=Audience, x=Critic, color=Genre))
u + geom_point()

#facets
#facet_grid(row~col)

u + geom_point(size=2) +
  facet_grid(Genre~.)

u + geom_point(size=2) +
  facet_grid(.~Year)

#GRIDS with rows and coloumns
u + geom_point(size=2) +
  facet_grid(Genre~Year)

u + geom_point(size=2, aes(size=`Budget(in millions)`)) +
  facet_grid(Genre~Year)+
  geom_smooth()


#---- Coordinates --------------

#limits
#Zoom

a <- ggplot(data = movies, aes(x=Critic, y= Audience, color=Genre, size=`Budget(in millions)`))
a + geom_point(alpha=0.5)

#setting limits

a + geom_point(alpha=0.6) + 
  xlim(50,100) +
  ylim(50,100)

#shortcoming of limits
#truncates the data outside the limit
b <- ggplot(data = movies, aes(x=`Budget(in millions)`))
b + geom_histogram(binwidth = 7, aes(fill=Genre), color="Black")+
  xlim(100,200)+
  ylim(2,20)

#solution--- zoom
b + geom_histogram(binwidth = 7, aes(fill=Genre), color="Black")+
  coord_cartesian(ylim = c(5,20))

# zooming in the previous plot

u + geom_point(size=2, aes(size=`Budget(in millions)`)) +
  facet_grid(Genre~Year)+
  geom_smooth() +
  coord_cartesian(ylim = c(0,100), xlim = c(0,100))

#------ THEMES-----------

c <- ggplot(data = movies, aes(x= `Budget(in millions)`), title="Plot")
o <- c + geom_histogram(binwidth = 7, aes(fill=Genre), color="Black") 

#axes labels
#label formatting
o + xlab("Paisaaa") +
  ylab("Number") +
  theme(axis.title.x = element_text(size=30, color = "Red"),
        axis.title.y = element_text(size=30, color = "Blue"))

#tick mark formatting
o + xlab("Paisaaa") +
  ylab("Number") +
  theme(axis.title.x = element_text(size=30, color = "Red"),
        axis.title.y = element_text(size=30, color = "Blue"),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10))

?theme
#legend formatiing
o + xlab("Budget") +
  ylab("Number of Movies") +
  ggtitle("Movie Distribution by Budget") +
  theme(axis.title.x = element_text(size=20, color = "Red"),
        axis.title.y = element_text(size=20, color = "Blue"),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        legend.title = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        legend.background = element_rect(color = "Black", fill="Yellow"),
        plot.title = element_text(color = "Dark Green", size = 20,))






















