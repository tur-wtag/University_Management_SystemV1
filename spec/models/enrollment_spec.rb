require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:student)}
    it { is_expected.to belong_to(:course)}
  end
  describe 'Validations' do 
    let!(:test) do
      s1= School.create(name:'haha')
      d1= s1.departments.create(name:'lala',phone:'202-555-0126',chair:'batman')
      f1= d1.faculties.create(name:'deadpool', designation:'emni e', room:'nai 456', phone:'01755506773', email:'ronald.tudu@welldev.io')
      st= d1.students.create(name:'Ronald', cgpa:2.67, credits_passed:45)
      c1= d1.courses.create(name:'byebye 101', room:'sac 303', time:'23:34', credit_hour:3)
      en= Enrollment.create(student_id:st.id,course_id:c1.id,semester:1,grade:2.57)
    end
    context 'when grade is nil' do
      it 'does not allow to create the test' do
        test.grade = nil
        expect(test.valid?).to eq(false)
        expect(test.errors.messages['grade']).not_to be_nil
      end
    end
    context 'grade format' do
      it{ expect(test.grade.to_s).to match(/\A\d+(?:\.\d{2})?\z/)}
    end
    context 'grade ranges' do
      it{ expect(test.grade).to be_between(0,4.00)}
    end
    context 'Semester enum' do
      it { should define_enum_for(:semester) }
    end

  end

  
  
end
