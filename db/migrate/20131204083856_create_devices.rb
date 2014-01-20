class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :uuid
      t.string :apn_token

      t.timestamps
    end
  end
end
