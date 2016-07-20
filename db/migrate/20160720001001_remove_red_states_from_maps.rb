class RemoveRedStatesFromMaps < ActiveRecord::Migration
  def change
    remove_column :maps, :red_states, :string
  end
end
