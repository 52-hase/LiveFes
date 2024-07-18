class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if params[:remove_avatar] == 'on'
      @user.avatar.purge if @user.avatar.attached?
    end

    if @user.update(user_params)
      redirect_to @user
    else
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end