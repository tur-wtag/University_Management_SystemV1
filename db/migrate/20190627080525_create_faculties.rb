class CreateFaculties < ActiveRecord::Migration[6.0]
  def change
    create_table :faculties do |t|
      t.string :name
      t.string :designation
      t.string :email
      t.string :phone
      t.string :room
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
