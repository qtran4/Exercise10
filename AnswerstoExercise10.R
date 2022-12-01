#Answers to Exercise 10

#Answers to Prompt one

#set to correct directory and check for packages
getwd()
setwd("C:/Users/ortre/Exercise10")
library(ggplot2)

#retrieving data
scores_data<-read.table("UWvMSU_1-22-13.txt", header = TRUE)
#creating a blank slate for UW and MSU
MSU_score=0
UW_score=0
#Now to make a for loop to add score as time progresses
####file is already in order from the beginning time to end, so no need to make
####a time vector
for (i in 1:nrow(scores_data)){
  if(scores_data$team[i]=="MSU"){
    #this is for team MSU, if they score
    scores_data$score=scores_data$score[i]+MSU_score
    #adding their score to their score slate
    MSU_score=scores_data$score
    #keeping the score for UW the same if the ith was MSU
    scores_data$UW_score[i]=UW_score
  }else if(scores_data$team[i]=="UW"){
    #doing the same thing for UW
    scores_data$score=scores_data$score[i]+UW_score
    UW_score=scores_data$score
    scores_data$MSU_score[i]=MSU_score
  }
}

#Creating data frame
UWvMSU<-rbind(data.frame(time=0,team=NA,score=0,MSU_score=0,UW_score=0), scores_data)
#creating the plot
ggplot()+geom_line(data=UWvMSU, aes(x=time,y=MSU_score), color="black")+geom_line(data=UWvMSU, aes(x=time,y=UW_score), color="blue")+xlab("time")+ylab("Team Score")



