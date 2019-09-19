class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers, :likes]
  
  
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(7)
  end

  def show
    @user = User.find(params[:id])
    @dishes = @user.dishes.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @user.image.cache! unless @user.image.blank?
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:success] = 'ユーザー情報を編集しました。'
        render :edit
      else
        flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
        render :edit
      end
    else
      redirect_to root_url
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page]).per(7)
    counts(@user)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page]).per(7)
    counts(@user)
  end

  def destroy
  end
  
  def likes
    @user = User.find(params[:id])
    @favposts = @user.favposts.page(params[:page]).per(7)
    counts(@user)
  end

  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
  
  
end
