require_relative './musicalbum'

class MusicController
  attr_accessor :musics

  def initialize
    @musics = []
  end

  def list_all_music
    if @musics.length.zero?
      puts 'You don\'t have any musics available'
    else
      @musics.each_with_index do |mq, index|
        puts "#{index}) On spotify: #{mq.on_spotify}, Publish date: #{mq.publish_date}"
      end
    end
  end

  def add_music
    puts 'Great! let\'s create the music!'
    print 'When was your music published? '
    date_of_music_publish = gets.chomp
    print 'Is your music on spotify? (yes/no) '
    is_on_spotify = gets.chomp

    spotify_state = check_spotify_state(is_on_spotify)
    musiq = MusicAlbum.new(spotify_state, date_of_music_publish)
    @musics << musiq
    puts 'Your music was added succesfully!'
  end

  def check_spotify_state(state)
    case state
    when 'yes'
      true
    when 'no'
      false
    else
      puts 'That was an invalid option'
      puts ''
      print 'Is your music on spotify? (yes/no) '
      state = gets.chomp
      check_spotify_state(state)
    end
  end
end