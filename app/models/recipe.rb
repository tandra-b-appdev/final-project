# == Schema Information
#
# Table name: recipes
#
#  id             :integer          not null, primary key
#  source_website :string
#  name           :string
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Recipe < ApplicationRecord
end
