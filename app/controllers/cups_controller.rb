class CupsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_cup, only: [:show, :update]
  before_filter :set_cups, only: :index

  def create
    @cup = Cup.new(cup_params).tap do |cup|
      cup.user_id = current_user.id
    end

    @cup.save
  end

  def index
  end

  def show
  end

  def update
    if current_user == @cup.user && params[:cup][:winning_user_id].present?
      @cup.winning_user_id = params[:cup][:winning_user_id]
      @cup.save
    end
  end

  protected

    def cup_params
      params.require(:cup).permit(:motor_class, :com, :items, :num_tracks)
    end

    def set_cup
      @cup = Cup.find params[:id]
    end

    def set_cups
      @cups = if params[:user_id].present?
        @user = User.find params[:user_id]
        @user.cups.finished.order('created_at DESC')
      end
    end
end
