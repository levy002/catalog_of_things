def save_game
  games_array = @method.game_controller.games.map do |game|
    { class_instance: 'Game', multiplayer: game.multiplayer, last_played_at: game.last_played_at }
  end
  games = JSON.generate(games_array)
  File.write('games.json', games)
end
