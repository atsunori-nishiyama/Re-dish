class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).page(params[:page]).per(7)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password_digest, :image)
  end
end
