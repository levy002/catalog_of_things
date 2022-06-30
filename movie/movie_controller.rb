require_relative './movie'
require_relative '../source/source'

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
        source = Source.new(movie['source'])
        new_movie = Movie.new(movie['publish_date'], movie['silet'])
        new_movie.add_source(source)
        movies.push(new_movie)
      end
    end
    movies
  end

  def add_movie
    puts "Please fill the following information\n\n"
    print 'Publish Year(yyyy): '
    publish_year = gets.chomp

    print 'Is silet (Y) OR (N): '
    state = gets.chomp
    silet = silet_choice(state)

    print 'Source: '
    movie_source = gets.chomp

    movie = Movie.new(publish_year, silet)
    source = Source.new(movie_source)
    movie.add_source(source)

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
        puts "#{index + 1}) Published year: #{m.publish_date} | Is silet: #{m.silet} | Source: #{m.source.name}"
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
      source: movie.source.name
    }
    all_movies.push(temp_movie)

    File.write('./movie/json_files/movie.json', JSON.generate(all_movies))
  end

  def silet_choice(state)
    case state
    when 'y'
      true
    when 'n'
      false
    else
      true
    end
  end
end
