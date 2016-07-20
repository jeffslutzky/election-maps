class RemoveBlueStatesFromMaps < ActiveRecord::Migration
  def change
    remove_column :maps, :blue_states, :string
  end
end
