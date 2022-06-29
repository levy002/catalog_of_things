require 'json'

def read_data
  read_games
  read_authors
end

def read_games
  file = File.read('games.json') if File.exist?('games.json')
  games = JSON.parse(file) unless file.chomp.empty?
  @method.game_controller.games = games.map { |game| Game.new(game['multiplayer'], game['last_played_at']) } || []
end

def read_authors
  file = File.read('authors.json') if File.exist?('authors.json')
  authors = JSON.parse(file) unless file.chomp.empty?
  @method.game_controller.authors = authors.map { |author| Author.new(author['first_name'], author['last_name']) } || []
end
