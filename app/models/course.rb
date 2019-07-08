
class Course < ApplicationRecord
  belongs_to :department 
  belongs_to :faculty
  has_many :enrollments
  has_many :students, through: :enrollments
  validates_associated :enrollments , :students
  validates :name , presence:true , length:{ maximum:255 }
  validates :details , length:{ maximum:500 }
  validates :room , :time, :credit_hour , presence:true
end
