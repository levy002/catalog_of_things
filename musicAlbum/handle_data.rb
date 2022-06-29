require 'json'
require_relative './genre_controller'
require_relative './music_controller'

def save_musics(musics)
  mq = []
  musics.each do |music|
    mq.push({
              on_spotify: music.on_spotify,
              publish_date: music.publish_date
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
    musics.push(new_music)
  end
  musics
end

def read_genres
  genres = []
  all_genres = File.read('./musicAlbum/data/genres.json')
  JSON.parse(all_genres).each do |genre|
    new_genre = Genre.new(genre['name'])
    genres.push(new_genre)
  end
  genres
end
