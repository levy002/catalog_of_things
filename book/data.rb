require 'json'
require_relative 'book'
require_relative '../game/author'

def read_books
  books = []
  all_books = File.read('./book/json_files/book.json')
  if all_books.empty?
    puts 'No books available'
  elsif all_books.class != NilClass
    JSON.parse(all_books).each do |book|
      new_label = Label.new(book['label'], book['color'])
      Author.new(book['first_name'], book['last_name'])
      new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
      new_book.add_label(new_label)
      books.push(new_book)
    end
  end
  books
end

def write_books(book)
  all_books = JSON.parse(File.read('./book/json_files/book.json'))
  temp = {
    publisher: book.publisher,
    cover_state: book.cover_state,
    publish_date: book.publish_date,
    label: book.label.title,
    color: book.label.color,
    first_name: book.author.first_name,
    last_name: book.author.last_name
  }
  all_books.push(temp)

  File.write('./book/json_files/book.json', JSON.generate(all_books))
end
