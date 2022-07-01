require 'json'

def read_data
  read_games
  read_authors
end

def read_games
  file = File.read('game/games.json') if File.exist?('game/games.json')
  games = JSON.parse(file) unless file.chomp.empty?
  games&.map do |game|
    new_game = Game.new(game['multiplayer'], game['last_played_at'])
    new_author = Author.new(game['author']['first_name'], game['author']['last_name'])
    new_game.author = new_author
    @method.game_controller.games.push(new_game)
  end || []
end

def read_authors
  file = File.read('game/authors.json') if File.exist?('game/authors.json')
  authors = JSON.parse(file) unless file.chomp.empty?
  @method.game_controller.authors = (authors && authors.map do |author|
                                       Author.new(author['first_name'], author['last_name'])
                                     end) || []
end
