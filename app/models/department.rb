class Department < ApplicationRecord
  belongs_to :school
  has_many :courses
  has_many :faculties
  has_many :students
  validates_associated :courses, :students , :faculties
  validates :chair, presence:true , length:{ maximum:255}
  validates :name, presence:true , length:{ maximum:255}
  validates :phone , format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/}

end
