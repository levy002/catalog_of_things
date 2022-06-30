require_relative 'game'
require_relative 'author'

class GameController
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def list_games
    @games.map { |game| puts "Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}" }
  end

  def list_authors
    @authors.map { |author| puts "Name: #{author.first_name} #{author.last_name}" }
  end

  def add_game
    puts 'Please fill the following information:'
    puts ''
    puts 'Enter your name (Multiplayer): '
    multiplayer = $stdin.gets.chomp
    print 'When last did you play (Year)?("YYYY"): '
    last_played_at = $stdin.gets.chomp
    game = Game.new(multiplayer, last_played_at)
    @games << game unless @games.include?(game)
    puts 'Game successfully created'
  end

  def add_author
    puts 'Please fill the following information:'
    puts ''
    puts 'Enter your first name: '
    first_name = $stdin.gets.chomp
    print 'Enter your last name: '
    last_name = $stdin.gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author unless @authors.include?(author)
    puts 'Author successfully created'
  end
end