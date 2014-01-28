class AddDriverDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_vehicle_id, :integer
    add_column :users, :last_character_id, :integer
  end
end
