class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.boolean :essential_flag
      t.float :quantity
      t.string :measurement_units
      t.integer :recipe_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
