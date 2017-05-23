class CreateWineSorts < ActiveRecord::Migration
  def change
    create_table :wine_sorts do |t|
      t.string :name, null: false, limit: 64
      t.string :type_of_wine, null: false, limit: 64
      t.string :color, null: false, limit: 30
      t.integer :barrel_extract, null: false
      t.integer :bottle_extract, null: false
      t.index [:name, :type_of_wine, :color, :barrel_extract, :bottle_extract], unique: true, name: :my_index1
      t.timestamps null: false
    end
  end
  def up
    execute("ALTER TABLE wine_sorts ADD CONSTRAINT type_of_wine_check CHECK(type_of_wine IN('Сухое',
    'Полусухое','Полусладкое',
    'Сладкое','Ликёрное', 'Другое'))")
    execute("ALTER TABLE wine_sorts ADD CONSTRAINT barrel_extract_check CHECK(barrel_extract >= 0)")
    execute("ALTER TABLE wine_sorts ADD CONSTRAINT bottle_extract_check CHECK(bottle_extract >= 0)")
  end

  def down
    execute("ALTER TABLE wine_sorts DROP CONSTRAINT type_of_wine_check")
    execute("ALTER TABLE wine_sorts DROP CONSTRAINT barrel_extract_check")
    execute("ALTER TABLE wine_sorts DROP CONSTRAINT bottle_extract_check")
  end

end
