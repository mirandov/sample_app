class CreateGrapeSorts < ActiveRecord::Migration
  def change
    create_table :grape_sorts do |t|
      t.string :name, null: false
      t.string :place_of_growth, null: false
      t.date :date_of_collection, null: false

      t.timestamps null: false
      t.index [:name, :place_of_growth,:date_of_collection], unique: true, name: :my_index
    end
  end


end
