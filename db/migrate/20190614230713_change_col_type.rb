class ChangeColType < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :essential_flag, :string
  end
end
