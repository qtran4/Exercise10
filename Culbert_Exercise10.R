##Question 1: 
##create plot with MSU vs UW cumulative points scored during a game

#install ggplot
library(ggplot2)

#view data
UW_MSU <- read.table("UWvMSU_1-22-13.txt", header = TRUE)
UW_MSU

#variables for inputting scores
UW_score = numeric(length(c(1:nrow(UW_MSU))))
MSU_score = numeric(length(c(1:nrow(UW_MSU))))

#for loop with if-else statements
for (i in 1:nrow(UW_MSU)){
  if (UW_MSU$team[i] == "UW"){
    UW_score[i] <- UW_MSU$score[i]
    MSU_score[i] <- 0 
  }else if (UW_MSU$team[i] == "MSU"){
    MSU_score[i] <- UW_MSU$score[i]
    UW_score[i] <- 0
  }
}

#cumulative sums
UW_MSU$UW_Total <- c(cumsum(UW_score))
UW_MSU$MSU_Total <- c(cumsum(MSU_score))

#generate plot
ggplot(UW_MSU, aes(x=time))+
  geom_line(aes(y=UW_Total, color="UW"))+
  geom_line(aes(y=MSU_Total, color="MSU"))+
  xlab("Time (min)")+
  ylab("Score")


##Question 2:
##"Guess My Number" game

#create variable containing 1 to 100
x <- c(1:100)

#create function to carry out game
#use for loop with if-else statements 
guess_my_number <- function() {
  number <- sample(x=x, size=1)
  print("I'm thinking of a number 1-100...")
  for (i in 1:10){
    guess <- readline(prompt = "Guess:")
    if (number == guess){
      print ("Correct!")
      return ("End of Game")
    }else if (number < guess){
      print ("Lower")
    }else if (number > guess){
      print ("Higher")
    }
  }
}

