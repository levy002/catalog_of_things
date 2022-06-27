require_relative './app'
@method = App.new

def print_menu
  puts ''
  print 'Welcome to our catalog! You may perform the following tasks:'
  puts ''
  puts '
  1. Books
  2. Music
  3. Games
  4. Movies
  5. Exit
  Choose (1-5): '
end

def user_choice
  gets.chomp.to_i
end

def match_input(choice)
  case choice
  when 1
    @method.books
  when 2
    @method.music
  when 3
    @method.games
  when 4
    @method.movies
  when 5
    exit!
  else
    puts 'Not a valid choice'
  end
end

def main(status)
  loop do
    break unless status

    print_menu
    user_input = user_choice
    match_input(user_input)
  end
end

main(true)
