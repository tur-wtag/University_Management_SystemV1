class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :chair
      t.string :office_address
      t.string :phone
      t.string :name
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
