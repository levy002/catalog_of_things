require_relative '../source/source'
require_relative '../item'

describe Source do
  before :each do 
    @source = Source.new('SourceOne')
    @item = Item.new(2021)
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

    it 'returns 1 for the items array length after adding one item' do
      expected_value = 1
      @source.add_item(@item)
      expect(@source.items.length).to eq(expected_value)
    end
  end

end