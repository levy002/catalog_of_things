require_relative '../musicAlbum/genre'

describe Genre do
  before :each do
    @item = Item.new('2022-04-04')
    @genres = Genre.new 'Nemwel'
  end

  describe '#new' do
    it 'Takes in one parameter and returns a Genre object' do
      @genres.should be_an_instance_of Genre
    end
  end

  describe '#name' do
    it 'Returns the correct name' do
      @genres.name.should eql 'Nemwel'
    end
  end

  context 'Genre to return list of items' do
    it 'Items should return empty array' do
      expect(@genres.items.length).to eql 0
    end
  end
end
