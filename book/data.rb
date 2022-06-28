require 'json'
require_relative 'book'

def read_books
  books = []
  all_books = File.read('./book/json_files/book.json')
  if all_books.empty?
    puts 'No books available'
  elsif all_books.class != NilClass
    JSON.parse(all_books).each do |book|
      new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
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
    label: book.label
  }
  all_books.push(temp)

  File.write('./book/json_files/book.json', JSON.generate(all_books))
end

def read_labels
  labels = []
  all_labels = File.read('./book/json_files/label.json')
  if all_labels.empty?
    puts 'No books available'
  elsif all_labels.class != NilClass
    JSON.parse(all_labels).each do |label|
      new_label = Label.new(label['title'], label['color'])
      labels.push(new_label)
    end
  end
  labels
end

def write_labels(label)
  all_labels = JSON.parse(File.read('./book/json_files/label.json'))
  temp = {
    title: label.title,
    color: label.color,
    Items: label.items
  }
  all_labels.push(temp)

  File.write('./book/json_files/label.json', JSON.generate(all_labels))
end
