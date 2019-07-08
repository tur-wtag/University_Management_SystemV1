class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name 
      t.string :details
      t.string :room
      t.string :time
      t.integer :credit_hour
      t.references :department, null: false, foreign_key: true
      t.references :faculty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
