require_relative '../source/source'

describe Source do
  before :each do 
    @source = Source.new('SourceOne')
  end
  
  context 'Create @source, an instance of Source class' do
    it 'takes two parameters and returns Source object' do
      expect(@source).to be_instance_of Source
    end
  end

  context 'The Source class' do
    it 'returns the correct name its initialized with' do
      expected_value = 'SourceOne'
      expect(@source.name).to eq(expected_value)
    end

    it 'returns returns empty array for items property' do
      expected_value = []
      expect(@source.items).to eq(expected_value)
    end
  end

end