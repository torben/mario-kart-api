class RenameTableDevicesToUserDevices < ActiveRecord::Migration
  def change
    rename_table :devices, :user_devices
  end
end
