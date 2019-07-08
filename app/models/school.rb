class School < ApplicationRecord
    has_many :departments 
    validates_associated :departments 
    validates :name, presence: true
    validates :dean, length: {maximum:255}
    # validates :phone , format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/}
    
end
