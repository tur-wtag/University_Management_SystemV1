require 'rails_helper'

RSpec.describe School, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:departments)}
  end
  
  # describe 'validations' do
  #   it { is_expected.to validate_presence_of :name}
  #   it { is_expected.to validate_length_of :dean}
  # end

  describe 'Attribute' do
    let(:test) do
      school = build(:school)
    end
    context 'name' do
      it{ expect(test.name).not_to be_empty}
    end
    
    context 'when name nil' do
	it 'print name nil' do
	test.update(name: nil)
	  expect(test.name).to eq(nil)
	end
    end
    context 'dean length' do
      it{ expect(test.dean.length).to be <=255}
    end
 
  end
  
end
