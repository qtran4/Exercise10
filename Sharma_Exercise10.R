#Using the score-by-score information from this game summarized in 
#“UWvMSU_1-22-13.txt” generate a graph similar to the one I show above. 
#Don’t worry about how pretty your graph is. Focus more on the control structures 
#required in your script used to generate the plot.

score <- read.table("UWvMSU_1-22-13.txt", header = TRUE)
score_MSU <- integer(nrow(score))
score_UW <- integer(nrow(score))
time <- 1:nrow(score)
for(i in 1:nrow(score)){
  time[i] <- score$time[i]
}
score_MSU <- 0
score_UW <- 3
for(i in 2:nrow(score)){
  if(score$team[i]=="UW"){
    score_UW[i] <- score_UW[i-1]+score$score[i]
    score_MSU[i] <- score_MSU[i-1]
  }else if(score$team[i]=="MSU"){
    score_MSU[i] <- score_MSU[i-1]+score$score[i]
    score_UW[i] <- score_UW[i-1]
  }
}
#create dataframe for time, MSU score and UW score.
score_dataframe <- data.frame(time, score_MSU, score_UW)
#loading ggplot2 package
library(ggplot2)
ggplot(score_dataframe, aes(time))+
  geom_line(aes(y=score_MSU), color=1)+
  geom_line(aes(y=score_UW), color=2)+
  xlab("Time")+
  ylab("Score")+
  ggtitle("Cummulative score for MSU and UW")


#2. Write a game called “guess my number”. The computer will generate a random 
#number between 1 and 100. The user types in a number and the computer replies 
#“lower” if the random number is lower than the guess, “higher” if the random
#number is higher, and “correct!” if the guess is correct. The player can continue 
#guessing up to 10 times.

i <- 1
#pick a random number from 1 to 100
Guess <- sample(1:100,1)
Guess <- as.numeric(Guess)
while (i <= 10) {
  reply <- readline(prompt = "Enter a number between 1 and 100:")
  reply <- as.numeric(reply)
  if(Guess < reply && i < 10){
    print("Guess a lower number, please!")
    i <- i+1
  }else if(Guess > reply && i < 10){
    print("Guess a higher number, please!")
  i <- i + 1
  }else if (Guess == reply){
    print("You win")
    break
  }
  else if(i == 10){
    print("Sorry :(, you cant make guess for more than 10 times")
    break
  }
}


