class Faculty < ApplicationRecord
  belongs_to :department
  has_many :courses 
  validates_associated :courses 
  validates :name, :designation, :room , presence:true 
  validates :phone , format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/}
  validates :email , format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}

  
  
end
