require_relative './Game/game_controller'
class App
  attr_accessor :game_controller

  def initialize
    @game_controller = GameController.new
  end

  def books; end

  def music; end

  def games
    puts "
    1. List all games
    2. List all authors
    3. Add new game
    "
    choice = gets.chomp
    case choice
    when '1'
      @game_controller.list_games
    when '2'
      @game_controller.list_authors
    when '3'
      @game_controller.add_game
    else
      puts 'Invalid choice'
      games
    end
  end

  def movies; end
end
