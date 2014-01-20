class CreateCupInvites < ActiveRecord::Migration
  def change
    create_table :cup_invites do |t|
      t.integer :cup_id
      t.integer :driver_id
      t.string :state

      t.timestamps
    end
  end
end
