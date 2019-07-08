require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:school)}
    it { is_expected.to have_many(:courses)}
    it { is_expected.to have_many(:faculties)}
    it { is_expected.to have_many(:students)}
    
  end

  # describe 'validations' do
  #   it { is_expected.to validate_presence_of :name}
  #   it { is_expected.to validate_length_of :name}
  #   it { is_expected.to validate_presence_of :chair}
  #   it { is_expected.to validate_length_of :chair}
  #   it { is_expected.to allow_value(
  #     '202-555-0126',
  #     '754-3010',
  #     '(541) 754-3010',
  #     '+1-541-754-3010',
  #     '1-541-754-3010',
  #     '001-541-754-3010',
  #     '191 541 754 3010').for(:phone)}
  #   it { is_expected.to_not allow_value(
  #     'r202-555-0126',
  #     '202-555-0129d',
  #     '202-555-013 +5',
  #     '2`02-555-0194asd',
  #     '202-555-0134asdf',
  #     '202-#555-0151asdf').for(:phone) }
    
  # end
  

  describe 'check validation for' do
    let!(:test) do
      s1= School.create(name:'haha')
      d1= s1.departments.create(name:'lala',phone:'202-555-0126',chair:'batman')
    end
    context 'name' do
      it{ expect(test.name).not_to be_empty}
    end
    context 'name length' do
      it{ expect(test.name.length).to be <=255}
    end
    context 'chair length' do
      it{ expect(test.name.length).to be <=255}
    end
    context 'chair' do
      it{ expect(test.chair).not_to be_empty}
    end
    context 'phone' do
      it{ expect(test.phone).to match(/\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/)}
    end
 
  end
  

end

