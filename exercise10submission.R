# exercise 10
setwd("~/learning R in biocomputing/Exercise10")
library(ggplot2)
## question 1
### using the score-by-score info from the UW games summarized in "UWvMSU_1-22-13.txt" generate a graph similar to the one shown in exercise pdf
UWvMSU <- read.table("UWvMSU_1-22-13.txt", sep='\t', header=TRUE)
#### create a data frame in which cumulative scores can be stored
UW <- numeric(nrow(UWvMSU))
MSU <- numeric(nrow(UWvMSU))
cumulativeScores <- data.frame(time=UWvMSU$time, UW, MSU)

#### create a for loop to sum all the scores through time for each team
for (i in 1:nrow(UWvMSU)){
  if (UWvMSU$team[i]=="UW"){
    cumulativeScores$UW[i] <- UWvMSU$score[i]
  }else{
    cumulativeScores$MSU[i] <- UWvMSU$score[i]
  }
}

#### sum scores and put them into cumulativeScores data frame
for (i in 2:nrow(UWvMSU)){
  cumulativeScores$UW[i] <- cumulativeScores$UW[i]+cumulativeScores$UW[i-1]
}
for (i in 2:nrow(UWvMSU)){
  cumulativeScores$MSU[i] <- cumulativeScores$MSU[i]+cumulativeScores$MSU[i-1]
}
### create line plot
ggplot(data=cumulativeScores, aes(x=time)) +
    geom_line(aes(y=UW, color = "UW"))+
    geom_line(aes(y=MSU, color = "MSU"))+
  labs(x = "Time (minutes)", y = "score", color = "Teams")+
  theme_classic()+
  theme(legend.position = "bottom")
 
## question 2
### write a game called "guess by number"
### the computer will generate a random number between 1 and 100
x <- sample(1:100,1)
### the user types in a number and the computer replies "lower" if the random number is lower than the guess, "higher" if the random number is higher, and "correct!" if the guess is correct
#### type guess
guess <- scan(n=1)
#### set maximum amount of guesses
maxGuesses=10
for (i in 1:maxGuesses){
  if (guess==x){
    print("correct!")
    break
  }else if (i==maxGuesses){
    print("game over")
  }else if (guess<x){
    print("higher")
    guess <- scan(n=1)
  }else if (guess>x){
    print("lower")
    guess <- scan(n=1)
  }
}