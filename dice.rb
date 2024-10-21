# /dice.rb
require "better_errors"
require "binding_of_caller"
require "sinatra"
require "sinatra/reloader"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

# Route for rolling two 6-sided dice
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  
  @rolls = [] # Create an array for random numbers
  2.times do
    die = rand(1..6)  # Generate a random number
    @rolls.push(die)  # Add to the array
  end

  erb(:two_six)  # Render the template
end

# Route for rolling two 10-sided dice
get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  
  @rolls = [] # Create an array for random numbers
  2.times do
    die = rand(1..10)  # Generate a random number
    @rolls.push(die)   # Add to the array
  end

  erb(:two_ten)
end

# Route for rolling one 20-sided die
get("/dice/1/20") do
  @die = rand(1..20)
  @outcome = "You rolled a #{@die}"

  @rolls = [] # Create an array for random numbers
  1.times do
    die = rand(1..20)
    @rolls.push(die)
  end

  erb(:one_twenty)
end

# Route for rolling five 4-sided dice
get("/dice/5/4") do
  first_die = rand(1..4)
  second_die = rand(1..4)
  third_die = rand(1..4)
  fourth_die = rand(1..4)
  fifth_die = rand(1..4)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
	
  @outcome = "You rolled a #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die}, and a #{fifth_die} for a total of #{sum}."
  
  @rolls = [] # Create an array for random numbers
  5.times do
    die = rand(1..4)
    @rolls.push(die)
  end

  erb(:five_four)
end

# Route for rolling 100 6-sided dice
get("/dice/100/6") do
  @rolls = [] # Create an array for random numbers

  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end

  erb(:one_hundred_six)
end
