require 'json'

class Game
   @@dictionary = File.readlines "./lib/5desk.txt"
  attr_accessor :correct_letters, :incorrect_letters, :secret_word, :guesses, :dictionary
  
  def self.get_secret_word
  secret_word = @@dictionary.select {|word| (5..12).include? word.chomp.length  }.sample.chomp
  end
  def initialize 
    @correct_letters = []  
    @incorrect_letters = []
    @secret_word =  Game.get_secret_word.downcase
    @guesses = 7
  end  

  def check_letter letter
    @secret_word.include?(letter) ? @correct_letters << letter : @incorrect_letters << letter
  end
  
  def display_result *args
    word = ""
    @secret_word.each_char {|l| @correct_letters.include?(l) ? word << l : word << "_ " }
  return word
    end 
  
  def game_over?
    @secret_word.split("").all? {|l|  @correct_letters.include? l}
  end  
  
  
end
