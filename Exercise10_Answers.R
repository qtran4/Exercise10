#Exercise10 Max Zupfer
#Problem1- Score Graph
#Set Working Directory
setwd("/Users/maxwellzupfer/Desktop/Exercise10")
#Load ggplot and cowplot
library(cowplot)
library(ggplot2)
#Load Data into R
BasketballData=read.table("UWvMSU_1-22-13.txt", header=TRUE)
#Set the Initial Team Scores to 0
UW_Score=0
MSU_Score=0
#For Loop to fill out team scores as the game goes
#Index variable will be i, need to look at all the rows in BasketballData)
for (i in 1:nrow(BasketballData)){
  #Changing score for UW if $team is UW
  if (BasketballData$team[i]=="UW"){
    BasketballData$UW_Score[i]=BasketballData$score[i]+UW_Score
    #Adding the Score to the running UW Total
    UW_Score=BasketballData$UW_Score[i]
    #Keeping the MSU Score the same if UW scores
    BasketballData$MSU_Score[i]=MSU_Score
  }
  #Changing score for MSU if $team is MSU
 if(BasketballData$team[i]=="MSU"){
    BasketballData$MSU_Score[i]=BasketballData$score[i]+MSU_Score
    #Adding the Score to the running MSU Total
    MSU_Score=BasketballData$MSU_Score[i]
    #Keeping the UW Score the Same if MSU Scores
    BasketballData$UW_Score[i]=UW_Score
  }
}
#Adding Data
BasketballData1=rbind(data.frame(time=0, team=NA, score=0, UW_Score=0, MSU_Score=0), BasketballData)
#Making the Plot of the Scores
#The Green line is for MSU
#The Red Line is for UW
ggplot()+geom_line(data=BasketballData1, aes(x=time, y=MSU_Score), color="green")+geom_line(data=BasketballData1, aes(x=time, y=UW_Score), color="red")+xlab("Time")+ylab("Team Scores")



#Problem2- Guessing Number Game
#Set Working Directory
setwd("/Users/maxwellzupfer/Desktop/Exercise10")
#Pick a Random Number using Sample function
RandomNumber=sample(x=c(1:100), size=1)
#Loop with If statements
for (i in 1:11){
  answer=readline("Guess my number 1-100...");
  if (answer==RandomNumber){
    print("You Are Correct, You Win!")
    break
  }
  if (answer<RandomNumber){
    print("My Number is Higher")
  }
  if (answer>RandomNumber){
    print("My Number is Lower")
  }
  if (i==11){
    print("You Are Out of Guesses, You Lose")
    break
  }
}




