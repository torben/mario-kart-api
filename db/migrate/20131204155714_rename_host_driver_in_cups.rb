class RenameHostDriverInCups < ActiveRecord::Migration
  def change
    rename_column :cups, :host_driver_id, :user_id
  end
end
