class RemoveRedFromMaps < ActiveRecord::Migration
  def change
    remove_column :maps, :red, :integer
  end
end
