require 'json'
require_relative './genre_controller'
require_relative './music_controller'

def save_musics(musics)
    mq = []
    musics.each do |music|
      mq.push({
                "on_spotify": music.on_spotify,
                "publish_date": music.publish_date
              })
    end
    File.write('./musicAlbum/data/musics.json', JSON.generate(mq).to_s)
end