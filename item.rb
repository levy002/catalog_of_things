class Item
  attr_reader :archived, :label, :author, :genre
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = Random.rand(1...1000)
    @archived = false
    @publish_date = publish_date
  end

  def can_be_archived?
    diff = Time.now.year - @publish_date

    diff > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
    @label.add_item
  end
end
