class AddStateToCupMembers < ActiveRecord::Migration
  def change
    add_column :cup_members, :state, :string
  end
end
