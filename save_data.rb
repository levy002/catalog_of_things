def save_data
  save_game
  save_author
end

def save_game
  games_array = @method.game_controller.games.map do |game|
    { class_instance: 'Game', multiplayer: game.multiplayer, last_played_at: game.last_played_at }
  end
  games = JSON.generate(games_array)
  File.write('games.json', games)
end

def save_author
  author_array = @method.game_controller.authors do |author|
    { class_instance: 'Author', first_name: author.first_name, last_name: author.last_name }
  end
  authors = JSON.generate(author_array)
  File.write('authors.json', authors)
end
