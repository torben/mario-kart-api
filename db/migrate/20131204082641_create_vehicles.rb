class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :vehicle_type
      t.string :size

      t.timestamps
    end
  end
end
