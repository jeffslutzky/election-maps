class RemoveGrayFromMaps < ActiveRecord::Migration
  def change
    remove_column :maps, :gray, :integer
  end
end
