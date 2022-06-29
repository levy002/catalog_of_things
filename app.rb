require_relative './Game/game_controller'
require './book/book_controller'
require './book/label_controller'

class App
  attr_reader :label_controller

  def initialize
    @book_controller = BookController.new
    @label_controller = LabelController.new
    @game_controller = GameController.new
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

  def music; end

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

  def movies; end
end
