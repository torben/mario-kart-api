class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_users, only: :index
  before_filter :set_user, only: [:show, :update]

  def index

  end

  def show
  end

  def update
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
end
