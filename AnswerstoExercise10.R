#Answers to Exercise 10

#Answers to Prompt one

#set to correct directory and check for packages
getwd()
setwd("C:/Users/ortre/Exercise10")
library(ggplot2)

#retrieving data
scores_data<-read.table("UWvMSU_1-22-13.txt", header = TRUE)
#creating a blank score slate for UW and MSU
MSU<-numeric(nrow(scores_data))
UW<-numeric(nrow(scores_data))
#creating data frame
scores<-data.frame(time=scores_data$time, UW, MSU)
#Now to make a for loop to add score as time progresses
for (i in 1:nrow(scores_data)){
  if(scores_data$team[i]=="MSU"){
    #this is for team MSU, if they score
    scores$MSU[i]<-scores_data$score[i]
  }else{
    #only one other team, so else is for UW
    scores$UW[i]<-scores_data$score[i]
  }
} 
##getting the cumulative scores for UW and MSU
for (i in 2:nrow(scores_data)){
  scores$MSU[i]<-scores$MSU[i]+scores$MSU[i-1]
}
for (i in 2:nrow(scores_data)){
  scores$UW[i]<-scores$UW[i]+scores$UW[i-1]
}
#creating the plot
ggplot(data=scores, aes(x=time)) + 
  geom_line(aes(y=MSU), color ="black") + 
  geom_line(aes(y=UW), color="blue") +
  xlab("time") +
  ylab("Team Score")

#answer to prompt 2

#creating a random number picker
RandomNumb<-sample(x=c(1:100), size=1)
#For loop for guessing game, max number of tries is 10

for (i in 1:11){
  answer=readline(prompt = "Guess a number from 1-1oo")
  if (answer<RandomNumber){
    print("HIGHER")
  }else if (answer>RandomNumber){
    print("LOWER")
  }else if (answer==RandomNumber){
    print("CORRECT!")
    break #a break to end game if guess is correct and before 11th try
  }elseif (i==11){
    print("YoU LOSE")
    break # out of guesses
  }
}
