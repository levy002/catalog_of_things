require_relative '../musicAlbum/musicalbum'

describe MusicAlbum do
  before :each do
    @musics = MusicAlbum.new true, '2020-02-20'
  end

  describe '#new' do
    it 'Takes in two parameter and returns a MusicAlbum object' do
      @musics.should be_an_instance_of MusicAlbum
    end
  end

  describe '#on_spotify' do
    it 'Checks whether the music is on spotify' do
      @musics.on_spotify.should eql true
    end
  end

  describe '#publish_date' do
    it 'Checks whether the date of publish is the same' do
      @musics.publish_date.should eql '2020-02-20'
    end
  end

  describe '#on_spotify' do
    it 'Checks whether the music can be archived' do
      @musics.on_spotify.should eql true
    end
  end
end
