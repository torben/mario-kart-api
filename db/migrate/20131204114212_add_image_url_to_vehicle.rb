class AddImageUrlToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :image_url, :string
  end
end
