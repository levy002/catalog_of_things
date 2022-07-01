require 'json'
require_relative './music_controller'

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
              author: music.author
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
    new_music.genre = new_genre
    musics.push(new_music)
  end
  musics
end
