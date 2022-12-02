## Exercise 10

# Generate a line graph depicting the cumulative score for each team as a 
#   function of time in the game

setwd("/Users/bethoceguera/Documents/PhD Year 1/First Semester/Introduction to Biocomputing/Exercises/Exercise10")
data <- read.table("UWvMSU_1-22-13.txt", head=TRUE,sep = "\t")
library(ggplot2)

#Define the working variable
uwScores <- data[data$team == "UW",]
msuScores <- data[data$team == "MSU",]

#Table acummulating um scores
for(i in 2:nrow(uwScores)){
  uwScores[i,3] <- uwScores[i,3]+uwScores[(i-1),3]
}

#Table acummulating msu scores  
for(i in 2:nrow(msuScores)){
  msuScores[i,3] <- msuScores[i,3]+msuScores[(i-1),3]
}

#Plot with two lines for um and msu
ggplot() + 
  geom_line(data=uwScores,aes(x=time,y=score), color = "darkred") + 
  geom_line(data=msuScores,aes(x=time,y=score), color="steelblue", linetype="twodash")

##DONE

#2. Write a game called “guess my number”. 
#     The computer will generate a random number between 1 and 100. 
#     The user types in a number and the computer replies “lower” if the random number is lower than the guess, “higher” if the random number is higher, and “correct!” if the guess is correct. 
#     The player can continue guessing up to 10 times.

maxGuesses=10
randomNumber <- sample(1:100, 1)

for(i in 1:10) {
    guess=readline("Guess a random number 1 through 100: ")
    if (i==maxGuesses){
      print("Out of Guesses")
      break
    } else if (guess == randomNumber){
      print("Correct!")
      break
    }else if (guess > randomNumber){ 
      print("Lower")
    }else if (guess < randomNumber){ 
      print("Higher")
    }
} ##DONE