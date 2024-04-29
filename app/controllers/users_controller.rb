class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_url, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.delete

    redirect_to users_url, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :given_name,
      :family_name,
      :password,
      :password_confirmation
    )
  end
end
