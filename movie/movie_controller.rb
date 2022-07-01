require_relative './movie'
require_relative '../source/source'
require_relative '../musicAlbum/genre'

class MovieController
  def initialize
    @movies = read_movies
    all_movies = File.read('./movie/json_files/movie.json')
    File.write('./movie/json_files/movie.json', []) if all_movies.empty?
  end

  def read_movies
    movies = []
    all_movies = File.read('./movie/json_files/movie.json')
    if all_movies.empty?
      puts 'No movies available'
    elsif all_movies.class != NilClass
      JSON.parse(all_movies).each do |movie|
        author = Author.new(movie['author_fname'], movie['author_lname'])
        source = Source.new(movie['source'])
        genre = Genre.new(movie['genre'])
        new_movie = Movie.new(movie['publish_date'], movie['silet'])
        new_movie.add_source(source)
        new_movie.genre = genre
        new_movie.add_author(author)
        movies.push(new_movie)
      end
    end
    movies
  end

  def add_movie
    print "Please fill the following information\n\nPublish Year(yyyy): "
    publish_year = gets.chomp
    print 'Is silet (Y) OR (N): '
    state = gets.chomp
    silet = silet_choice(state)
    print 'Source: '
    movie_source = gets.chomp
    print 'Genre: '
    movie_genre = gets.chomp
    print 'Author first name: '
    movie_author_fname = gets.chomp
    print 'Author last name: '
    movie_author_lname = gets.chomp
    movie = Movie.new(publish_year, silet)
    source = Source.new(movie_source)
    genre = Genre.new(movie_genre)
    author = Author.new(movie_author_fname, movie_author_lname)
    movie.add_source(source)
    movie.genre = genre
    movie.add_author(author)
    save_movie(movie)
    @movies << movie
    puts 'Movie added successfully.'
  end

  def movies_list
    if @movies.empty?
      puts 'No movies available!'
    else
      puts "\nThe movie list: \n"
      @movies.each_with_index do |m, index|
        print "#{index + 1}) Published year: #{m.publish_date} | Is silet: #{m.silet} | Source: #{m.source.name} | "
        print "Genre: #{m.genre.name} | Author: #{m.author.first_name} #{m.author.last_name}"
      end
    end
  end

  def sources_list
    if @movies.empty?
      puts 'No sources found!'
    else
      puts "\nThe source list: \n"
      uniq_sources = @movies.uniq { |x| x.source.name }
      uniq_sources.each_with_index do |s, index|
        puts "#{index + 1}) #{s.source.name}"
      end
    end
  end

  def save_movie(movie)
    all_movies = JSON.parse(File.read('./movie/json_files/movie.json'))
    temp_movie = {
      silet: movie.silet,
      publish_date: movie.publish_date,
      source: movie.source.name,
      genre: movie.genre.name,
      author_fname: movie.author.first_name,
      author_lname: movie.author.last_name
    }
    all_movies.push(temp_movie)

    File.write('./movie/json_files/movie.json', JSON.generate(all_movies))
  end

  def silet_choice(state)
    if state == 'y'
      true
    else
      state != 'n'
    end
  end
end
