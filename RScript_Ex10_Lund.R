# Set working directory
setwd("/Users/avivalund/Desktop/Biocomputing/Exercise10")

# Read data and assign to variable
GoBadgers<-read.table("UWvMSU_1-22-13.txt", header=TRUE)

# make a dataframe with a cumulative score 
# for each team whenever either team scores
  #isolate one team at a time

cumUW = c(0)
for(file in 1:nrow(GoBadgers)){
  one_row_data = GoBadgers[file,]
  if(one_row_data$team[file] == "UW"){
    currentcumUW = cumUW[file] + one_row_data$score
  }else{
    currentcumUW = cumUW[file] + 0
  }
  cumUW = c(cumUW, currentcumUW)
    
}
grep("UW", team) # how do I isolate a team?
df$csum <- ave(time, team, score=cumsum)
#OR
UWisconsin<- data.frame(time, team, score)

  #cumulative score thing -how do i properly do this?

#isolate one team at a time
grep("MSU", team) # how do I isolate a team?
df$csum <- ave(time, team, score=cumsum)
#OR
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
