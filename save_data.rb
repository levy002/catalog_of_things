def save_data
  save_game
  save_author
  puts 'All data saved'
end

def save_game
  games_array = @method.game_controller.games.map do |game|
    { class_instance: 'Game', multiplayer: game.multiplayer, last_played_at: game.last_played_at,
      author: { first_name: game.author.first_name, last_name: game.author.last_name } }
  end
  games = JSON.generate(games_array)
  File.write('game/games.json', games)
end

def save_author
  author_array = @method.game_controller.authors.map do |author|
    { class_instance: 'Author', first_name: author.first_name, last_name: author.last_name }
  end
  authors = JSON.generate(author_array)
  File.write('game/authors.json', authors)
end
