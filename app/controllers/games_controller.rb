require 'open-uri'
require 'pry'

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @message = message
  end

  private

  def check_dictionary
    response = open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    JSON.parse(response)['found']
  end

  def message
    if check_dictionary
      return "Congratulations! '#{@word}' is a valid English word."
    else
      return "Sorry, but '#{@word}' doesn\'t seem like a valid English word."
    end
  end



end
