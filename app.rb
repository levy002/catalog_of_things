require_relative './game/game_controller'
require_relative './musicAlbum/music_controller'
require './book/book_controller'
require './movie/movie_controller'

class App
  attr_accessor :music_controller, :game_controller
  attr_reader :label_controller

  def initialize
    @book_controller = BookController.new
    @movie_controller = MovieController.new
    @game_controller = GameController.new
    @music_controller = MusicController.new
  end

  def books
    puts "
       1. List all books
       2. List all labels
       3. Add new book
    "
    choice = gets.chomp
    case choice
    when '1'
      @book_controller.books_list
    when '2'
      @book_controller.labels_list
    when '3'
      @book_controller.add_book
    else
      puts 'Invalid choice'
      books
    end
  end

  def music
    print 'Hello! What tasks would you like to perform?:
    1. List all music albums
    2. List all genres
    3. Add a music album
    : '
    choice = gets.chomp.to_i

    case choice
    when 1
      @music_controller.list_all_music
    when 2
      @music_controller.list_all_genres
    when 3
      @music_controller.add_music
    else
      puts 'That was an invalid choice. Try again'
      music
    end
  end

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

  def movies
    puts "
      1. List all movies
      2. List all sources
      3. Add a movie
    "
    choice = gets.chomp
    case choice
    when '1'
      @movie_controller.movies_list
    when '2'
      @movie_controller.sources_list
    when '3'
      @movie_controller.add_movie
    else
      puts 'Invalid choice'
      books
    end
  end
end
