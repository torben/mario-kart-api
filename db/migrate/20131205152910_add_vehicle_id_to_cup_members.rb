class AddVehicleIdToCupMembers < ActiveRecord::Migration
  def change
    add_column :cup_members, :vehicle_id, :integer
  end
end
