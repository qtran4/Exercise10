# Exercise10

#set directory
setwd("/Users/romanfresquez/Tutorials/Exercise10")

#Part1

score.data<-read.table("UWvMSU_1-22-13.txt", header=TRUE)
score.data

#set score for game beginning
UW.score<-0
MSU.score<-0
#for loop to add up score over game time
for (i in 1:nrow(score.data)){
  #assign variable for each data point
  data.point<-score.data[i,]
  #adding the score to UW total score if team ==UW
  if(data.point$team=="UW"){
    running.scoreUW<-UW.score[i]+data.point$score
  }else{
    #if team =/= UW then the points will be added to MSU score
    running.scoreMSU<-MSU.score[i]+data.point$score
  }
  UW.score<-c(UW.score, running.scoreUW)
  MSU.score<-c(MSU.score, running.scoreMSU)
}

#load packages
library(ggplot2)
library(cowplot)

#make data frame with the running score over changing time
score.tracking<-data.frame(time<-c(0,score.data$time),UW.score,MSU.score)
#plot the running score
ggplot(data<-score.tracking,
       aes(x=time))+
  geom_line(aes(y=UW.score), color="red")+
  geom_line(aes(y=MSU.score), color="green")



#Part 2
#create random number generating function
random.number<-sample(1:100, 1)
#check to amke sure it works
random.number

#for loop that creates that game 
for (i in 1:11){
  #name prompt for players to see
  game<-readline(prompt<-"Guess My Number From 1-100")
  #conditional for if guess is less than the generated value
  if(game<random.number){
    print("higher")
  }else
    #coniditional for if guess is higher than the generated value
if(game>random.number){
  print("lower")
}else
  #conditional for choosing the correct value and the game ending 
  if(game==random.number){
    print("correct!")
    break
  }
  #conditional for only allowing ten attempts
  if(i==11){
    print("YOU LOST!")
    break
  }
}
