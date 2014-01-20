class RenameDriverIdToUserId < ActiveRecord::Migration
  def change
    rename_column :cup_invites, :driver_id, :user_id
  end
end
