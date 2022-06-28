require_relative '../item'

class MusicAlbum
  def initialize(_on_spotify)
    super()
    @on_spotify = false
  end

  def can_be_archived?()
    @archived = true if Item.can_be_archived? && @on_spotify
  end
end
