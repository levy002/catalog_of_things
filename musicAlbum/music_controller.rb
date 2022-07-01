require_relative './musicalbum'
require_relative './handle_data'
require_relative './genre'
require 'json'

class MusicController
  attr_accessor :musics

  def initialize
    # @musics = []
    @musics = read_musics
  end

  def list_all_music
    if @musics.length.zero?
      puts 'You don\'t have any musics available'
    else
      @musics.each_with_index do |mq, index|
        print "#{index}) On spotify: #{mq.on_spotify}, Publish date: #{mq.publish_date}, genre #{mq.genre.name}, "
        print "Author: #{mq.author.first_name} #{mq.author.last_name}"
      end
    end
  end

  def list_all_genres
    if @musics.length.zero?
      puts 'You don\'t have any genres available'
    else
      uniq_genres = @musics.uniq { |x| x.genre.name }
      uniq_genres.each_with_index do |s, index|
        puts "#{index + 1}) #{s.genre.name}"
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
    print 'What is the music Genre?: '
    music_genre = gets.chomp
    genre = Genre.new(music_genre)
    print 'Who is the music author first name? '
    music_author_fname = gets.chomp
    print 'Who is the music author second name? '
    music_author_secname = gets.chomp
    author = Author.new(music_author_fname, music_author_secname)
    musiq = MusicAlbum.new(spotify_state, date_of_music_publish)
    musiq.genre = genre
    musiq.author = author
    @musics << musiq
    save_musics(@musics)
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
