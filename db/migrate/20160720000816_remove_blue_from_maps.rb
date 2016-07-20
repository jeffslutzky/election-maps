class RemoveBlueFromMaps < ActiveRecord::Migration
  def change
    remove_column :maps, :blue, :integer
  end
end
