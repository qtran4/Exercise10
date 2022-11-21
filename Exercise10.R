#set working directory and load ggplot
setwd("/users/sydneyharris/Desktop/")
library(ggplot2)

#Question 1
#read data into R and save as variable
UW_MSU <- read.table("/users/sydneyharris/desktop/UWvMSU_1-22-13.txt", header = T, sep = "\t")

#pre-allocate vectors to hold information
UW_scores = numeric(length(c(1:nrow(UW_MSU)))) #points gained by UW every time a basket is scored regardless of team
MSU_scores = numeric(length(c(1:nrow(UW_MSU)))) #points gained by MSU every time a basket is scores regardless of team

#for loop with if-else statements
for (i in 1:nrow(UW_MSU)){
  if (UW_MSU$team[i] == "UW"){
#for each row in the data set, if the team is UW, it will store the points gained in the vector UW_scores
#it will store a 0 in the vector MSU_scores because MSU gained 0 points
    UW_scores[i] <- UW_MSU$score[i]
    MSU_scores[i] <- 0
  }else if (UW_MSU$team[i] == "MSU"){
#for each row in the data set, if the team is MSU, it will store the points gained in the vector MSU_scores
#it will store a 0 in the vector UW_scores because UW gained 0 points
    MSU_scores[i] <- UW_MSU$score[i]
    UW_scores[i] <- 0
  }}

#creates 2 columns in UW_MSU called UW_Total and MSU_Total with the cumulative sum of each team when a basket is scored regardless of team
UW_MSU$UW_Total <- c(cumsum(UW_scores))
UW_MSU$MSU_Total <- c(cumsum(MSU_scores))

#graph of each team's cumulative score over time
ggplot(UW_MSU, aes(x=time))+
  geom_line(aes(y = UW_Total, color = "UW")) + 
  geom_line(aes(y = MSU_Total, color = "MSU"))+
  xlab("Time (mins)")+
  ylab("Score")

#Question 2
#create a vector with integers 1 to 100
x<- c(1:100)
#Use a for loop for each of the 10 guesses
#use if else statements to give feedback on the guess
#use readline(prompt="Guess:") to allow the user to make multiple interactive guesses
guess_my_number <- function() {
  #use sample() to get a random integer from the vector x and save that as the number to be guessed
    number<- sample(x=x, size =1)
    print("I'm thinking of a number from 1 to 100...")
    for (i in 1:10) { # using (i in 1:10) restricts the user to only 10 guesses
      guess <- readline(prompt = 'Guess:') #prompts the reader to make a guess
  #the following if-else statements call for a guess and give feedback based on the guess
      if (number>guess){
        #done number is higher than guess
        print ('higher')
      }else if(number<guess){
        #done if number is lower than guess
        print ('lower')
      }else if (number==guess){
        #done if the number is equal to the guess
        print ('Correct! The number was:')
        print(number)
        return('end of game')
      }}
} 
#play game in the console by calling the function
guess_my_number()
