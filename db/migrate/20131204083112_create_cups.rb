class CreateCups < ActiveRecord::Migration
  def change
    create_table :cups do |t|
      t.integer :host_driver_id
      t.integer :winning_driver_id
      t.string :motor_class
      t.string :com
      t.string :items
      t.integer :num_tracks

      t.timestamps
    end
  end
end
