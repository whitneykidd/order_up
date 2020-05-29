require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "relationships" do
    it {should have_many :dish_ingredients}
    it {should have_many(:dishes).through(:dish_ingredients)}
  end

  describe "methods" do
    it ".total_calories" do
      bert = Chef.create(name: "Bert")
      nachos =Dish.create(name: "Nacho Surprise", description: "It's a surprise", chef_id: bert.id)
      chips = nachos.ingredients.create(name: "Tortilla Chips", calories: 32)
      cheese = nachos.ingredients.create(name: "Cheese", calories: 16)
      salsa = nachos.ingredients.create(name: "Salsa", calories: 25)

      ingredients = Ingredient.all

      expect(ingredients.total_calories).to eq(73)
    end
  end
end