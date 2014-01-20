class DriversController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_driver, only: :show

  def index
    @drivers = Driver.order(:points_per_race)
  end

  def show
  end

  def update
  end

  def destroy
  end

  def create
  end

  protected

    def set_driver
      @driver = Driver.find params[:id]
    end
end
