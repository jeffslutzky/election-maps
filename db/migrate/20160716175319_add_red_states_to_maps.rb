class AddRedStatesToMaps < ActiveRecord::Migration
  def change
    add_column :maps, :red_states, :string
  end
end
