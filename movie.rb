require_relative './item'

class Movie < Item
  attr_accessor :silet

  def initialize(silet) {
    super
    @silet = silet
  }

  def can_be_archived?
    super or @silet
  end

end