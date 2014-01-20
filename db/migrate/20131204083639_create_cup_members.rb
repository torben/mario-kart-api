class CreateCupMembers < ActiveRecord::Migration
  def change
    create_table :cup_members do |t|
      t.integer :cup_id
      t.integer :driver_id
      t.integer :placement
      t.integer :points

      t.timestamps
    end
  end
end
