require_relative '../item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date, silet)
    super(publish_date)
    @silet = silet
  end

  def can_be_archived?
    super or @silet
  end
end
