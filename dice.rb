# /dice.rb
require "better_errors"
require "binding_of_caller"
require "sinatra"
require "sinatra/reloader"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')
get("/") do
  "Hello World"
  "<h3><a href=\"/zebra\">zebra</a></h3>
  <h3><a href=\"/giraffe\">giraffe</a></h3>
  <h3><a href=\"/dice/2/6\">Roll two 6-sided dice</a></h3>
  <h3><a href=\"/dice/2/10\">Roll two 10-sided dice</a></h3>
  <h3><a href=\"/dice/1/20\">Roll a 20-sided die</a></h3>
  <h3><a href=\"/dice/5/4\">Roll five four-sided dice</a></h3>"
end
get("/zebra") do
  "We must add a route for each path we want to support"
end
get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end
get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get ("/dice/2/10") do
    first_die = rand(1..10)
    second_die = rand(1..10)
    sum = first_die + second_die
    outcome = "you rolled a #{first_die} and a #{second_die} for a total of #{sum}"
    pp outcome
end
get("/dice/1/20") do
  die = rand(1..20)
  pp "you rolled a #{die}"
end
get("/dice/5/4") do
  die1 = rand(1..4)
  die2 = rand(1..4)
  die3 = rand(1..4)
  die4 = rand(1..4)
  die5 = rand(1..4)
  sum = die1 + die2 + die3 + die4 + die5 
  pp "you rolled a #{die1}, a #{die2}, a #{die3}, a #{die4}, and a #{die5} for a total of #{sum}"
end
