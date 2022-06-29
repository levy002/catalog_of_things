require 'spec_helper'

describe Movie do
  before :each do 
    @movie = Movie.new(1990, true)
  end
  
  context 'Create @movie, an instance of class Movie' do
    it 'takes two parameters and returns Movie object' do
      expect(@movie).to be_instance_of Movie
    end
  end

end