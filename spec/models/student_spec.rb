require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:department)}
    it { is_expected.to have_many(:enrollments)}
    it { is_expected.to have_many(:courses).through(:enrollments)}
  end
  describe 'check validation for' do
    let!(:test) do
      s1= School.create(name:'haha')
      d1= s1.departments.create(name:'lala',phone:'202-555-0126',chair:'batman')
      f1= d1.faculties.create(name:'deadpool', designation:'emni e', room:'nai 456', phone:'202-555-0126', email:'ronald.tudu@welldev.io')
      st= d1.students.create(name:'Ronald', cgpa:2.67, credits_passed:45)
    end
    context 'name' do
      it{ expect(test.name).not_to be_empty}
    end
    context 'cgpa' do
      it{ expect(test.cgpa).not_to be_nil}
    end
    context 'cgpa range' do
      it{ expect(test.cgpa).to be_between(0,4)}
    end
    context 'cgpa format' do
      it{ expect(test.cgpa.to_s).to match(/\A\d+(?:\.\d{2})?\z/)}
    end
    context 'credits passed' do
      it{ expect(test.credits_passed).not_to be_nil}
    end
    context 'credits within' do
      it{ expect(test.credits_passed).to be_between(0,134)}
    end
    
 
  end


end
