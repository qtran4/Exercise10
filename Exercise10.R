#Elias Issa Exercise10

#Set Working Directory
setwd("/Users/elias/Downloads/Exercise10-main")
#Initialize ggplot2
library(ggplot2)
#Question 1
#import data
data <- read.table("UWvMSU_1-22-13.txt", header= T, sep = "\t", stringsAsFactors=FALSE)
#subset of MSU score
MSU<-subset(data,team == "MSU")
#subset of MSU cumulative score
MSU_cum<-subset(data,team == "MSU")
#subset of UW
UW<-subset(data,team == "UW")
#subset of UW cumulative score
UW_cum<-subset(data,team == "UW")
#adds the previous cumulative score to the point total of the next score for UW
for(i in 2:nrow(UW)){
  UW_cum$score[i] <-UW_cum$score[i-1]+UW$score[i]
  print(UW_cum$score[i])
}

#adds the previous cumulative score to the point total of the next score for MSU

for(i in 2:nrow(MSU)){
  MSU_cum$score[i] <-MSU_cum$score[i-1]+MSU$score[i]
  print(MSU_cum$score[i])
}

#Plot of both cumulative data vs time with different colors
ggplot() + geom_line(data= MSU_cum, aes(x=time, y= score,color="red")) + geom_line(data= UW_cum, aes(x=time, y= score,color="black")) +theme_classic()

  #Question 2
#uses a function to make the game easily replayable by putting it in a single function
guessmynumber<- function(){

#generates a random target
target <- sample(1:100,1)

#tells player the game
print("I'm thinking of a number 1-100...")
for (i in 1:10){
  #loops through function 10 times to limit guesses to 10
  guess<-readline(prompt <-"Guess:")
  guess<-as.integer(guess)
  if(guess>target){
    print("Lower")
  }else if(guess<target){
    print("Higher")
  }else if (guess==target){
    print("Correct!")
    break
  }else{break}
}}

#Calls the function guess my number to play the game
guessmynumber()
