class Student < ApplicationRecord
  belongs_to :department
  has_many :enrollments
  has_many :courses, through: :enrollments
  validates :name , presence:true
  validates :cgpa , presence:true , format: { with: /\A\d+(?:\.\d{2})?\z/ },numericality: { greater_than: 0, less_than: 4.00 }
  validates :credits_passed , presence:true , numericality: { greater_than: 0, less_than: 134 }

end
