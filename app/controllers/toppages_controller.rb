class ToppagesController < ApplicationController
  def index
    if logged_in?
      # @dishes = Dish.all.page(params[:page]).per(7)
      # @dishes = Dish.order(created_at: :desc).page(params[:page]).per(7)
      @dishes = current_user.feed_dishes.order(id: :desc).page(params[:page]).per(7)
      # @search = Dish.ransack(params[:q])
      # @result = @search.result
    end
  end
end
