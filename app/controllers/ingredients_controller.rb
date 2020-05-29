class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:id])
    @dishes = @chef.dishes
    # binding.pry
  end
end