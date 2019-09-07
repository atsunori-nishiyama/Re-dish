class ToppagesController < ApplicationController
  def index
    if logged_in?
      # @dishes = Dish.all.page(params[:page]).per(7)
      @dishes = Dish.order(created_at: :desc).page(params[:page]).per(7)
    end
  end
end
