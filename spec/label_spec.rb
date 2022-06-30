require_relative '../book/label'
require_relative '../book/book'

describe Label do
  before(:each) do
    @title = 'Fiction'
    @color = 'Blue'
    @label = Label.new(@title, @color)
    @item = Book.new('Anek', 'bad', 2020)
    @label.add_item(@item)
  end

  context 'To create a new instance of the Label class we must ensure the following' do
    it 'Return a Label object including title and color via constructor method' do
      (
        @expected_value = @title
        expect(@label.title).to eql @expected_value
      )
      (
        @expected_value = @color
        expect(@label.color).to eql @expected_value
      )
    end

    it 'should add the input item to the collection of items and add label into colection of item.label' do
      expect(@label.items).to eql [@item]
      expect(@item.label).to eql @label
    end
  end
end
