class ProfilesController < ApplicationController
  before_action :user_id, only: %i[show edit update]
  def show
    if (@user != current_user)
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if (@user == current_user)
      @user.update(user_params)
    end
  end

  private
  def user_id
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :email)
  end
end
