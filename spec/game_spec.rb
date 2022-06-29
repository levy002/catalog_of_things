require_relative '../game/game'

describe '#can_be_archived?' do
  before :each do
    @game = Game.new('Solomon', '2019', 2020)
  end

  it 'returns true ' do
    expected_value = false
    expect(@game.can_be_archived?).to eq(expected_value)
  end

  it 'returns false ' do
    @game.publish_date = 2002
    expected_value = true
    expect(@game.can_be_archived?).to eq(expected_value)
  end

  it 'returns false ' do
    @game.publish_date = 2002
    @game.last_played_at = '2021'
    expected_value = false
    expect(@game.can_be_archived?).to eq(expected_value)
  end
end
