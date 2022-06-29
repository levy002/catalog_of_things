require_relative '../book'

describe Book do
  context 'To create a new instance of the Book class we must ensure the following' do
    it 'Return a Book object including publisher, cover_state and publish_date via constructor method' do
      @publisher = 'Anek'
      @cover_state = 'bad'
      @publish_date = 2020
      @book = Book.new(@publisher, @cover_state, @publish_date)
      expect(@book.publisher).to eql @publisher
      expect(@book.cover_state).to eql @cover_state
      expect(@book.publish_date).to eql @publish_date
    end

    it "should return true if parent's method returns true OR if cover_state equals to 'bad'" do
      @publisher = 'Anek'
      @cover_state = 'bad'
      @publish_date = 2020
      @book = Book.new(@publisher, @cover_state, @publish_date)
      expect(@book.can_be_archived?).to eql true
    end

    it "should return false if parent's method returns false and if cover_state equals to 'good'" do
      @publisher = 'Anek'
      @cover_state = 'good'
      @publish_date = 2020
      @book = Book.new(@publisher, @cover_state, @publish_date)
      expect(@book.can_be_archived?).to eql false
    end
  end
end
