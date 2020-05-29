require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before(:each) do
    @bert = Chef.create(name: "Bert")
    @ernie = Chef.create(name: "Ernie")
    @nachos =Dish.create(name: "Nacho Surprise", description: "It's a surprise", chef_id: @bert.id)
    @cheese_soup =Dish.create(name: "Cheese Soup", description: "It's in the name", chef_id: @bert.id)
    @chips = @nachos.ingredients.create(name: "Tortilla Chips", calories: 32)
    @cheese = @nachos.ingredients.create(name: "Cheese", calories: 16)
    @salsa = @nachos.ingredients.create(name: "Salsa", calories: 25)
    @cheese = @cheese_soup.ingredients.create(name: "Cheese", calories: 16)

    visit "/chefs/#{@bert.id}"
  end

  it "can see the chef's name and a link to ingredients they use in their dishes" do
    expect(page).to have_content(@bert.name)
    expect(page).to have_link("Ingredients Used")
  end

  describe "when I click on the ingredient link" do
    it "I am taken to the chef's ingredient index page" do
      click_link "Ingredients Used"
      expect(current_path).to eq("/chefs/#{@bert.id}/ingredients")

      within '.ingredient-list' do
      expect(page).to have_content(@chips.name)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@salsa.name)
      end
    end
  end
end
