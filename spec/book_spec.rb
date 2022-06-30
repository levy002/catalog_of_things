require_relative '../book/book'

describe Book do
  before(:each) do
    @publisher = 'Anek'
    @cover_state = 'bad'
    @cover_state1 = 'good'
    @publish_date = 2020
    @book = Book.new(@publisher, @cover_state, @publish_date)
    @book1 = Book.new(@publisher, @cover_state1, @publish_date)
  end

  context 'create a new instance of the Book class we must ensure the following' do
    it 'Return a Book object including publisher, cover_state and publish_date via constructor method' do
      (@expected_value = @publisher
       expect(@book.publisher).to eql @expected_value)
      (@expected_value = @cover_state
       expect(@book.cover_state).to eql @expected_value)
      (@expected_value = @publish_date
       expect(@book.publish_date).to eql @expected_value)
    end

    it "should return true if parent's method returns true OR if cover_state equals to 'bad'" do
      (
        @expected_value = true
        expect(@book.can_be_archived?).to eql @expected_value
      )
    end

    it "should return false if parent's method returns false and if cover_state equals to 'good'" do
      (@expected_value = false
       expect(@book1.can_be_archived?).to eql @expected_value)
    end
  end
end
