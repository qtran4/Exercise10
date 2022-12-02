# Nathan Kroeze
# 12/2/2022
# Exercise 10

library(tidyverse)

setwd("C:/Users/Natha/Desktop/Biocomputing/Exercise10")
game <- read.table("UWvMSU_1-22-13.txt",sep = "", header = TRUE)

MSU <- game[game$team=="MSU",]
UW <- game[game$team=="UW",]

MSU_score <- MSU$score
UW_score <- UW$score

sum_MSU <- vector("numeric",length(MSU_score))
sum_UW <- vector("numeric",length(UW_score))


for(i in 1:length(MSU_score)){
  sum_MSU[i] <- sum(MSU_score[1:i])
}
for(i in 1:length(UW_score)){
  sum_UW[i] <- sum(UW_score[1:i])
}

MSU$cum_score <- sum_MSU
UW$cum_score <- sum_UW
game2 <- rbind(MSU,UW)

ggplot(game2, aes(x = time, y = cum_score, group = team)) + 
  geom_line(aes(color = team),linewidth = 1.5) + ylab("Cumulative Score")

###
number = sample(1:100,1)
count = 0

for(i in 1:10){
  input <- readline("Guess: ")
  if(input == number){
    print("Correct!")
    break
  }else if(input < number){
    print("Higher...")
  }else{print("Lower...")}
  count <- count + 1
  if(count == 10){
    print("Better luck next time!")
    count <- 0
  }
}
