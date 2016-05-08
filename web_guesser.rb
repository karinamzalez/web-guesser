require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess)
  background = check_color(message)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => background}
end

def check_guess(guess)
  if guess > SECRET_NUMBER
    if guess > SECRET_NUMBER + 5
     "Way too high!"
   else
     "Too high!"
   end
 elsif guess < SECRET_NUMBER
    if guess < SECRET_NUMBER - 5
     "Way too low!"
    else
     "Too low!"
    end
  elsif guess == SECRET_NUMBER
    "You got it right! The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

def check_color(message)
  if message.include?("Way")
    "red"
  elsif message.include?("right")
    "green"
  else
    "pink"
  end
end
