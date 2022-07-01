require 'json'
require_relative './music_controller'
require_relative './genre'

def initialize_files
  File.write('./musicAlbum/data/musics.json', '[]') unless File.exist?('./musicAlbum/data/musics.json')
  File.zero?('./musicAlbum/data/musics.json') && File.write('./musicAlbum/data/musics.json', '[]')
end

initialize_files

def save_musics(musics)
  mq = []
  musics.each do |music|
    mq.push({
              on_spotify: music.on_spotify,
              publish_date: music.publish_date,
              genre: music.genre.name,
              music_author_fname: music.author.first_name,
              music_author_secname: music.author.last_name
            })
  end
  File.write('./musicAlbum/data/musics.json', JSON.generate(mq).to_s)
end

def save_genres(genres)
  gen = []
  genres.each do |genre|
    gen.push({
               name: genre.name
             })
  end
  File.write('./musicAlbum/data/genres.json', JSON.generate(gen).to_s)
end

def read_musics
  musics = []
  all_musics = File.read('./musicAlbum/data/musics.json')
  JSON.parse(all_musics).each do |music|
    new_music = MusicAlbum.new(music['on_spotify'], music['publish_date'])
    new_genre = Genre.new(music['genre'])
    new_author = Author.new(music['music_author_fname'], music['music_author_secname'])
    new_music.genre = new_genre
    new_music.add_author(new_author)
    musics.push(new_music)
  end
  musics
end
