require_relative 'data'
require_relative 'label_controller'

class BookController
  def initialize
    @books = read_books
    all_books = File.read('./book/json_files/book.json')
    File.write('./book/json_files/book.json', []) if all_books.empty?
  end

  def add_book
    puts 'Please fill the following information:'
    puts ''
    puts 'Publisher:'
    publisher = gets.chomp

    puts 'Cover state Good (Y) OR Bad (N):'
    state = gets.chomp
    cover_state = cover_state_choice(state)

    puts 'Publish year:'
    time = gets.chomp

    book = Book.new(publisher, cover_state, time)
    write_books(book)
    @books << book
    puts 'Book added successfully.'
  end

  def books_list
    if @books.empty?
      puts 'No books available!'
    else
      puts
      puts 'The book list: '
      puts
      @books.each_with_index do |b, indx|
        puts "#{indx + 1}) Publisher: #{b.publisher} | Publish Date: #{b.publish_date} | Cover state: #{b.cover_state}"
      end
    end
  end

  def cover_state_choice(state)
    case state
    when 'y'
      'good'
    when 'n'
      'bad'
    else
      puts 'Invalid choice'
      puts ''
      puts 'Cover state Good (Y) OR Bad (N):'
      state = gets.chomp
      cover_state_choice(state)
    end
  end
end
