class SearchesController < ApplicationController
  
  def index
    @q = Dish.ransack(params[:q])
    @dishes = @q.result(distinct: true).page(params[:page]).per(7)
  end
  
  def show
  end
    
    
    
  
end
