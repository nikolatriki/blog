class UsersController < ApplicationController
  def new
    logged_in_notice if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(user)
      redirect_to @user
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
