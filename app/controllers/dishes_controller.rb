class DishesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
 
  def new
    @dish = Dish.new
  end
  
  def create
    @dish = current_user.dishes.build(dish_params)
    if @dish.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      @dishes = current_user.feed_dishes.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿できませんでした'
      render 'toppages/index'
    end
  end
  
  def destroy
    @dish.destroy
    flash[:success] = '投稿を削除しました'
    redirect_back(fallback_location: root_path)
  end
  
  
  private
  
  def dish_params
    params.require(:dish).permit(:content, :picture)
  end
  
  def correct_user
    @dish = current_user.dishes.find_by(id: params[:id])
    redirect_to root_url if @dish.nil?
  end
end
