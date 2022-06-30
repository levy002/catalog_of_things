require_relative './game/game_controller'
require_relative './musicAlbum/music_controller'
require_relative './musicAlbum/genre_controller'
require './book/book_controller'
require './book/label_controller'

class App
  attr_accessor :music_controller, :game_controller
  attr_reader :label_controller

  def initialize
    @book_controller = BookController.new
    @label_controller = LabelController.new
    @game_controller = GameController.new
    @music_controller = MusicController.new
    @genre_controller = GenreController.new
  end

  def books
    puts "
       1. List all books
       2. List all labels
       3. Add new book
       4. Add new label
    "
    choice = gets.chomp
    case choice
    when '1'
      @book_controller.books_list
    when '2'
      @label_controller.labels_list
    when '3'
      @book_controller.add_book
    when '4'
      @label_controller.add_label
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
    4. Add a genre
    Choose between the three: '
    choice = gets.chomp.to_i

    case choice
    when 1
      @music_controller.list_all_music
    when 2
      @genre_controller.list_all_genres
    when 3
      @music_controller.add_music
    when 4
      @genre_controller.add_genre
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
    4. Add an author
    "
    choice = gets.chomp
    case choice
    when '1'
      @game_controller.list_games
    when '2'
      @game_controller.list_authors
    when '3'
      @game_controller.add_game
    when '4'
      @game_controller.add_author
    else
      puts 'Invalid choice'
      games
    end
  end

  def movies; end
end
