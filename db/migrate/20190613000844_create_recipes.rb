class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :source_website
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end
