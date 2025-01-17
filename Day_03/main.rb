#Game Class for main execution
require_relative 'class_hangman'
class Game
  def self.main 
    system('clear')
    Hangman.game_title
    Hangman.new.start_game 
  end 
end

Game.main
