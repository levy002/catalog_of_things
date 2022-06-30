
class MovieController
  def initialize
    @movies = read_movies
    all_movies = File.read('./movie/json_files/movie.json')
    File.write('./movie/json_files/movie.json', []) if all_movies.empty?
  end

  def read_movies
    movies = []
    all_movies = File.read('./json_files/movie.json')
    if all_movies.empty?
      puts 'No movies available'
    elsif all_movies.class != NilClass
      JSON.parse(all_movies).each do |movie|
        new_movie = Movie.new(movie['publish_date'], movie['silet'])
        movies.push(new_movie)
      end
    end
    movies
  end  

  def add_movie
    puts 'Please fill the following information:'
    puts ''
    puts 'Publisher:'
    publisher = gets.chomp

    puts 'Cover state Good (Y) OR Bad (N):'
    state = gets.chomp
    cover_state = cover_state_choice(state)

    puts 'Publish year:'
    time = gets.chomp

    movie = movie.new(publisher, cover_state, time)
    write_movies(movie)
    @movies << movie
    puts 'movie added successfully.'
  end

  def movies_list
    if @movies.empty?
      puts 'No movies available!'
    else
      puts
      puts 'The movie list: '
      puts
      @movies.each_with_index do |b, indx|
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
