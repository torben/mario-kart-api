class UserDevicesController < ApplicationController
  before_filter :set_user_device, only: [:create, :update]
  skip_before_filter :verify_authenticity_token, only: [:create, :update]

  def create
    @user_device.update_attributes(user_device_params)
  end

  def update
    params[:user_device][:open_count] = (@user_device.open_count || 0) + 1
    @user_device.update_attributes(user_device_params)

    if current_user.present?
      @user_device.update_attribute(:user_id, current_user.id)
    end
  end

  protected

    def set_user_device
      @user_device = UserDevice.find_or_create_by_uuid(params[:id])
    end

    def user_device_params
      params.require(:user_device).permit(:apn_token, :os_version, :retina, :model, :open_count, :language)
    end
end
