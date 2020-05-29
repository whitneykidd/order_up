require 'rails_helper'

RSpec.describe "Dish Show Page" do
  before(:each) do
    @bert = Chef.create(name: "Bert")
    @ernie = Chef.create(name: "Ernie")
    @nachos =Dish.create(name: "Nacho Surprise", description: "It's a surprise", chef_id: @bert.id)
    @chips = @nachos.ingredients.create(name: "Tortilla Chips", calories: 32)
    @cheese = @nachos.ingredients.create(name: "Cheese", calories: 16)
    @salsa = @nachos.ingredients.create(name: "Salsa", calories: 25)

    visit "/dishes/#{@nachos.id}"
  end

  it "can see dish's name, chef's name, and dish's ingredients" do
    expect(current_path).to eq("/dishes/#{@nachos.id}")

    expect(page).to have_content(@nachos.name)
    expect(page).to have_content(@chips.name)
    expect(page).to have_content(@cheese.name)
    expect(page).to have_content(@salsa.name)

    expect(page).to have_content(@bert.name)
    expect(page).to have_no_content(@ernie.name)
  end
end
