require_relative '../movie/movie.rb'

describe Movie do
  before :each do 
    @movie = Movie.new(1990, true)
  end
  
  context 'Create @movie, an instance of Movie class' do
    it 'takes two parameters and returns Movie object' do
      expect(@movie).to be_instance_of Movie
    end
  end

  context 'The Movie class' do
    it 'returns the correct boolean when initialized with true value' do
      expected_value = true
      expect(@movie.silet).to be(expected_value)
    end

    it 'can_be_archived method is private method and returns true if ' do
      expect(@movie.send(:can_be_archived?)).to be(true)
    end
  end

end