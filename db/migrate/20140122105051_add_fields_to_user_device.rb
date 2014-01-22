class AddFieldsToUserDevice < ActiveRecord::Migration
  def change
    add_column :user_devices, :os_version, :string
    add_column :user_devices, :retina, :bool
    add_column :user_devices, :model, :string
    add_column :user_devices, :open_count, :integer
    add_column :user_devices, :language, :string
  end
end
