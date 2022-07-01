require_relative 'data'
require_relative 'label'
require_relative '../game/author'

class BookController
  def initialize
    @books = read_books
    all_books = File.read('./book/json_files/book.json')
    File.write('./book/json_files/book.json', []) if all_books.empty?
  end

  def add_book
    puts 'Publisher:'
    publisher = gets.chomp
    puts 'Cover state Good (Y) OR Bad (N):'
    state = gets.chomp
    cover_state = cover_state_choice(state.downcase)
    puts 'Publish year:'
    time = gets.chomp
    puts 'Book label name:'
    label_name = gets.chomp
    puts 'Book color:'
    color = gets.chomp
    puts 'Book author first name:'
    author_first_name = gets.chomp
    puts 'Book author last name:'
    author_last_name = gets.chomp
    label = Label.new(label_name, color)
    author = Author.new(author_first_name, author_last_name)
    book = Book.new(publisher, cover_state, time)
    book.add_label(label)
    book.author = author
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
        puts "#{indx + 1}) Publisher: #{b.publisher} | Publish Date: #{b.publish_date} | Cover state: #{b.cover_state} | label: #{b.label.title}"
      end
    end
  end

  def labels_list
    if @books.length.zero?
      puts 'You don\'t have any books available'
    else
      uniq_labels = @books.uniq { |x| x.label.title }
      uniq_labels.each_with_index do |s, index|
        puts "#{index + 1})  Title: #{s.label.title} | Color: #{s.label.color}"
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
