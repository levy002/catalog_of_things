require_relative '../game/author'
require_relative '../game/game'

describe '#add_item(item)' do
  before :each do
    @author = Author.new('Solomon', 'Achilles')
    @game = Game.new('Car Race', '2019', 2020)
  end

  it 'checks length of @author.items' do
    expected_value = 0
    expect(@author.items.length).to eq(expected_value)
  end

  it 'adds an game to @author.items' do
    @author.add_item(@game)
    expected_value = 1
    expect(@author.items.length).to eq(expected_value)
  end
end
