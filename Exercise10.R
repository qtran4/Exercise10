# BIOS 30318 Biocomputing -- Plotting data
# G Andreasen
# 12 02 2022

library(ggplot2)

setwd("~/Documents/Courses/Biocomputing_BIOS_60318/Tutorials/Exercise10")

# Problem 1: Cumulative score graph of UW v. MSU game

game_data <- read.table(file = "UWvMSU_1-22-13.txt", sep = '\t', header = TRUE)

sum_UW_score <- 0
sum_MSU_score <- 0

for(i in 1:nrow(game_data)){
	if(game_data$team[i]=="UW"){
		sum_UW_score <- sum_UW_score + game_data$score[i]
		game_data$score[i] <- sum_UW_score
	}else if(game_data$team[i]=="MSU"){
		sum_MSU_score <- sum_MSU_score + game_data$score[i]
		game_data$score[i] <- sum_MSU_score	
	}
}

ggplot(data = game_data, aes(x = time, y = score, group = team)) +
	geom_line(aes(color = team)) +
	scale_color_manual(values = c("#008208", "#c5050c")) +
	xlab("Game time") +
	ylab("Score") +
	theme_minimal()


# Problem 2: Guess a number game

stop_quietly <- function() { # Function to quit functions without error message
  opt <- options(show.error.messages = FALSE)
  on.exit(options(opt))
  stop()
}

# Number game
number_game <- function(number_game){
	number <- 5 #sample(1:100, size = 1) # Random number sampling
	cat("\n ") # Just to make this aesthetically appealing, I added spaces.
	cat("I'm thinking of a number 1-100...") # Print starting statement
	cat("\n ")
	guess <- as.numeric(readline(prompt = "Guess: ")) # Prompt user for first guess
	guesses <- 9 # Set starting number of guesses at 9, because first guess already made.
	while(guess != number & guess != "exit"){ # If the guess is incorrect...
		if(guesses > 1){ # And there are more than 1 guesses left
			if(guess < number){ 
				cat("Higher")
				cat("\nYou have", guesses, "guesses remaining.")
				cat("\n ")
				guesses = guesses - 1
			}
			if(guess > number){
				cat("Lower")
				cat("\nYou have", guesses, "guesses remaining.")
				cat("\n ")
				guesses = guesses - 1
			}
			guess <- as.numeric(readline(prompt = "Guess: "))
		}else if(guesses == 1){ # If there is only 1 guess left
			if(guess < number){
				cat("Higher")
				cat("\nYou have 1 guess remaining.")
				cat("\n ")
				guesses = guesses - 1
			}
			if(guess > number){
				cat("Lower")
				cat("\nYou have 1 guess remaining.")
				cat("\n ")
				guesses = guesses - 1
			}
			guess <- as.numeric(readline(prompt = "Guess: "))
		}
		if(guesses <= 0 & guess != number){ # If there are no guesses and you're incorrect
			cat("\nYou have 0 guesses remaining. The number was ", number, "!", sep = "")
			cat("\nGoodbye now.")
			stop_quietly()
		}
	}
	if(guess == number & guess != "exit" & guesses > 0){ # If the guess is correct
			cat("Correct!")
			cat("\nYou solved it in", (10-(as.numeric(guesses))), "guesses.")
			cat("\nGoodbye now.")
		}else if(guess == number & guesses == 0){
			cat("Correct!")
			cat("\nYou solved it in 10 guesses.")
			cat("\nGoodbye now.")
		}
	if(guess == "exit"){ # Type exit to escape out of the game
		cat("\nWe're sorry to see you go. The number was ", number, "!", sep = "")
	}
}

# Play the game!
number_game()










