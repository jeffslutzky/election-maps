class AddDataColumnToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :data, :string
  end
end
