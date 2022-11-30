##Question 1

# Set working directory
setwd("/Users/avivalund/Desktop/Biocomputing/Exercise10")

# Read data and assign to variable
GoBadgers<-read.table("UWvMSU_1-22-13.txt", header=TRUE)

# make a dataframe with a cumulative score 
# for each team whenever either team scores

#UW
cumUW = c(0)
cumMSU = c(0)
for(file in 1:nrow(GoBadgers)){
  one_row_data = GoBadgers[file,]
  if(one_row_data$team == "UW"){
    currentcumUW = cumUW[file] + one_row_data$score
    currentcumMSU = cumMSU[file] + 0
  }else{
    currentcumMSU = cumMSU[file] + one_row_data$score
    currentcumUW = cumUW[file] + 0
  }
  cumUW = c(cumUW, currentcumUW)
  cumMSU = c(cumMSU, currentcumMSU)
    
}

# load a package every time you wish to use it
library(ggplot2)
library(cowplot)

#create a dataframe with adjusted time
basketball <-data.frame(time = c(0, GoBadgers$time), cumUW, cumMSU)

#Make plot without grey background and gridlines

ggplot(data = basketball,
       aes(x = time)) +
  geom_line(aes(y=cumUW), color="blue") +
  geom_line(aes(y=cumMSU), color="pink") +
  theme_classic()


## Question 2
randomnumber<-sample(1:100, 1)

for(file in 1:11){
  if(file==11){
    print("GAME OVER!")
    break
  }
  input=readline(prompt="Guess:")
  if(input<randomnumber){
    print("this is lower than actual value")
  } else if(input>randomnumber){
    print("this is higher than actual value")
  } else {
    print("Correct!")
    break
  }
}