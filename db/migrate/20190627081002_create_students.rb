class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :name
      t.decimal :cgpa
      t.integer :credits_passed
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
