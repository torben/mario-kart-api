class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :win_count, :integer, default: 0
    add_column :users, :drive_count, :integer, default: 0
    add_column :users, :total_points, :integer, default: 0
    add_column :users, :points_per_race, :integer, default: 0
  end
end
