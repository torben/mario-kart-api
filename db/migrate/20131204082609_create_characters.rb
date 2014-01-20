class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :avatar_url
      t.string :size

      t.timestamps
    end
  end
end
