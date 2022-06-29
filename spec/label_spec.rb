require_relative '../book/label'
require_relative '../book/book'

describe Label do
  context 'To create a new instance of the Label class we must ensure the following' do
    it 'Return a Label object including title and color via constructor method' do
      @title = 'Fiction'
      @color = 'Blue'
      @label = Label.new(@title, @color)
      expect(@label.title).to eql @title
      expect(@label.color).to eql @color
    end

    it 'should add the input item to the collection of items and add label into colection of item.label' do
      item = Book.new('Anek', 'bad', 2020)
      @title = 'Fiction'
      @color = 'Blue'
      @label = Label.new(@title, @color)
      @label.add_item(item)
      expect(@label.items).to eql [item]
      expect(item.label).to eql @label
    end
  end
end
