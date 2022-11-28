# Exercise 10
# Written by: Isaiah Murrell-Thomas

# Problem 1
# Using the score-by-score information from this game summarized in “UWvMSU_1-22-13.txt” 
# generate a graph similar to the one I show above. Don’t worry about how pretty your graph is. 
# Focus more on the control structures required in your script used to generate the plot.
# load ggplot2
library(ggplot2)
# Data frame set up
score_data = read.table("UWvMSU_1-22-13.txt", header = TRUE)
MSU_score = integer(nrow(score_data))
UW_score = integer(nrow(score_data))
time = 1:nrow(score_data)
# Time vector for data frame
for(i in 1:nrow(score_data)){time[i] = score_data$time[i]}
# UW and MSU score for data frame
MSU_score[1] = 0
UW_score[1] = 3
for(i in 2:nrow(score_data)){
  if (score_data$team[i] == "UW"){
    UW_score[i] = UW_score[i-1] + score_data$score[i]
    MSU_score[i] = MSU_score[i-1]
  } else if (score_data$team[i] == "MSU"){
    MSU_score[i] = MSU_score[i-1] + score_data$score[i]
    UW_score[i] = UW_score[i-1]
  }
}
# Making data frames 
df_score = data.frame(time, MSU_score, UW_score)
# Making graph
ggplot(df_score, aes(time)) + geom_line(aes(y=MSU_score), color = "black") + geom_line(aes(y=UW_score), color = "blue") + xlab("Time") +ylab("Score") + ggtitle("Cumulative Scores for MSU & UW")
# The black line is the MSU cumulative score and the blue line is the UW cumulative score

# Problem 2
# Write a game called “guess my number”. The computer will generate a random number between 1 and
# 100. The user types in a number and the computer replies “lower” if the random number is lower than the
# guess, “higher” if the random number is higher, and “correct!” if the guess is correct. The player can continue
# guessing up to 10 times.
counter = 1
print("Welcome to the Number Guessing Game! You only get 10 guesses to win >:)")
# setting a guess vector
guess_vec = 1:100
guess = sample(guess_vec, 1)
guess = as.numeric(guess)
# running through the game
while (counter <= 10){
  user = readline(prompt = "Enter a number from 1 to 100: ")
  user = as.numeric(user)
  if (guess < user && counter < 10){
    print("Please guess a lower number :)")
    counter = counter + 1
  } else if (guess > user && counter < 10){
    print("Please guess a higher number :)")
    counter = counter + 1
  } else if (guess == user){
    print("You Win! The game is over. Thanks for playing!")
    break
  }
  else if (counter == 10) {
    print("Sorry, but you've reached the maximum amount of guesses and you are still wrong. You lose! Feel free to play again though!")
    break
    }
}
