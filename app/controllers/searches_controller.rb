class SearchesController < ApplicationController
  
  def index
     @dishes = Dish.search(params[:search]).page(params[:page]).per(7)
     
    # if logged_in?
    #   @dish = current_user.dishes.build
    #   if params[:q]
    #     @dish_content = Dish.search_by_keyword(params[:q]).paginate(page: params[:page])
    #   else
    #     @dish_content = current_user.dishes.paginate(page: params[:page])
    #   end
    # end
  
    # @dish = Dish.all
    # @dishes = @dish.dishes.paginate(page: params[:page]).search(params[:search])
  #   @q = Dish.ransack(params[:q])
  #   @dishes = @q.result(distinct: true).page(params[:page]).per(7)
  end 
  
  def show
  end
    
    
    
  
end
