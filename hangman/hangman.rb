require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/source.rb'


use Rack::Session::Pool, :expire_after => 2592000

get '/' do

@session = session
set_game if session[:game].nil?	
if params["game"] == "new"
set_game
end
word = params["word"]
erb :hangman, :locals => { :game => @session[:game], :word => word}
end




helpers do 
	def set_game 
	session[:game] = Game.new
	end
end	