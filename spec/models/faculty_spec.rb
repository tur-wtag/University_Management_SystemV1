require 'rails_helper'

RSpec.describe Faculty, type: :model do
  describe 'Associations' do
    it{ is_expected.to belong_to(:department)}
    it{ is_expected.to have_many(:courses)}
  end

  describe 'check validation for' do
    let!(:test) do
      s1= School.create(name:'haha')
      d1= s1.departments.create(name:'lala',phone:'202-555-0126',chair:'batman')
      f1= d1.faculties.create(name:'deadpool', designation:'emni e', room:'nai 456', phone:'202-555-0126', email:'ronald.tudu@welldev.io')
    end
    context 'name' do
      it{ expect(test.name).not_to be_empty}
    end
    context 'designation' do
      it{ expect(test.designation).not_to be_empty}
    end
    context 'room' do
      it{ expect(test.room).not_to be_empty}
    end
    context 'phone' do
      it{ expect(test.phone).to match(/\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/)}
    end
    context 'email' do
      it{ expect(test.email).to match(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)}
    end
 
  end

end
