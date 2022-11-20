setwd("/users/sydneyharris/Desktop/")

#Question 1
UW_MSU <- read.table("/users/sydneyharris/desktop/UWvMSU_1-22-13.txt", header = T, sep = "\t")

#set up vectors to hold information
UW_Total = numeric(length(c(1:nrow(UW_MSU))))
MSU_Total = numeric(length(c(1:nrow(UW_MSU))))
UW_scores = numeric(length(c(1:nrow(UW_MSU))))
MSU_scores = numeric(length(c(1:nrow(UW_MSU))))
#calculate cumulative score for UW and add column in UW_MSU called UW_Total
#for each row in the data set, if the team is UW, it will store the points gained (from the score) in the vector UW_scores
#if the team is not UW (by default of this data set, it has to be MSU), it will store a 0 in the vector UW_scores because UW gained 0 points
for (i in 1:nrow(UW_MSU)){
  if (UW_MSU$team[i] == "UW"){
    UW_scores[i] <- UW_MSU$score[i]
  }else {
    UW_scores[i] <- 0
  }}
#creates a column in UW_MSU called UW_Total with the cumulative sum of the UW team when a basket is scored regardless of team
UW_MSU$UW_Total <- c(cumsum(UW_scores))

#calculate cumulative score for MSU and add column in UW_MSU called MSU_Total
#for each row in the data set, if the team is MSU, it will store the score in the vector MSU_scores
#if the team is not MSU (by default of this data set, it has to be UW), it will store a 0 in the vector MSU_scores because MSU gained 0 points
for (i in 1:nrow(UW_MSU)){
  if (UW_MSU$team[i] == "MSU"){
    MSU_scores[i] <- UW_MSU$score[i]
  }else {
    MSU_scores[i] <- 0
  }}
#creates a column in UW_MSU called MSU_Total with the cumulative sum of the MSU team when a basket is scored regardless of team
UW_MSU$MSU_Total <- c(cumsum(MSU_scores))

#graph of each team's cumulative score over time
ggplot(UW_MSU, aes(x=time))+
  geom_line(aes(y = UW_Total, color = "UW")) + 
  geom_line(aes(y = MSU_Total, color = "MSU"))+
  xlab("Time (mins)")+
  ylab("Score")

#Question 2
#generate random number and save that as variable x
x<-sample(x=c(1:100), size =1)
#Use a for loop for each of the 10 guesses
#use if else statements to give feedback on the guess
#use readline(prompt="Guess:") to allow the user to make multiple interactive guesses

#this version doesn't generate new random number each time game is played
guess_my_number <- function() {
  answer <- readline(prompt= "I'm thinking of a random number. Can you guess it? Type Y or N?")
  if (answer=="Y"){
    x<- sample(x=c(1:100), size =1)
    } else {
      return("end")
      } +
  for (i in 1:10) {
  y <- readline(prompt = 'Guess:')
  if (x>y){
  #done number is higher than guess
  print ('higher')
}else if(x<y){
  #done if number is lower than guess
  print ('lower')
}else {
  print ('Correct!')
  return('end of game')
  }}}

#this one does but has added step of asking to generate random number
guess_my_number <- function() {
  answer <- readline(prompt= "I'm thinking of a random number from 1 to 100. Can you guess it? Type Y or N? ")
  if (answer=="Y"){
    x<- sample(x=c(1:100), size =1)
    for (i in 1:10) {
      y <- readline(prompt = 'Guess:')
      if (x>y){
        #done number is higher than guess
        print ('higher')
      }else if(x<y){
        #done if number is lower than guess
        print ('lower')
      }else {
        print ('Correct! The number was:')
        print(x)
        return('end of game')
      }}
  } else {
    return("end")
  } }
    
