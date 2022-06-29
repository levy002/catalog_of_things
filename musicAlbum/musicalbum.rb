require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(_on_spotify)
    super()
    @on_spotify = false
  end

  def can_be_archived?()
    true if super() && @on_spotify
  end
end
