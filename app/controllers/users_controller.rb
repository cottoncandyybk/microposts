class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :check_user, only: [:edit, :update]
  
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
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "The user is updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end


  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def check_user
    redirect_to root_url if (current_user != @user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :location)
  end
end