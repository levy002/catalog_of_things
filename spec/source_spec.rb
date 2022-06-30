require_relative '../source/source'

describe Source do
  before :each do 
    @source = Source.new('SourceOne')
  end
  
  context 'Create @movie, an instance of Movie class' do
    it 'takes two parameters and returns Movie object' do
      expect(@source).to be_instance_of Source
    end
  end

  context 'The Movie class' do
    it 'returns the correct name its initialized with' do
      expected_value = 'SourceOne'
      expect(@source.name).to eq(expected_value)
    end

  end

end