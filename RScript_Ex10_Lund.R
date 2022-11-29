# Set working directory
setwd("/Users/avivalund/Desktop/Biocomputing/Exercise10")

# Read data and assign to variable
GoBadgers<-read.csv("UWvMSU_1-22-13.txt")

# make a dataframe with a cumulative score 
# for each team whenever either team scores
  #isolate one team at a time
grep("UW", team) # how do I isolate a team?
UWisconsin<- data.frame(time, team, score)

  #cumulative score thing -how do i properly do this?

#isolate one team at a time
grep("MSU", team) # how do I isolate a team?
MSU<- data.frame(time, team, score)
  #cumulative score thing -how do i properly do this?

# load a package every time you wish to use it
library(ggplot2)
library(cowplot)


#Make plot without grey background and gridlines

ggplot(data = GoBadgers,
       aes(x = time, y = cumscore)) +
  geom_point() +
  stat_smooth(method="loess") +
  theme_classic()
