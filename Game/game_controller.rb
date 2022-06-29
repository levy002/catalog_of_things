require_relative 'game'
require_relative 'author'

class GameController
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end
end
