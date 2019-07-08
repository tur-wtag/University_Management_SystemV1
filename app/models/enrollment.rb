class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :course
  enum semester: {spring:0, summer:1, fall:2}
  validates :grade , presence:true , format: { with: /\A\d+(?:\.\d{2})?\z/ },numericality: { greater_than: 0, less_than: 4.00 }
  validates :semester, inclusion: {in: semesters.keys, message: :invalid}
end
