require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:department)}
    it { is_expected.to belong_to(:faculty)}
    it { is_expected.to have_many(:enrollments)}
    it { is_expected.to have_many(:students).through(:enrollments)}
  end

  describe 'check validation for attributes' do
    let!(:test) do
      s1= School.create(name:'haha')
      d1= s1.departments.create(name:'lala',phone:'202-555-0126',chair:'batman')
      c1= d1.courses.create(name:'byebye 101', room:'sac 303', time:'23:34', credit_hour:3)
    end
    context 'name' do
      it{ expect(test.name).not_to be_empty}
    end
    context 'name length' do
      it{ expect(test.name.length).to be <=255}
    end
  
    context 'details length' do
      it{ expect(test.name.length).to be <=255}
    end
    context 'room' do
      it{ expect(test.room).not_to be_empty}
    end
    context 'time' do
      it{ expect(test.time).not_to be_empty}
    end
    context 'credit hours' do
      it{ expect(test.credit_hour).not_to be_nil}
    end
    
    
 
  end

end
