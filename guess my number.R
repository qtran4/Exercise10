# Hayden Gallo
# Exercise 10 Question 2

# Question 2

guesses = 1
random_number <- sample(1:100, 1)
number_guess = readline(prompt = "Enter any number : ")



while(random_number != number_guess){
  guesses = guesses + 1
  if (random_number > number_guess){
    print('Higher')
    number_guess = readline(prompt = "Enter a new number : ")
  }
  if(random_number < number_guess){
    print('Lower')
    number_guess = readline(prompt = "Enter a new number : ")
  }
  if (guesses == 10){
    print('Out of guesses')
    stop = TRUE
    break
  }
  if (random_number == number_guess){
    print('Correct')
  }
}
