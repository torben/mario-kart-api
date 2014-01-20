class AddFieldsToCubMember < ActiveRecord::Migration
  def change
    add_column :cup_members, :character_id, :integer
    rename_column :cup_members, :driver_id, :user_id
  end
end
