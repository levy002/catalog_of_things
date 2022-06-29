require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date = Time.now.year)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?()
    diff = Time.now.year - last_played_at.to_i
    super == true && diff > 2
  end
end
