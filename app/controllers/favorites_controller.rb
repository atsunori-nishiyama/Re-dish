class FavoritesController < ApplicationController
    
  def create
    dish = Dish.find(params[:dish_id])
    current_user.like(dish)
    flash[:success] = '好物に追加しました'
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    dish = Dish.find(params[:dish_id])
    current_user.unlike(dish)
    flash[:success] = '好物から外しました'
    redirect_back(fallback_location: root_path)
  end
    
end
