class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.integer :user_id
      t.integer :character_id
      t.integer :vehicle_id
      t.integer :win_count
      t.integer :drive_count
      t.integer :total_points

      t.timestamps
    end
  end
end
