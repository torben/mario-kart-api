class AddPointsPerRaceToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :points_per_race, :integer
  end
end
