class AddBlueStatesToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :blue_states, :string
  end
end
