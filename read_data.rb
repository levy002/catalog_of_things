require 'json'

def read_data
  read_games
  read_authors
end

def read_games
  file = File.read('game/games.json') if File.exist?('game/games.json')
  games = JSON.parse(file) unless file.chomp.empty?
  @method.game_controller.games = (games && games.map do |game|
                                     Game.new(game['multiplayer'], game['last_played_at'])
                                   end) || []
end

def read_authors
  file = File.read('game/authors.json') if File.exist?('game/authors.json')
  authors = JSON.parse(file) unless file.chomp.empty?
  @method.game_controller.authors = (authors && authors.map do |author|
                                       Author.new(author['first_name'], author['last_name'])
                                     end) || []
end
