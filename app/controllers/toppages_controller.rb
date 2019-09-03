class ToppagesController < ApplicationController
  def index
    if logged_in?
      
      @dishes = current_user.dishes.order(id: :desc).page(params[:page])
    end
  end
end
