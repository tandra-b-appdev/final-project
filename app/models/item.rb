# == Schema Information
#
# Table name: items
#
#  id                :integer          not null, primary key
#  essential_flag    :string
#  quantity          :float
#  measurement_units :string
#  recipe_id         :integer
#  ingredient_id     :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Item < ApplicationRecord
end
