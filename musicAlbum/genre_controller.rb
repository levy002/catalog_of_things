require_relative './genre'

class GenreController
  attr_accessor :musics

  def initialize
    @genres = []
  end

  def list_all_genres
    if @genres.length.zero?
      puts 'You don\'t have any genres available'
    else
      @genres.each_with_index do |gen, index|
        puts "#{index}) Genre name: #{gen.name}."
      end
    end
  end

  def add_genre
    puts 'Great! let\'s create the genre!'
    print 'What is the name of the genre? '
    genre_name = gets.chomp
    genrez = Genre.new(genre_name)
    @genres << genrez
    puts 'Your genre was added succesfully!'
  end
end
