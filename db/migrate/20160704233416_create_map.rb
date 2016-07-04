class CreateMap < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :blue
      t.string :red
      t.string :gray
    end
  end
end
