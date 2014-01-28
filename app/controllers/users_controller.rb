class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_users, only: :index
  before_filter :set_user, only: [:show]

  def index

  end

  def show
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)

    if params[:user][:avatar_data].present?
      @user.image_data = params[:user][:avatar_data]
      @user.save
    end
  end

  def best_user
    @user = User.first
  end

  protected

    def set_user
      @user = User.find(params[:id])
    end

    def set_users
      @users = User.all
    end

    def user_params
      params.require(:user).permit(:nickname, :last_character_id, :last_vehicle_id)
    end
end
