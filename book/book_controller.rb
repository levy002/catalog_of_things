require_relative 'data'
require_relative 'label_controller'


class BookController
    def initialize
        @books = read_books
        @labels = read_labels
        @label_controller = LabelController.new()
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

       puts 'Which label do you want'
       @label_controller.labels_list
       label = gets.chomp
       choosed_label = @labels[(label.to_i) - 1]
       book = Book.new(publisher, cover_state, time)
       write_books(book)
       puts "Book added successfully. #{@books}"
    end

    def books_list
        if @books.empty?
            puts 'No books available!'
      else
        puts
        puts 'The book list: '
        puts
        @books.each_with_index do |book, index|
          puts "#{index + 1}) Publisher: #{book.publisher} | Publish Date: #{book.publish_date} | Cover state: #{book.cover_state} | Label: #{book.label}"
        end
      end
    end

    def cover_state_choice(state)
        case state
        when 'y'
            current_state = 'good'
        when 'n'
            current_state = 'bad'
        end
        
        current_state
    end  
end  
