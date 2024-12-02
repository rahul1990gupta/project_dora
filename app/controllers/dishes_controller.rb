class DishesController < ApplicationController
  def index
    @dishes = Dish.where(season:"winter")
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path, notice: "Dish was successfully created"
    else
      render dishes_path, status: :unprocessable_entity
    end
  end

  private 

  def dish_params
    params.require(:dish).permit(:name, :meal_type, :season)
  end
end
