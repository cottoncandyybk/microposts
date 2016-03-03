class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show # 追加
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.new(user_params)
  end
  
  def update
    @user = User.new(user_params)
  end


  private
  
  def set_user
    @user = User.find(params[:id])
    redirect_to root_path 
    
    unless(current_user == @user)
  end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :location)
  end
end