class RenameWinningDriverIdToWinningUserId < ActiveRecord::Migration
  def change
    rename_column :cups, :winning_driver_id, :winning_user_id
  end
end
