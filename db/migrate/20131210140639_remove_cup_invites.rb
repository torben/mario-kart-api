class RemoveCupInvites < ActiveRecord::Migration
  def change
    drop_table :cup_invites
  end
end
