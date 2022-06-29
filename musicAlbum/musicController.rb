require_relative './musicalbum'

class MusicController 
    attr_accessor :musics

    def initialize
      @musics = []
    end

    def add_music
        puts 'Great! let\'s create the music!'
        print "When was your music published? "
        date_of_music_publish = gets.chomp
        print "Is your music on spotify? (yes/no) "
        is_on_spotify = gets.chomp
        case is_on_spotify
        when 'yes'
            musiq = MusicAlbum.new(true, date_of_music_publish)
        when 'no'
            musiq = MusicAlbum.new(false, date_of_music_publish)
        else
            puts "That was an invalid option"
        end
        @musics << musiq
        puts "Your music was added succesfully!"
    end
end