require_relative 'game'
require_relative 'author'

class GameController
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def list_games
    if @games.empty?
      puts 'No game available!'
    else
      @games.each_with_index do |game, index|
        puts "#{index + 1} Multiplayer: #{game.multiplayer}, Last played at: #{game.last_played_at}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No author available!'
    else
      @authors.each_with_index { |author, index| puts "#{index + 1}: #{author.first_name} #{author.last_name}" }
    end
  end

  def add_game
    puts 'Please fill the following information:'
    puts ''
    puts 'Enter a name (Multiplayer): '
    multiplayer = $stdin.gets.chomp
    while multiplayer == '' || multiplayer.length < 2
      print 'No name entered, enter a valid name: '
      multiplayer = $stdin.gets.chomp
    end
    print 'When last did you play (Year)?("YYYY"): '
    last_played_at = $stdin.gets.chomp
    while last_played_at == '' || last_played_at.length != 4
      print 'No year entered, enter a valid year("YYYY"): '
      last_played_at = $stdin.gets.chomp
    end
    game = Game.new(multiplayer, last_played_at)
    @games << game unless @games.include?(game)
    puts 'Game successfully created'
  end

  def add_author
    puts 'Please fill the following information:'
    puts ''
    puts 'Enter your first name: '
    first_name = $stdin.gets.chomp
    while first_name == '' || first_name.length < 2
      print 'No name entered, enter a valid name: '
      first_name = $stdin.gets.chomp
    end
    print 'Enter your last name: '
    last_name = $stdin.gets.chomp
    while last_name == '' || last_name.length < 2
      print 'No name entered, enter a valid name: '
      last_name = $stdin.gets.chomp
    end
    author = Author.new(first_name, last_name)
    @authors << author unless @authors.include?(author)
    puts 'Author successfully created'
  end
end
