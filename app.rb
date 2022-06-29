class App
  def books; end

  def music
    print 'Hello! What tasks would you like to perform?:
    1. List all music albums
    2. List all genres
    3. Add a music album
    4. Add a genre
    Choose between the three: '
    choice = gets.chomp.to_i

    case choice
    when 1
      puts "List all music almbums"
    when 2
      puts "List all genres"
    when 3
      puts "Add a music album"
    when 4
      puts "Add a genre"
    else
      puts "That was an invalid choice. Try again"
      music
    end
  end

  def games; end

  def movies; end
end
