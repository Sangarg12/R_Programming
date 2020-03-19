library(tidyverse)

ggplot2::mpg

#Description

#This dataset contains a subset of the fuel economy data.
#It contains only models which had a new release every 
#year between 1999 and 2008 - this was used as a proxy 
#for the popularity of the car.

#Format of a data set:

#A data frame with 234 rows and 11 variables
#1 manufacturer
# 2 model > model name
#3 displ > engine displacement, in litres or size of engine
#4 year > year of manufacture
#5 cyl > number of cylinders
#6 trans > type of transmission
#7 drv > f = front-wheel drive, r = rear wheel drive, 4 = 4 wheel drive
#8 cty > city miles per gallon
#9 hwy > highway miles per gallon or efficency
#10 fl > fuel type
#11 class > "type" of car

#Lets see whats makes difference of size of cyl on efficency of car
ggplot2:: ggplot(data = mpg)+aes(x=displ,y= hwy) +geom_point()

#This indicates that efficency of car is inversely proportional to
#size of engine.

#Lets visvalize it in more efficient way:

ggplot(data = mpg)+aes(x=displ,y= hwy,color=class) +geom_point()

ggplot(data = mpg)+aes(x=displ,y=hwy,color=class)+geom_point()+
  facet_wrap(.~year)

#Here we can see that for some class no. of cylinders and effiency
#getting increased from 1999 to 2008 which gives us good picture.

#WE have some outliers as well in this graph as even if some cars
#have cly more than or equal to 6 but still have good efficiency.

#Lets see whats is impact of drive type of efficiency.

ggplot(data = mpg)+geom_jitter(aes(x=displ,y=hwy,color=drv),show.legend = FALSE)+
geom_smooth(mapping = aes(x=displ,y=hwy))+
  facet_wrap(.~drv)

#Here we can conclude that efficiecny is f>r>4.

table(mpg$manufacturer) #Gives the list of manufacturer

ggplot(data = mpg)+geom_bar(mapping = aes(x=manufacturer,fill=manufacturer))

#Car classes Vs Manufacturer
ggplot(data = mpg)+geom_bar(mapping = aes(x=class,fill=manufacturer),color="black")
?geom_bar
