class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.total_calories
    sum(:calories)
  end

  def self.unique_names
    pluck(:name).uniq
  end
end
